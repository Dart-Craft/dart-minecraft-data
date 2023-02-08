part of 'package:minecraft_data/minecraft_data.dart';


class MinecraftData {
  static final Map<String, MinecraftData> _cache = {};

  final Map<String, dynamic> versions = {
    'pc': SortingUtils.readJson(
        './minecraft-data/data/pc/common/protocolVersions.json'),
    'bedrock': SortingUtils.readJson(
        './minecraft-data/data/bedrock/common/protocolVersions.json')
  };

  Map<String, dynamic> versionsByMinecraftVersion = {};
  Map<String, dynamic> versionsByMajorVersion = {};
  Map<String, dynamic> preNettyVersionsByProtocolVersion = {};
  Map<String, dynamic> postNettyVersionsByProtocolVersion = {};

  factory MinecraftData(String version,
      [MinecraftEdition edition = MinecraftEdition.java]) {
    const types = ['pc', 'bedrock'];
    for (var type in types) {
      for (var i = 0; i < versions[type].length; i++) {
        if (!versions[type][i].containsKey('dataVersion')) {
          // We start top to bottom, so the ones at the bottom should be lower
          versions[type][i]['dataVersion'] = -i;
        }
      }
      versionsByMinecraftVersion[type] =
          SortingUtils.sortBykey(versions[type], 'minecraftVersion');
      versionsByMajorVersion[type] = SortingUtils.sortBykey(
          List.from(versions[type]).reversed, 'majorVersion');
      bool nettyCheck(Map<String, dynamic> toCheck) {
        if (toCheck.containsKey('usesNetty')) {
          return toCheck['usesNetty'];
        }
        return false;
      }

      preNettyVersionsByProtocolVersion[type] = SortingUtils.sortByKeyNonUnique(
          versions[type].where((e) => !nettyCheck(e)), 'version');
      postNettyVersionsByProtocolVersion[type] =
          SortingUtils.sortByKeyNonUnique(
              versions[type].where((e) => nettyCheck(e)), 'version');
    }

    VersionMinecraftData(version,
      [MinecraftEdition edition = MinecraftEdition.java])
      : super() {
    this.version = MinecraftVersion(version, edition);
    var versions =
        SortingUtils.readJson('./minecraft-data/data/dataPaths.json');
    assert(versions[edition.toPath()].containsKey(version), "Invalid version!");
    paths = versions[edition.toPath()][version];
  }

    var cachedName = '${edition.toString()}_$version';
    if (_cache.containsKey(cachedName)) {
      return _cache[cachedName]!;
    }
    var data = VersionMinecraftData(version, edition);
    _cache[cachedName] = data;
    return data;
  }

  //

  Map<String, dynamic> get legacy =>
      SortingUtils.readJson('./minecraft-data/data/pc/common/legacy.json');

  // Supported versions

  Map<String, dynamic> supportedVersions = {
    'pc':
        SortingUtils.readJson('./minecraft-data/data/pc/common/versions.json'),
    'bedrock': SortingUtils.readJson(
        './minecraft-data/data/bedrock/common/versions.json')
  };

  // Schemas

  MinecraftSchemas schemas = MinecraftSchemas();

  Map<String, dynamic> paths = {};


  // Blocks

  Map<String, dynamic> get blocks => SortingUtils.sortBykey(blocksArray, "id");

  Map<String, dynamic> get blocksByName =>
      SortingUtils.sortBykey(blocksArray, "name");

  List<dynamic> get blocksArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["blocks"]}/blocks.json');

  Map<String, dynamic> get blocksByStateId =>
      SortingUtils.sortWithRanges(blocksArray, "minStateId", "maxStateId");

  Map<String, dynamic> get blockCollisionShapes => SortingUtils.readJson(
      './minecraft-data/data/${paths["blockCollisionShapes"]}/blockCollisionShapes.json');

  // Items

  Map<String, dynamic> get items => SortingUtils.sortBykey(itemsArray, "id");

  Map<String, dynamic> get itemsByName =>
      SortingUtils.sortBykey(itemsArray, "name");

  List<dynamic> get itemsArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["items"]}/items.json');

  // Foods

  Map<String, dynamic> get foods => SortingUtils.sortBykey(foodsArray, "id");

  Map<String, dynamic> get foodsByName =>
      SortingUtils.sortBykey(foodsArray, "name");

  Map<String, dynamic> get foodsByFoodPoints =>
      SortingUtils.sortBykey(foodsArray, "foodPoints");

  Map<String, dynamic> get foodsBySaturation =>
      SortingUtils.sortBykey(foodsArray, "saturation");

  List<dynamic> get foodsArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["foods"]}/foods.json');

  // Biomes

  Map<String, dynamic> get biomes => SortingUtils.sortBykey(biomesArray, "id");

  Map<String, dynamic> get biomesByName =>
      SortingUtils.sortBykey(biomesArray, "name");

  List<dynamic> get biomesArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["biomes"]}/biomes.json');

  // Recipes

  Map<String, dynamic> get recipes => SortingUtils.readJson(
      './minecraft-data/data/${paths["recipes"]}/recipes.json');

  // Instruments

  Map<String, dynamic> get instruments =>
      SortingUtils.sortBykey(instrumentsArray, "id");

  List<dynamic> get instrumentsArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["instruments"]}/instruments.json');

  // Materials

  Map<String, dynamic> get materials => SortingUtils.readJson(
      './minecraft-data/data/${paths["materials"]}/materials.json');

  // Entities

  Map<String, dynamic> get mobs {
    return SortingUtils.sortBykey(
        entitiesArray.where((element) => element['type'] == "mob"), 'id');
  }

  Map<String, dynamic> get objects {
    return SortingUtils.sortBykey(
        entitiesArray.where((element) => element['type'] == "object"), 'id');
  }

  Map<String, dynamic> get entitiesByName =>
      SortingUtils.sortBykey(entitiesArray, "name");

  List<dynamic> get entitiesArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["entities"]}/entities.json');

  // Enchantments

  Map<String, dynamic> get enchntments =>
      SortingUtils.sortBykey(enchntmentsArray, "id");

  Map<String, dynamic> get enchntmentsByName =>
      SortingUtils.sortBykey(enchntmentsArray, "name");

  List<dynamic> get enchntmentsArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["enchntments"]}/enchntments.json');

  // Skin (BE only)

  Map<String, dynamic> get defaultSkin {
    assert(version.edition == MinecraftEdition.bedrock,
        "This data is only available for bedrock!");
    return SortingUtils.readJson(
        './minecraft-data/data/${paths["steve"]}/steve.json');
  }
  // Protocol

  Map<String, dynamic> get protocol => SortingUtils.readJson(
      './minecraft-data/data/${paths["protocol"]}/protocol.json');

  Map<String, dynamic> get protocolComments => SortingUtils.readJson(
      './minecraft-data/data/${paths["protocolComments"]}/protocolComments.json');

  // Windows

  Map<String, dynamic> get windows =>
      SortingUtils.sortBykey(windowsArray, "id");

  Map<String, dynamic> get windowsByName =>
      SortingUtils.sortBykey(windowsArray, "name");

  List<dynamic> get windowsArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["windows"]}/windows.json');

  late MinecraftVersion version;

  // Effects

  Map<String, dynamic> get effects =>
      SortingUtils.sortBykey(effectsArray, "id");

  Map<String, dynamic> get effectsByName =>
      SortingUtils.sortBykey(effectsArray, "name");

  List<dynamic> get effectsArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["effects"]}/effects.json');

  // Attributes

  Map<String, dynamic> get attributes =>
      SortingUtils.sortBykey(attributesArray, "resource");

  Map<String, dynamic> get attributesByName =>
      SortingUtils.sortBykey(attributesArray, "name");

  List<dynamic> get attributesArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["attributes"]}/attributes.json');

  // Particles

  Map<String, dynamic> get particles =>
      SortingUtils.sortBykey(particlesArray, "resource");

  Map<String, dynamic> get particlesByName =>
      SortingUtils.sortBykey(particlesArray, "name");

  List<dynamic> get particlesArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["particles"]}/particles.json');

  // Commands

  Map<String, dynamic> get commands => SortingUtils.readJson(
      './minecraft-data/data/${paths["commands"]}/commands.json');

  // Loot

  Map<String, dynamic> get entityLoot =>
      SortingUtils.sortBykey(entityLootArray, "name");

  List<dynamic> get entityLootArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["entityLoot"]}/entityLoot.json');

  Map<String, dynamic> get blockLoot =>
      SortingUtils.sortBykey(blockLootArray, "name");

  List<dynamic> get blockLootArray => SortingUtils.readJson(
      './minecraft-data/data/${paths["blockLoot"]}/blockLoot.json');

  // Map icons

  Map<String, dynamic> get mapIcons =>
      SortingUtils.sortBykey(mapIconsArray, "resource");

  Map<String, dynamic> get mapIconsByName =>
      SortingUtils.sortBykey(mapIconsArray, "name");

  List<dynamic> get mapIconsArray => SortingUtils.readJson(
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

  Map<String, dynamic> get language => SortingUtils.readJson(
      './minecraft-data/data/${paths["language"]}/language.json');

  // Login packet

  Map<String, dynamic> get loginPacket => SortingUtils.readJson(
      './minecraft-data/data/${paths["loginPacket"]}/loginPacket.json');

  // SupportFeature

  supportFeature(String featureName) {
    return isFeatureInRange(featureName, version);
  }

  // Comparsion

  isNewerOrEqualTo(version) => this.version >= (version);
  isOlderThan(version) => this.version < (version);
}