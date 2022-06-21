// Main file, intended to be imported.

import 'package:minecraft_data/version_minecraft_data.dart';
import 'package:minecraft_data/minecraft_schemas.dart';
import 'package:minecraft_data/utils.dart';
import 'package:minecraft_data/minecraft_edition.dart';

export 'version_minecraft_data.dart';
export 'minecraft_version.dart';
export 'minecraft_edition.dart';

class MinecraftData {
  static final Map<String, VersionMinecraftData> _cache = {};

  final Map<String, dynamic> versions = {
    'pc':
        Utils.readJson('./minecraft-data/data/pc/common/protocolVersions.json'),
    'bedrock': Utils.readJson(
        './minecraft-data/data/bedrock/common/protocolVersions.json')
  };

  Map<String, dynamic> versionsByMinecraftVersion = {};
  Map<String, dynamic> versionsByMajorVersion = {};
  Map<String, dynamic> preNettyVersionsByProtocolVersion = {};
  Map<String, dynamic> postNettyVersionsByProtocolVersion = {};

  MinecraftData() {
    const types = ['pc', 'bedrock'];
    for (var type in types) {
      for (var i = 0; i < versions[type].length; i++) {
        if (!versions[type][i].containsKey('dataVersion')) {
          // We start top to bottom, so the ones at the bottom should be lower
          versions[type][i]['dataVersion'] = -i;
        }
      }
      versionsByMinecraftVersion[type] =
          Utils.sortBykey(versions[type], 'minecraftVersion');
      versionsByMajorVersion[type] =
          Utils.sortBykey(List.from(versions[type]).reversed, 'majorVersion');
      bool nettyCheck(Map<String, dynamic> toCheck) {
        if (toCheck.containsKey('usesNetty')) {
          return toCheck['usesNetty'];
        }
        return false;
      }

      preNettyVersionsByProtocolVersion[type] = Utils.sortByKeyNonUnique(
          versions[type].where((e) => !nettyCheck(e)), 'version');
      postNettyVersionsByProtocolVersion[type] = Utils.sortByKeyNonUnique(
          versions[type].where((e) => nettyCheck(e)), 'version');
    }
  }

  static VersionMinecraftData forVersion(String version,
      [MinecraftEdition edition = MinecraftEdition.java]) {
    var cachedName = '${edition.toString()}_$version';
    if (_cache.containsKey(cachedName)) {
      return _cache[cachedName]!;
    }
    var data = VersionMinecraftData(version, edition);
    _cache[cachedName] = data;
    return data;
  }

  //

  Map<String, dynamic> get legacy =>
      Utils.readJson('./minecraft-data/data/pc/common/legacy.json');

  // Supported versions

  Map<String, dynamic> supportedVersions = {
    'pc': Utils.readJson('./minecraft-data/data/pc/common/versions.json'),
    'bedrock':
        Utils.readJson('./minecraft-data/data/bedrock/common/versions.json')
  };

  // Schemas

  MinecraftSchemas schemas = MinecraftSchemas();
}
