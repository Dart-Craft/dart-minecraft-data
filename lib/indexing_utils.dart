class IndexingUtils {
  static Map<K, O> indexByKey<O, K>(
      Iterable<O> array, K Function(O) accessorFunction) {
    Map<K, O> sortedData = {};
    for (O object in array) {
      sortedData[accessorFunction.call(object)] = object;
    }
    return sortedData;
  }

  static Map<String, dynamic> sortWithRanges(
      Iterable<dynamic> array, fieldToIndexMin, fieldToIndexMax) {
    return array.reduce((index, element) {
      for (var i = element[fieldToIndexMin];
          i <= element[fieldToIndexMax];
          i++) {
        index[i] = element;
      }
      return index;
    });
  }

  static Map<K, List<O>> indexByKeyNonUnique<O, K>(
      Iterable<O> array, K Function(O) accessorFunction) {
    Map<K, List<O>> result = {};

    for (O object in array) {
      K key = accessorFunction.call(object);
      if (result[key] == null) {
        result[key] = [object];
      } else {
        (result[key] as List<O>).add(object);
      }
    }
    return result;
  }
}
