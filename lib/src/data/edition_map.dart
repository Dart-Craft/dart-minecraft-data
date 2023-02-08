import 'package:minecraft_data/minecraft_data.dart';

class EditionMap<T> {
  T java;
  T bedrock;

  EditionMap(this.java, this.bedrock);

  T operator [](MinecraftEdition key) {
    switch (key) {
      case MinecraftEdition.java:
        return java;
      case MinecraftEdition.bedrock:
        return bedrock;
    }
  }

  void operator []=(MinecraftEdition key, T value) {
    switch (key) {
      case MinecraftEdition.java:
        java = value;
        break;
      case MinecraftEdition.bedrock:
        bedrock = value;
        break;
    }
  }
}
