import 'dart:convert';
import 'dart:io';

import 'package:gradelytix/subject.dart';
import 'package:path/path.dart';

class Student {
  String name;
  @override
  String toString() {
    return name;
  }

  Directory dir;
  List<Subject> subjects = [];

  Map<String, String> codes = {
    "sci": "Science",
    "ss": "Social Studies",
    "math": "Mathematics",
    "phy": "Physics",
    "che": "Chemistry",
    "cs": "Computer Science",
    "eng": "English",
    "mal": "Malayalam",
    "hin": "Hindi",
    "bio": "Biology",
    "his": "History",
    "pol": "Politics",
    "geo": "Geography",
    "san": "Sanskrit",
  };

  Student({required this.name, required this.dir}) {
    List files = dir.listSync();

    for (File file in files) {
      String codeName = basename(file.path);
      codeName = codeName.split(".txt")[0];

      String sname = codes[codeName]!;
      String content = file.readAsStringSync();
      if (content != "") {
        var data = jsonDecode(content); //List<Map>
        Subject s = Subject(name: sname, examMaps: data, file: file);
        subjects.add(s);
      } else {
        var data = []; //List<Map>
        Subject s = Subject(name: sname, examMaps: data, file: file);
        subjects.add(s);
      }
    }
  }
}
