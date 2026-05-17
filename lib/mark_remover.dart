import 'dart:convert';
import 'dart:io';

import 'package:gradelytix/exam.dart';
import 'package:gradelytix/subject.dart';

class MarkRemover {
  Subject? subject;
  List<Exam> examList = [];
  List maps = [];
  MarkRemover({required this.subject, required Exam? exam}) {
    if (exam != null && subject != null) {
      examList = subject!.exams;


      examList.remove(exam);
      for (var e in examList) {
        maps.add(e.toMap());
      }
    }
  }
  void remove() {
    if (subject != null) {
      File file = subject!.file;
      file.writeAsStringSync(jsonEncode(maps), mode: FileMode.write);
    }
  }
}
