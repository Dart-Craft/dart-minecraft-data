import 'package:minecraft_data/indexing_utils.dart';

List<dynamic> features =
    IndexingUtils.readJson('../minecraft-data/data/pc/common/features.json');
Map<String, dynamic> get nameToFeature =>
    IndexingUtils.sortBykey(features, 'name');

isFeatureInRange(String featureName, MinecraftVersion versionObj) {
  // Check if feature exists
  if (!nameToFeature.containsKey(featureName)) {
    throw Exception("Feature $featureName doesn't exist");
  }
  Map<String, dynamic> feature = nameToFeature[featureName];

  // Check if feature has mutliple values
  if (feature.containsKey('values')) {
    // Yep it has miltiple values
    // Loop over values
    for (var data in feature['values']) {
      // we're using feature.version
      var value = data['value'];
      List<String> versions = data['versions'];
      String? version = data['version'];
      if (version != null) {
        var ver = version.replaceAll('_major', '');
        if (!ver.contains(RegExp(r"^d.d+\$"))) {
          throw Exception(
              'Not a correct major version value, instead the version is: "$version"');
        }
        if (versionObj.majorVersion == ver) {
          return value;
        }
      } else {
        // we're using feature.versions
        var minVer = versions[0], maxVer = versions[1];
        if (isVersionInRange(minVer, versionObj, maxVer)) {
          return value;
        }
      }
    }
    return null; // if we didn't match anything, return null
  } else {
    // No it doesn't have multiple values.
    var minVer = feature['versions'][0], maxVer = feature['versions'][1];
    return isVersionInRange(minVer, versionObj, maxVer);
  }
}

isVersionInRange(String minVer, MinecraftVersion versionObj, String maxVer) {
  var inRange = true;
  var majorVersion = versionObj;
  if (minVer.endsWith('_major')) {
    var ver = _removeMajorSuffix(minVer);
    inRange = inRange && _getVersionObj(majorVersion) >= (ver);
  } else {
    inRange = inRange && versionObj >= (minVer);
  }
  if (maxVer == 'latest') {
    // no need to check upper bound if upperbound is latest
    return inRange;
  }
  if (maxVer.endsWith('_major')) {
    var ver = _removeMajorSuffix(maxVer);
    inRange = inRange && _getVersionObj(majorVersion) <= (ver);
  } else {
    inRange = inRange && versionObj <= (maxVer);
  }
  return inRange;
}

String _removeMajorSuffix(String verStr) {
  return verStr.replaceAll('_major', '');
}

MinecraftVersion _getVersionObj(ver) {
  return MinecraftData.forVersion(ver).version;
}
