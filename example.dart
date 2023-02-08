import 'package:minecraft_data/minecraft_data.dart';

void main(List<String> args) {
  var mcData = MinecraftData.forVersion('1.8.8');

  print(mcData.blocksByName["stone"]);
  print(mcData.windows['minecraft:brewing_stand']);
  print(mcData.version);
  print(mcData.effectsByName["Haste"]);

  print(mcData.mobs[62]);
  print(mcData.objects[62]);

  print(MinecraftData().versionsByMinecraftVersion["pc"]['1.8.8']);

  print(MinecraftData().versionsByMinecraftVersion["pc"]['15w40b']);

  print(MinecraftData().preNettyVersionsByProtocolVersion["pc"][47]);

  print(MinecraftData().postNettyVersionsByProtocolVersion["pc"][47][0]);

  print(MinecraftData.forVersion(47).version);

  print(MinecraftData.forVersion('1.8').version);

  print(MinecraftData.forVersion('15w40b').version);

  print(MinecraftData.forVersion('0.30c').version);

  print(MinecraftData.forVersion('bedrock_0.14').version);

  print(MinecraftData.forVersion('pc_1.9').blocksByName['dirt']);
  print(MinecraftData.forVersion('bedrock_0.14').blocksByName['podzol']);
  print(MinecraftData.forVersion('bedrock_0.14').type);

  print(MinecraftData.forVersion('1.8').enchantments[5]);

  print(MinecraftData().supportedVersions['pc']);

  print(MinecraftData.forVersion('1.12').language['options.sensitivity.max']);

  print(MinecraftData.forVersion('1.13.2').blocksByStateId[3381]);

  print(MinecraftData.forVersion('1.13.2').particles[2]);

  print(MinecraftData.forVersion('1.16.1').blockLoot['stone']);

  print(MinecraftData.forVersion('1.16.1').loginPacket);

  print(MinecraftData.forVersion('1.16.4').mapIconsByName['player']);

  print(MinecraftData().legacy['pc']['blocks']['0:0']);

  print(MinecraftData.forVersion('1.15.2').attributes['generic.movementSpeed']);
  print(MinecraftData.forVersion('1.16')
      .attributes['minecraft:generic.movement_speed']);
  print(MinecraftData.forVersion('1.15.2').attributesByName['movementSpeed']);
  print(MinecraftData.forVersion('1.16').attributesByName['movementSpeed']);
}
