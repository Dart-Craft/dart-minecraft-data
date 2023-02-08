class ProtocolVersion {
  int version;
  int? dataVersion;
  String minecraftVersion;
  String majorVersion;
  bool? usesNetty;
  String? releaseType;

  ProtocolVersion(
      {required this.version,
      this.dataVersion,
      required this.minecraftVersion,
      required this.majorVersion,
      this.usesNetty,
      this.releaseType});

  factory ProtocolVersion.fromJson(Map<String, dynamic> json) {
    return ProtocolVersion(
        version: json["version"],
        dataVersion: json["dataVersion"],
        minecraftVersion: json["minecraftVersion"],
        majorVersion: json["majorVersion"],
        usesNetty: json["usesNetty"],
        releaseType: json["releaseType"]);
  }

  @override
  String toString() {
    return """ProtocolVersion {
          version: $version,
          dataVersion: $dataVersion,
          minecraftVersion: $minecraftVersion,
          majorVersion: $majorVersion,
          usesNetty: $usesNetty,
          releaseType: $releaseType
      }""";
  }
}
