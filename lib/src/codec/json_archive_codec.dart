import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class JsonArchiveCodec {
  Future<String> encode(Directory dir) async {
    Map<String, String> jsonArchive = {};
    await for (var file in dir.list(recursive: true)) {
      print("Packaging ${file.path}");
      if (file is! File) continue;
      Uint8List bytes = await file.readAsBytes();
      String path = file.path.replaceAll("\\", "/");
      jsonArchive[path] = base64.encode(GZipCodec().encode(bytes));
      print("Added a path $path");
    }
    // await dir.list(recursive: true).forEach((file) async {
    //   print("Packaging ${file.path}");
    //   if (file is! File) return;
    //   Uint8List bytes = await file.readAsBytes();
    //   jsonArchive[file.path.replaceAll("\\", "/")] =
    //       base64.encode(GZipCodec().encode(bytes));
    // });
    return jsonEncode(jsonArchive);
  }

  Map<String, Uint8List> decodeToMap(String archiveString) {
    Map<String, dynamic> map = jsonDecode(archiveString);
    Map<String, Uint8List> resultMap = {};
    for (MapEntry entry in map.entries) {
      resultMap[entry.key] =
          Uint8List.fromList(gzip.decode(base64.decode(entry.value)));
    }
    return resultMap;
  }
}
