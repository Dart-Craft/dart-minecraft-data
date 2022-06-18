import 'package:minecraft_data/utils.dart';

class MinecraftSchemas {

  Map<String, dynamic> get biomes => Utils.readJson('./minecraft-data/schemas/biomes_schema.json');
  Map<String, dynamic> get blocks => Utils.readJson('./minecraft-data/schemas/blocks_schema.json');
  Map<String, dynamic> get effects => Utils.readJson('./minecraft-data/schemas/effects_schema.json');
  Map<String, dynamic> get commands => Utils.readJson('./minecraft-data/schemas/commands_schema.json');
  Map<String, dynamic> get entities => Utils.readJson('./minecraft-data/schemas/entities_schema.json');
  Map<String, dynamic> get enchantments => Utils.readJson('./minecraft-data/schemas/enchantments_schema.json');
  Map<String, dynamic> get instruments => Utils.readJson('./minecraft-data/schemas/instruments_schema.json');
  Map<String, dynamic> get items => Utils.readJson('./minecraft-data/schemas/items_schema.json');
  Map<String, dynamic> get materials => Utils.readJson('./minecraft-data/schemas/materials_schema.json');
  Map<String, dynamic> get protocolVersions => Utils.readJson('./minecraft-data/schemas/protocolVersions_schema.json');
  Map<String, dynamic> get recipes => Utils.readJson('./minecraft-data/schemas/recipes_schema.json');
  Map<String, dynamic> get version => Utils.readJson('./minecraft-data/schemas/version_schema.json');
  Map<String, dynamic> get windows => Utils.readJson('./minecraft-data/schemas/windows_schema.json');
  Map<String, dynamic> get foods => Utils.readJson('./minecraft-data/schemas/foods_schema.json');
  Map<String, dynamic> get particles => Utils.readJson('./minecraft-data/schemas/particles_schema.json');
  Map<String, dynamic> get mapIcons => Utils.readJson('./minecraft-data/schemas/mapIcons_schema.json');

}