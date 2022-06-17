import 'package:minecraft_data/utils.dart';

class McSchemas {

  Map<String, dynamic> get biomes => readJson('./minecraft-data/schemas/biomes_schema.json');
  Map<String, dynamic> get blocks => readJson('./minecraft-data/schemas/blocks_schema.json');
  Map<String, dynamic> get effects => readJson('./minecraft-data/schemas/effects_schema.json');
  Map<String, dynamic> get commands => readJson('./minecraft-data/schemas/commands_schema.json');
  Map<String, dynamic> get entities => readJson('./minecraft-data/schemas/entities_schema.json');
  Map<String, dynamic> get enchantments => readJson('./minecraft-data/schemas/enchantments_schema.json');
  Map<String, dynamic> get instruments => readJson('./minecraft-data/schemas/instruments_schema.json');
  Map<String, dynamic> get items => readJson('./minecraft-data/schemas/items_schema.json');
  Map<String, dynamic> get materials => readJson('./minecraft-data/schemas/materials_schema.json');
  Map<String, dynamic> get protocolVersions => readJson('./minecraft-data/schemas/protocolVersions_schema.json');
  Map<String, dynamic> get recipes => readJson('./minecraft-data/schemas/recipes_schema.json');
  Map<String, dynamic> get version => readJson('./minecraft-data/schemas/version_schema.json');
  Map<String, dynamic> get windows => readJson('./minecraft-data/schemas/windows_schema.json');
  Map<String, dynamic> get foods => readJson('./minecraft-data/schemas/foods_schema.json');
  Map<String, dynamic> get particles => readJson('./minecraft-data/schemas/particles_schema.json');
  Map<String, dynamic> get mapIcons => readJson('./minecraft-data/schemas/mapIcons_schema.json');

}