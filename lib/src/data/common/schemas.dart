import 'package:minecraft_data/src/generated/generated_minecraft_data.g.dart';

class Schemas {
  static final Schemas _instance = Schemas._privateConstructor();

  factory Schemas() {
    return _instance;
  }

  Schemas._privateConstructor();

  final biomes = GeneratedMinecraftData().getSchema('/biomes_schema.json');
  final blocks = GeneratedMinecraftData().getSchema('/blocks_schema.json');
  final effects = GeneratedMinecraftData().getSchema('/effects_schema.json');
  final commands = GeneratedMinecraftData().getSchema('/commands_schema.json');
  final entities = GeneratedMinecraftData().getSchema('/entities_schema.json');
  final enchantments =
      GeneratedMinecraftData().getSchema('/enchantments_schema.json');
  final instruments =
      GeneratedMinecraftData().getSchema('/instruments_schema.json');
  final items = GeneratedMinecraftData().getSchema('/items_schema.json');
  final materials =
      GeneratedMinecraftData().getSchema('/materials_schema.json');
  final protocolVersions =
      GeneratedMinecraftData().getSchema('/protocolVersions_schema.json');
  final recipes = GeneratedMinecraftData().getSchema('/recipes_schema.json');
  final version = GeneratedMinecraftData().getSchema('/version_schema.json');
  final windows = GeneratedMinecraftData().getSchema('/windows_schema.json');
  final foods = GeneratedMinecraftData().getSchema('/foods_schema.json');
  final particles =
      GeneratedMinecraftData().getSchema('/particles_schema.json');
  final mapIcons = GeneratedMinecraftData().getSchema('/mapIcons_schema.json');
}
