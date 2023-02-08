enum MinecraftEdition {
  java,
  bedrock;

  String toPath() {
    if (this == MinecraftEdition.java) {
      return 'pc';
    }
    return "bedrock";
  }

  static MinecraftEdition? fromString(String str) {
    if (str == "pc" || str == "java") {
      return MinecraftEdition.java;
    }
    if (str == "pe" || str == "bedrock") {
      return MinecraftEdition.bedrock;
    }
    return null;
  }
}
