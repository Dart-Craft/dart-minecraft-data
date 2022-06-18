import 'package:minecraft_data/minecraft_data.dart';
import 'package:minecraft_data/utils.dart';

class MinecraftVersion {
  int version = 0;
  String minecraftVersion = "";
  MinecraftEdition edition;
  String type = ""; //
  String majorVersion = ""; //
  int dataVersion = 0; //

  MinecraftVersion(String version, this.edition) {
    var versions = MinecraftData().versionsByMinecraftVersion[type];
    this.version = versions[version]['version'];
    minecraftVersion = version;
    type = edition.toPath();
    majorVersion = versions[version]['majorVersion'];
    dataVersion = versions[version]['dataVersion'];

  }

  bool operator <(MinecraftVersion ver) {
    return dataVersion < ver.dataVersion;
  }

  bool operator >(MinecraftVersion ver) {
    return dataVersion > ver.dataVersion;
  }

  @override
  bool operator ==(other) => dataVersion.hashCode == other.hashCode;

  bool operator >=(MinecraftVersion ver) {
    return dataVersion >= ver.dataVersion;
  }
  
  bool operator <=(MinecraftVersion ver) {
    return dataVersion <= ver.dataVersion;
  }
  
  @override
  int get hashCode => dataVersion.hashCode;
  

  
}