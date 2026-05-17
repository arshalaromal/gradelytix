import 'dart:convert';
import 'dart:io';

import 'package:gradelytix/exam.dart';
import 'package:gradelytix/examtype.dart';
import 'package:gradelytix/subject.dart';

class MarkAdder {
  Subject subject;
  double mark, total;
  late double percentage;
  List<Exam> examList = [];
  String type;
  List maps = [];
  MarkAdder(
      {required this.type,
      required this.subject,
      required this.mark,
      required this.total}) {
    examList = subject.exams;
    DateTime now = DateTime.now(); // 30/09/2021 15:54:30
    var d = "${now.day}/${now.month}/${now.year}";

    String date = d.toString();

    examList.add(
        Exam(date: date, mark: mark, total: total, type: ExamType(type: type)));
    for (var e in examList) {
      maps.add(e.toMap());
    }
  }
  void add() {
    File file = subject.file;
    file.writeAsStringSync(jsonEncode(maps), mode: FileMode.write);
  }
}
