import 'package:flutter/material.dart';
import 'package:gradelytix/subject.dart';
import 'package:gradelytix/widgets/graph.dart';
import 'package:collection/collection.dart';
import 'package:gradelytix/widgets/progress.dart';

class Overview extends StatefulWidget {
  final Subject subject;
  final List<Widget> widgets = [];
  final List<double> percents = [];
  Overview({required this.subject, super.key}) {
    var exams = subject.exams;
    if (exams.isNotEmpty) {
      for (var exam in exams) {
        percents.add(exam.percentage);
      }

      widgets.add(Graph(marks: percents));

      double average = percents.average;

      widgets.add(Progress(
        mark: 0,
        total: 0,
        percent: average,
        t: "Average Percentage is the average of percentage of marks scored for each exam",
      ));
    }
  }

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    if (widget.subject.exams.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.widgets.length,
        itemBuilder: (context, index) {
          return widget.widgets[index];
        },
      );
    } else {
      return const Center(
        child: Text("No Marks Added"),
      );
    }
  }
}
