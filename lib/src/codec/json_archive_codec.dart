import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class JsonArchiveCodec {
  Future<String> encode(Directory dir) async {
    Map<String, String> jsonArchive = {};
    await dir.list(recursive: true).forEach((file) async {
      print(file.path);
      if (file is! File) return;
      Uint8List bytes = await file.readAsBytes();
      jsonArchive[file.path] = base64.encode(GZipCodec().encode(bytes));
    });
    return JsonEncoder().convert(jsonArchive);
  }

  Map<String, Uint8List> decodeToMap(String archiveString) {
    Map<String, dynamic> map = JsonDecoder().convert(archiveString);
    Map<String, Uint8List> resultMap = {};
    for (MapEntry entry in map.entries) {
      resultMap[entry.key] =
          Uint8List.fromList(gzip.decode(base64.decode(entry.value)));
    }
    return resultMap;
  }
}
