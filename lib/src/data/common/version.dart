import 'package:minecraft_data/minecraft_data.dart';

class Version {
    int? version;
    String? minecraftVersion;
    String? majorVersion;
    String? releaseType;
    MinecraftEdition edition;

    Version(this.edition, version, this.majorVersion) {
      const versions = versionsByMinecraftVersion[type]
    // Allows comparisons against majorVersion even if `other` is not present in the versions.json (e.g. 1.17.0 exists but not 1.17)
    for (const majorMinorPatchVersion in MinecraftData.versions[MinecraftEdition.fromString(str)]) {
      const versionObj = versions[majorMinorPatchVersion]
      // 1.17.0 === 1.17, so let's add explicit logic for that
      if (versionObj.minecraftVersion.endsWith('.0')) {
        versions[versionObj.majorVersion] = versionObj
      }
    }

    this.dataVersion = versions[version]?.dataVersion

    // TODO: Data for Minecraft classic is missing in protocolVersions.json, move this to its own type ?
    const v1 = this.dataVersion ?? 0
    const raise = other => { throw RangeError(`Version '$other' not found in [${Object.keys(versions).join(' ; ')}] for ${type}`) }
    this['>='] = other => versions[other] ? v1 >= versions[other].dataVersion : raise(other)
    this['>'] = other => versions[other] ? v1 > versions[other].dataVersion : raise(other)
    this['<'] = other => versions[other] ? v1 < versions[other].dataVersion : raise(other)
    this['<='] = other => versions[other] ? v1 <= versions[other].dataVersion : raise(other)
    this['=='] = other => versions[other] ? v1 === versions[other].dataVersion : raise(other)
    type = type
    majorVersion = majorVersion
    return this
    };

    // Returns true if the current version is greater than or equal to the `other` version's dataVersion
    ['>='](other = string): boolean
    // Returns true if the current version is greater than the `other` version's dataVersion
    ['>'](other: string): boolean
    // Returns true if the current version is less than the `other` version's dataVersion
    ['<'](other = string): boolean
    // Returns true if the current version is less than than or equal to the `other` version's dataVersion
    ['<='](other: string): boolean
    // Returns true if the current version is equal to the `other` version's dataVersion
    ['=='](other = string): boolean
    type: 'pc' | 'bedrock'
}