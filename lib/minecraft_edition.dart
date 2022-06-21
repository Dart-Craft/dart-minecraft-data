
enum MinecraftEdition { 
  java,
  bedrock;
  
  String toPath() {
    if (this == MinecraftEdition.java) {
      return 'pc';
    }
    return "bedrock";
  }
}