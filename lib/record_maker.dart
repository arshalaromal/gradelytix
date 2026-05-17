import 'dart:io';

import 'package:gradelytix/globals.dart';
import 'package:path_provider/path_provider.dart';

class RecordMaker {
  List<String> subjects;
  RecordMaker(this.subjects);

  Future<bool> createRecord(String name) async {
    final directory = await getExternalStorageDirectory();
    final path = directory?.path;
    int id = DateTime.now().millisecondsSinceEpoch;
    String n = "$path/$name=$id";
    Directory d = Directory(n);
    d.create();
    for (String subject in subjects) {
      File file = File("${d.path}/$subject.txt");
      await file.writeAsString("");
    }

    enabled = false;

    return true;
  }
}
