class MinecraftVersion {
  int version = 0;
  String minecraftVersion = "";
  MinecraftEdition edition;
  String type = "";
  String majorVersion = "";
  int dataVersion = 0;

  MinecraftVersion(String version, [this.edition = MinecraftEdition.java]) {
    var versions = MinecraftData().versionsByMinecraftVersion[type];
    this.version = versions[version]['version'];
    minecraftVersion = version;
    type = edition.toPath();
    majorVersion = versions[version]['majorVersion'];
    dataVersion = versions[version]['dataVersion'];
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
