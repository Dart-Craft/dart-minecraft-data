import 'dart:convert';
import 'dart:io';

class Utils {

  static dynamic readJson(String path) {
  return jsonDecode(File(path).readAsStringSync());
  }

  static Map<String, dynamic> sortBykey(Iterable<dynamic> array, String key) {
    Map<String, dynamic> sortedData = {};
    for (var value in array) {
      sortedData[value[key]] = value;
    }
    return sortedData;
  }

  static Map<String, dynamic> sortWithRanges(Iterable<dynamic> array, fieldToIndexMin, fieldToIndexMax) {
        
    return array.reduce( (index, element) {
      for (var i = element[fieldToIndexMin]; i <= element[fieldToIndexMax]; i++) {
        index[i] = element;
      }
      return index;
    });
  }

  static Map<String, dynamic> sortByKeyNonUnique(Iterable<dynamic> array, String key) {

    Map<String, dynamic> result = {};

    for (var element in array) {
      var value = element[key].toString();
      if (! result.containsKey(value)) {
        result[value] = [];
      }
      result[value].add(element);

    }
    return result;
  }
}
