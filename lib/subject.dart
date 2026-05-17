import 'dart:io';

import 'package:gradelytix/exam.dart';
import 'package:gradelytix/examtype.dart';

class Subject {
  String name;
  List examMaps = [];
  List<Exam> exams = [];
  File file;

  Subject({required this.name, required this.examMaps, required this.file}) {
    for (var element in examMaps) {
      Map map = element;
      double total = map['total'].toDouble();

      double mark = map['mark'].toDouble();
      Exam e = Exam(
          date: map['date'],
          mark: mark,
          total: total,
          type: ExamType(type: map['type']));
      exams.add(e);
    }
  }

  @override
  String toString() {
    return name;
  }

  void addExam(
      {required double marks,
      required double total,
      required String date,
      required ExamType type}) {
    exams.add(Exam(date: date, mark: marks, total: total, type: type));
  }

  List toMapList() {
    for (var element in exams) {
      examMaps.add(element.toMap());
    }
    return examMaps;
  }
}
