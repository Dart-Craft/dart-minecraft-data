
import 'package:minecraft_data/mc_data.dart';


void main(List<String> args) {
  var mcdata = MinecraftData("1.18.2");
  print(mcdata.blocksByName["coal_block"]);
}
