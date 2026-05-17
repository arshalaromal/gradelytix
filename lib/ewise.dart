import 'package:flutter/material.dart';
import 'package:gradelytix/exam.dart';
import 'package:gradelytix/examtype.dart';
import 'package:gradelytix/student.dart';
import 'package:gradelytix/subject.dart';
import 'package:gradelytix/widgets/bargraph.dart';
import 'package:gradelytix/widgets/progress.dart';

// ignore: must_be_immutable
class EWise extends StatefulWidget {
  String name;
  Student student;
  List<Subject> subjects = [];
  Map<Subject, Exam> marks = {};
  List<Progress> progressList = [];
  EWise({required this.name, required this.student, super.key}) {
    subjects = student.subjects;
    for (var sub in subjects) {
      for (var exam in sub.exams) {
        if (exam.type == ExamType(type: name)) {
          marks[sub] = exam;
          progressList.add(Progress(
            mark: exam.mark,
            total: exam.total,
            percent: exam.percentage,
            heading: "${sub.name}\n${exam.date}",
          ));
        }
      }
    }
  }

  @override
  State<EWise> createState() => _EWiseState();
}

class _EWiseState extends State<EWise> {
  @override
  Widget build(BuildContext context) {
    List<Widget> l = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: BarGraph(
          percentages: widget.marks,
        ),
      ),
    ];
    l.addAll(widget.progressList);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: l,
      ),
    );
  }
}
