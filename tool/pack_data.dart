import 'dart:io';

import 'package:minecraft_data/src/codec/json_archive_codec.dart';

void main(List<String> args) async {
  var data = await JsonArchiveCodec().encode(Directory("minecraft-data\\data"));
  var schemas =
      await JsonArchiveCodec().encode(Directory("minecraft-data\\schemas"));
  var str = data.substring(0, data.length - 1) + "," + schemas.substring(1);
  File("out.json").writeAsStringSync(str);
  str = str.replaceAll("\\", "\\\\");
  str = str.replaceAll("\"", "\\\"");
  String result = _template.replaceFirst("%placeholder%", str);

  var file = File("lib\\src\\generated\\generated_minecraft_data.g.dart");
  file.writeAsStringSync(result);
}

final String _template =
    """// WARNING: This is a generated file.
// Do not change
// All changes will be lost on regeneration

import 'dart:convert';

import 'package:minecraft_data/src/codec/json_archive_codec.dart';

class GeneratedMinecraftData {
  final Map<String, dynamic> _registry = {};
  final String rootPath = "minecraft-data/";

  factory GeneratedMinecraftData() {
    return _instance;
  }

  GeneratedMinecraftData._privateConstructor() {
    for (MapEntry entry
        in JsonArchiveCodec().decodeToMap(jsonArchivedData).entries) {
      if ((entry.key as String).endsWith(".json")) {
        _registry[entry.key] = jsonDecode(utf8.decode(entry.value));
      } else {
        _registry[entry.key] = utf8.decode(entry.value);
      }
    }
  }

  static final GeneratedMinecraftData _instance =
      GeneratedMinecraftData._privateConstructor();

  dynamic getData(String path) {
    path = rootPath  + "data" + path;
    var json = _registry[path];
    assert(json != null,
        "Requested json for path \$path, bu there's not data there. Is the path correct?");
    return json;
  }

  dynamic getSchema(String path) {
    path = rootPath + "schemas" + path;
    var json = _registry[path];
    assert(json != null,
        "Requested json for path \$path, bu there's not data there. Is the path correct?");
    return json;
  }

  static final String jsonArchivedData = "%placeholder%";
}

""";
