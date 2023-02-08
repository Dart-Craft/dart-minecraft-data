import 'package:minecraft_data/minecraft_data.dart';

class MinecraftVersion {
  int version = 0;
  String minecraftVersion = "";
  MinecraftEdition edition;
  String type = "";
  String majorVersion = "";
  int? dataVersion = 0;

  MinecraftVersion(this.edition, String version, this.majorVersion) {
    var versions = MinecraftData().versionsByMinecraftVersion[type];

    for (var majorMinorPatchVersion
        in MinecraftData().versionsByMinecraftVersion[type]) {
      var versionObj = versions[majorMinorPatchVersion];
      if (versionObj['minecraftVersion'].endsWith('.0')) {
        versions[versionObj['majorVersion']] = versionObj;
      }
    }

    this.dataVersion = versions[version]?.dataVersion;

    // TODO: Data for Minecraft classic is missing in protocolVersions.json, move this to its own type ?
    var v1 = this.dataVersion ?? 0;
    var raise = (other) => {
          throw new RangeError(
              "Version '${other}' not found in [${versions.keys().join(' ; ')}] for ${type}")
        };
    this['>='] = (other) =>
        versions[other] ? v1 >= versions[other].dataVersion : raise(other);
    this['>'] = (other) =>
        versions[other] ? v1 > versions[other].dataVersion : raise(other);
    this['<'] = (other) =>
        versions[other] ? v1 < versions[other].dataVersion : raise(other);
    this['<='] = (other) =>
        versions[other] ? v1 <= versions[other].dataVersion : raise(other);
    this['=='] = (other) =>
        versions[other] ? v1 == versions[other].dataVersion : raise(other);
    this.type = type;
    this.majorVersion = majorVersion;

    // this.version = versions[version]['version'];
    // minecraftVersion = version;
    // type = edition.toPath();
    // majorVersion = versions[version]['majorVersion'];
    // dataVersion = versions[version]['dataVersion'];
  }

  bool operator <(dynamic ver) {
    return dataVersion < _resolveVersion(ver).dataVersion;
  }

  bool operator >(dynamic ver) {
    return dataVersion > _resolveVersion(ver).dataVersion;
  }

  @override
  bool operator ==(other) => dataVersion.hashCode == other.hashCode;

  bool operator >=(dynamic ver) {
    return dataVersion >= _resolveVersion(ver).dataVersion;
  }

  bool operator <=(dynamic ver) {
    return dataVersion <= _resolveVersion(ver).dataVersion;
  }

  @override
  int get hashCode => dataVersion.hashCode;

  MinecraftVersion _resolveVersion(version) {
    if (version is String) {
      return MinecraftVersion(version);
    } else if (version is MinecraftVersion) {
      return version;
    } else {
      throw Exception(
          "You can't compare minecraft version with ${version.runtimeType}");
    }
  }
}
