import 'dart:convert';
import 'dart:io';

dynamic readJson(String path) {
  return jsonDecode(File(path).readAsStringSync());
}

Map<String, dynamic> sortBykey(Iterable<dynamic> data, String key) {
  Map<String, dynamic> sortedData = {};
  for (var value in data) {
    sortedData[value[key]] = value;
  }
  return sortedData;
}

 Map<String, dynamic> sortBykeyWithRanges(Iterable<dynamic> array, fieldToIndexMin, fieldToIndexMax) {
      
      return array.reduce( (index, element) {
        for (var i = element[fieldToIndexMin]; i <= element[fieldToIndexMax]; i++) {
          index[i] = element;
        }
        return index;
      });
    }

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
