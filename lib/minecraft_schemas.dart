import 'package:minecraft_data/indexing_utils.dart';

class MinecraftSchemas {
  Map<String, dynamic> get biomes =>
      IndexingUtils.readJson('./minecraft-data/schemas/biomes_schema.json');
  Map<String, dynamic> get blocks =>
      IndexingUtils.readJson('./minecraft-data/schemas/blocks_schema.json');
  Map<String, dynamic> get effects =>
      IndexingUtils.readJson('./minecraft-data/schemas/effects_schema.json');
  Map<String, dynamic> get commands =>
      IndexingUtils.readJson('./minecraft-data/schemas/commands_schema.json');
  Map<String, dynamic> get entities =>
      IndexingUtils.readJson('./minecraft-data/schemas/entities_schema.json');
  Map<String, dynamic> get enchantments => IndexingUtils.readJson(
      './minecraft-data/schemas/enchantments_schema.json');
  Map<String, dynamic> get instruments => IndexingUtils.readJson(
      './minecraft-data/schemas/instruments_schema.json');
  Map<String, dynamic> get items =>
      IndexingUtils.readJson('./minecraft-data/schemas/items_schema.json');
  Map<String, dynamic> get materials =>
      IndexingUtils.readJson('./minecraft-data/schemas/materials_schema.json');
  Map<String, dynamic> get protocolVersions => IndexingUtils.readJson(
      './minecraft-data/schemas/protocolVersions_schema.json');
  Map<String, dynamic> get recipes =>
      IndexingUtils.readJson('./minecraft-data/schemas/recipes_schema.json');
  Map<String, dynamic> get version =>
      IndexingUtils.readJson('./minecraft-data/schemas/version_schema.json');
  Map<String, dynamic> get windows =>
      IndexingUtils.readJson('./minecraft-data/schemas/windows_schema.json');
  Map<String, dynamic> get foods =>
      IndexingUtils.readJson('./minecraft-data/schemas/foods_schema.json');
  Map<String, dynamic> get particles =>
      IndexingUtils.readJson('./minecraft-data/schemas/particles_schema.json');
  Map<String, dynamic> get mapIcons =>
      IndexingUtils.readJson('./minecraft-data/schemas/mapIcons_schema.json');
}
