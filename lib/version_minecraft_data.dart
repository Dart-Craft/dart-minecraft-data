import 'package:minecraft_data/minecraft_data.dart';
import 'package:minecraft_data/supports_feature.dart';
import 'package:minecraft_data/utils.dart';

class VersionMinecraftData extends MinecraftData {
  Map<String, dynamic> paths = {};

  VersionMinecraftData(version,
      [MinecraftEdition edition = MinecraftEdition.java])
      : super() {
    this.version = MinecraftVersion(version, edition);
    var versions = Utils.readJson('./minecraft-data/data/dataPaths.json');
    assert(versions[edition.toPath()].containsKey(version), "Invalid version!");
    paths = versions[edition.toPath()][version];
  }

  // Blocks

  Map<String, dynamic> get blocks => Utils.sortBykey(blocksArray, "id");

  Map<String, dynamic> get blocksByName => Utils.sortBykey(blocksArray, "name");

  List<dynamic> get blocksArray =>
      Utils.readJson('./minecraft-data/data/${paths["blocks"]}/blocks.json');

  Map<String, dynamic> get blocksByStateId =>
      Utils.sortWithRanges(blocksArray, "minStateId", "maxStateId");

  Map<String, dynamic> get blockCollisionShapes => Utils.readJson(
      './minecraft-data/data/${paths["blockCollisionShapes"]}/blockCollisionShapes.json');

  // Items

  Map<String, dynamic> get items => Utils.sortBykey(itemsArray, "id");

  Map<String, dynamic> get itemsByName => Utils.sortBykey(itemsArray, "name");

  List<dynamic> get itemsArray =>
      Utils.readJson('./minecraft-data/data/${paths["items"]}/items.json');

  // Foods

  Map<String, dynamic> get foods => Utils.sortBykey(foodsArray, "id");

  Map<String, dynamic> get foodsByName => Utils.sortBykey(foodsArray, "name");

  Map<String, dynamic> get foodsByFoodPoints =>
      Utils.sortBykey(foodsArray, "foodPoints");

  Map<String, dynamic> get foodsBySaturation =>
      Utils.sortBykey(foodsArray, "saturation");

  List<dynamic> get foodsArray =>
      Utils.readJson('./minecraft-data/data/${paths["foods"]}/foods.json');

  // Biomes

  Map<String, dynamic> get biomes => Utils.sortBykey(biomesArray, "id");

  Map<String, dynamic> get biomesByName => Utils.sortBykey(biomesArray, "name");

  List<dynamic> get biomesArray =>
      Utils.readJson('./minecraft-data/data/${paths["biomes"]}/biomes.json');

  // Recipes

  Map<String, dynamic> get recipes =>
      Utils.readJson('./minecraft-data/data/${paths["recipes"]}/recipes.json');

  // Instruments

  Map<String, dynamic> get instruments =>
      Utils.sortBykey(instrumentsArray, "id");

  List<dynamic> get instrumentsArray => Utils.readJson(
      './minecraft-data/data/${paths["instruments"]}/instruments.json');

  // Materials

  Map<String, dynamic> get materials => Utils.readJson(
      './minecraft-data/data/${paths["materials"]}/materials.json');

  // Entities

  Map<String, dynamic> get mobs {
    return Utils.sortBykey(
        entitiesArray.where((element) => element['type'] == "mob"), 'id');
  }

  Map<String, dynamic> get objects {
    return Utils.sortBykey(
        entitiesArray.where((element) => element['type'] == "object"), 'id');
  }

  Map<String, dynamic> get entitiesByName =>
      Utils.sortBykey(entitiesArray, "name");

  List<dynamic> get entitiesArray => Utils.readJson(
      './minecraft-data/data/${paths["entities"]}/entities.json');

  // Enchantments

  Map<String, dynamic> get enchntments =>
      Utils.sortBykey(enchntmentsArray, "id");

  Map<String, dynamic> get enchntmentsByName =>
      Utils.sortBykey(enchntmentsArray, "name");

  List<dynamic> get enchntmentsArray => Utils.readJson(
      './minecraft-data/data/${paths["enchntments"]}/enchntments.json');

  // Skin (BE only)

  Map<String, dynamic> get defaultSkin {
    assert(version.edition == MinecraftEdition.bedrock,
        "This data is only available for bedrock!");
    return Utils.readJson('./minecraft-data/data/${paths["steve"]}/steve.json');
  }
  // Protocol

  Map<String, dynamic> get protocol => Utils.readJson(
      './minecraft-data/data/${paths["protocol"]}/protocol.json');

  Map<String, dynamic> get protocolComments => Utils.readJson(
      './minecraft-data/data/${paths["protocolComments"]}/protocolComments.json');

  // Windows

  Map<String, dynamic> get windows => Utils.sortBykey(windowsArray, "id");

  Map<String, dynamic> get windowsByName =>
      Utils.sortBykey(windowsArray, "name");

  List<dynamic> get windowsArray =>
      Utils.readJson('./minecraft-data/data/${paths["windows"]}/windows.json');

  late MinecraftVersion version;

  // Effects

  Map<String, dynamic> get effects => Utils.sortBykey(effectsArray, "id");

  Map<String, dynamic> get effectsByName =>
      Utils.sortBykey(effectsArray, "name");

  List<dynamic> get effectsArray =>
      Utils.readJson('./minecraft-data/data/${paths["effects"]}/effects.json');

  // Attributes

  Map<String, dynamic> get attributes =>
      Utils.sortBykey(attributesArray, "resource");

  Map<String, dynamic> get attributesByName =>
      Utils.sortBykey(attributesArray, "name");

  List<dynamic> get attributesArray => Utils.readJson(
      './minecraft-data/data/${paths["attributes"]}/attributes.json');

  // Particles

  Map<String, dynamic> get particles =>
      Utils.sortBykey(particlesArray, "resource");

  Map<String, dynamic> get particlesByName =>
      Utils.sortBykey(particlesArray, "name");

  List<dynamic> get particlesArray => Utils.readJson(
      './minecraft-data/data/${paths["particles"]}/particles.json');

  // Commands

  Map<String, dynamic> get commands => Utils.readJson(
      './minecraft-data/data/${paths["commands"]}/commands.json');

  // Loot

  Map<String, dynamic> get entityLoot =>
      Utils.sortBykey(entityLootArray, "name");

  List<dynamic> get entityLootArray => Utils.readJson(
      './minecraft-data/data/${paths["entityLoot"]}/entityLoot.json');

  Map<String, dynamic> get blockLoot => Utils.sortBykey(blockLootArray, "name");

  List<dynamic> get blockLootArray => Utils.readJson(
      './minecraft-data/data/${paths["blockLoot"]}/blockLoot.json');

  // Map icons

  Map<String, dynamic> get mapIcons =>
      Utils.sortBykey(mapIconsArray, "resource");

  Map<String, dynamic> get mapIconsByName =>
      Utils.sortBykey(mapIconsArray, "name");

  List<dynamic> get mapIconsArray => Utils.readJson(
      './minecraft-data/data/${paths["mapIcons"]}/mapIcons.json');

  // Type

  String get type {
    if (version.edition == MinecraftEdition.java) {
      return 'pc';
    } else {
      return 'pe';
    }
  }

  // Language

  Map<String, dynamic> get language => Utils.readJson(
      './minecraft-data/data/${paths["language"]}/language.json');

  // Login packet

  Map<String, dynamic> get loginPacket => Utils.readJson(
      './minecraft-data/data/${paths["loginPacket"]}/loginPacket.json');

  supportFeature(String featureName) {
    return isFeatureInRange(featureName, this.version);
  }
}
