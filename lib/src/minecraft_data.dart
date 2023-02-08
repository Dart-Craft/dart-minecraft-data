import 'package:minecraft_data/indexing_utils.dart';
import 'package:minecraft_data/minecraft_edition.dart';
import 'package:minecraft_data/src/data/common/protocol_version.dart';
import 'package:minecraft_data/src/data/common/schemas.dart';
import 'package:minecraft_data/src/data/edition_map.dart';
import 'package:minecraft_data/src/generated/generated_minecraft_data.g.dart';

class MinecraftData {
  static final Map<String, MinecraftData> _cache = {};

  factory MinecraftData(dynamic version, [bool preNetty = false]) {
    if (!(versions is int || version is String)) {
      throw ArgumentError.value(version, "version",
          "Minecraft Data constructor expects an int or a string but got ${version.runtimeType}");
    }
    return MinecraftData._constructor();
  }

  MinecraftData._constructor();

  //
  //
  // Static stuff
  // Version independant.
  //
  //

  static final EditionMap<List> supportedVersions = EditionMap(
      GeneratedMinecraftData().getData('/pc/common/versions.json'),
      GeneratedMinecraftData().getData('/bedrock/common/versions.json'));

  static final EditionMap<List<ProtocolVersion>> versions = _initVersions();

  static EditionMap<List<ProtocolVersion>> _initVersions() {
    Map<MinecraftEdition, List<ProtocolVersion>> vers = {};

    for (MinecraftEdition edition in MinecraftEdition.values) {
      List json = GeneratedMinecraftData()
          .getData('/${edition.toPath()}/common/protocolVersions.json');
      var protocolVersions =
          json.map((e) => ProtocolVersion.fromJson(e)).toList(growable: false);
      for (var i = 0; i < protocolVersions.length; i++) {
        // We start top to bottom, so the ones at the bottom should be lower
        // We use the ??= operator to assing a value if the current one is null
        protocolVersions[i].dataVersion ??= -i;
      }
      vers[edition] = protocolVersions;
    }
    return EditionMap(
        vers[MinecraftEdition.java]!, vers[MinecraftEdition.bedrock]!);
  }

  static final EditionMap<Map<String, ProtocolVersion>>
      versionsByMinecraftVersion = EditionMap(
    IndexingUtils.indexByKey(versions.java, (ver) => ver.minecraftVersion),
    IndexingUtils.indexByKey(versions.bedrock, (ver) => ver.minecraftVersion),
  );

  static final EditionMap<Map<dynamic, List<ProtocolVersion>>>
      preNettyVersionsByProtocolVersion = EditionMap(
    IndexingUtils.indexByKeyNonUnique(
        versions.java.where((element) => !(element.usesNetty ?? false)),
        (ver) => ver.version),
    IndexingUtils.indexByKeyNonUnique(
        versions.bedrock.where((element) => !(element.usesNetty ?? false)),
        (ver) => ver.version),
  );

  static final EditionMap<Map<dynamic, List<ProtocolVersion>>>
      postNettyVersionsByProtocolVersion = EditionMap(
    IndexingUtils.indexByKeyNonUnique(
        versions.java.where((element) => element.usesNetty ?? false),
        (ver) => ver.version),
    IndexingUtils.indexByKeyNonUnique(
        versions.bedrock.where((element) => element.usesNetty ?? false),
        (ver) => ver.version),
  );

  static final Map<String, dynamic> legacy =
      GeneratedMinecraftData().getData('/pc/common/legacy.json');

  static final Schemas schemas = Schemas();
}
