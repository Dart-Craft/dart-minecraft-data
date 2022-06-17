
import 'package:minecraft_data/schemas.dart';
import 'package:minecraft_data/utils.dart';

class MinecraftData {

  String version;
  MinecraftEdition edition;
  Map<String, dynamic> paths = {};

  MinecraftData(this.version, [this.edition = MinecraftEdition.java]) {
    var versions = readJson('./minecraft-data/data/dataPaths.json');
    assert(versions[edition.toPath()].containsKey(version), "Invalid version!");
    paths = versions[edition.toPath()][version];
    
  }

  // Blocks

  Map<String, dynamic> get blocks => sortBykey(blocksArray, "id");

  Map<String, dynamic> get blocksByName => sortBykey(blocksArray, "name");

  List<dynamic> get blocksArray => readJson('./minecraft-data/data/${paths["blocks"]}/blocks.json');

  Map<String, dynamic> get blocksByStateId => sortBykeyWithRanges(blocksArray, "minStateId", "maxStateId");
    
  Map<String, dynamic> get blockCollisionShapes => readJson('./minecraft-data/data/${paths["blockCollisionShapes"]}/blockCollisionShapes.json');

  // Items

  Map<String, dynamic> get items => sortBykey(itemsArray, "id");

  Map<String, dynamic> get itemsByName => sortBykey(itemsArray, "name");

  List<dynamic> get itemsArray => readJson('./minecraft-data/data/${paths["items"]}/items.json');

  // Foods

  Map<String, dynamic> get foods => sortBykey(foodsArray, "id");

  Map<String, dynamic> get foodsByName => sortBykey(foodsArray, "name");

  Map<String, dynamic> get foodsByFoodPoints => sortBykey(foodsArray, "foodPoints");

  Map<String, dynamic> get foodsBySaturation => sortBykey(foodsArray, "saturation");

  List<dynamic> get foodsArray => readJson('./minecraft-data/data/${paths["foods"]}/foods.json');

  // Biomes

  Map<String, dynamic> get biomes => sortBykey(biomesArray, "id");

  Map<String, dynamic> get biomesByName => sortBykey(biomesArray, "name");

  List<dynamic> get biomesArray => readJson('./minecraft-data/data/${paths["biomes"]}/biomes.json');

  // Recipes

  Map<String, dynamic> get recipes => readJson('./minecraft-data/data/${paths["recipes"]}/recipes.json');

  // Instruments

  Map<String, dynamic> get instruments => sortBykey(instrumentsArray, "id");

  List<dynamic> get instrumentsArray => readJson('./minecraft-data/data/${paths["instruments"]}/instruments.json');

  // Materials

  Map<String, dynamic> get materials => readJson('./minecraft-data/data/${paths["materials"]}/materials.json');

  // Entities

  Map<String, dynamic> get mobs {
    return sortBykey(entitiesArray.where((element) => element['type'] == "mob"), 'id');
  }


  Map<String, dynamic> get objects {
    return sortBykey(entitiesArray.where((element) => element['type'] == "object"), 'id');
  }


  Map<String, dynamic> get entitiesByName => sortBykey(entitiesArray, "name");


  List<dynamic> get entitiesArray => readJson('./minecraft-data/data/${paths["entities"]}/entities.json');

  // Enchantments

  Map<String, dynamic> get enchntments => sortBykey(enchntmentsArray, "id");

  Map<String, dynamic> get enchntmentsByName => sortBykey(enchntmentsArray, "name");

  List<dynamic> get enchntmentsArray => readJson('./minecraft-data/data/${paths["enchntments"]}/enchntments.json');

  // Skin (BE only)

  Map<String, dynamic> get defaultSkin {
    assert(edition == MinecraftEdition.bedrock, "This data is only available for bedrock!");
    return readJson('./minecraft-data/data/${paths["steve"]}/steve.json');
  }
  // Protocol

  Map<String, dynamic> get protocol => readJson('./minecraft-data/data/${paths["protocol"]}/protocol.json');
  
  Map<String, dynamic> get protocolComments => readJson('./minecraft-data/data/${paths["protocolComments"]}/protocolComments.json');
  
  // Windows

  Map<String, dynamic> get windows => sortBykey(windowsArray, "id");

  Map<String, dynamic> get windowsByName => sortBykey(windowsArray, "name");

  List<dynamic> get windowsArray => readJson('./minecraft-data/data/${paths["windows"]}/windows.json');

  // FIXME Versions

  // Effects

  Map<String, dynamic> get effects => sortBykey(effectsArray, "id");

  Map<String, dynamic> get effectsByName => sortBykey(effectsArray, "name");

  List<dynamic> get effectsArray => readJson('./minecraft-data/data/${paths["effects"]}/effects.json');

  // Attributes

  Map<String, dynamic> get attributes => sortBykey(attributesArray, "resource");

  Map<String, dynamic> get attributesByName => sortBykey(attributesArray, "name");

  List<dynamic> get attributesArray => readJson('./minecraft-data/data/${paths["attributes"]}/attributes.json');

  // Particles

  Map<String, dynamic> get particles => sortBykey(particlesArray, "resource");

  Map<String, dynamic> get particlesByName => sortBykey(particlesArray, "name");

  List<dynamic> get particlesArray => readJson('./minecraft-data/data/${paths["particles"]}/particles.json');

  // Commands

  Map<String, dynamic> get commands => readJson('./minecraft-data/data/${paths["commands"]}/commands.json');

  // Loot

  Map<String, dynamic> get entityLoot => sortBykey(entityLootArray, "name");

  List<dynamic> get entityLootArray => readJson('./minecraft-data/data/${paths["entityLoot"]}/entityLoot.json');

  Map<String, dynamic> get blockLoot => sortBykey(blockLootArray, "name");

  List<dynamic> get blockLootArray => readJson('./minecraft-data/data/${paths["blockLoot"]}/blockLoot.json');

  // Map icons

  Map<String, dynamic> get mapIcons => sortBykey(mapIconsArray, "resource");

  Map<String, dynamic> get mapIconsByName => sortBykey(mapIconsArray, "name");

  List<dynamic> get mapIconsArray => readJson('./minecraft-data/data/${paths["mapIcons"]}/mapIcons.json');

  // Type

  String get type {
    if (edition == MinecraftEdition.java) {
      return 'pc';
    }
    else {
      return 'pe';
    }
  }

  // Language

  Map<String, dynamic> get language => readJson('./minecraft-data/data/${paths["language"]}/language.json');  

  // Login packet

  Map<String, dynamic> get loginPacket => readJson('./minecraft-data/data/${paths["loginPacket"]}/loginPacket.json');  

  // FIXME Protocol versions

  // Schemas

  McSchemas schemas = McSchemas();







}