import 'dart:io';

import 'package:minecraft_data/src/codec/json_archive_codec.dart';

void main(List<String> args) async {
  var str = await JsonArchiveCodec().encode(Directory("minecraft-data\\data"));
  File("test.json").writeAsString(str);
  str = str.replaceAll("\\", "\\\\");
  str = str.replaceAll("\"", "\\\"");
  String result = _template.replaceFirst("%placeholder%", str);

  var file = File("lib\\src\\generated\\generated_minecraft_data.g.dart");
  file.writeAsString(result);
}

final String _template = """// WARNING: This is a generated file.
// Do not change
// All changes will be lost on regeneration

class GeneratedMinecraftData {
  static final String jsonArchivedData = "%placeholder%";
}

""";
