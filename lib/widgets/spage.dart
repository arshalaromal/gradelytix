import 'package:flutter/material.dart';
import 'package:gradelytix/subject.dart';
import 'package:gradelytix/widgets/progress.dart';

class SPage extends StatefulWidget {
  Subject subject;
  List<Widget> widgets = [];
  Function? refresh;
  SPage({required this.subject, super.key, this.refresh}) {
    var exams = subject.exams;
    if (exams.isNotEmpty) {
      for (var exam in exams) {
        widgets.add(Progress(
          refrsh: refresh,
          exam: exam,
          subject: subject,
          showDelete: true,
          mark: exam.mark,
          total: exam.total,
          percent: exam.percentage,
          average: false,
          date: exam.date,
          heading: "${exam.type}\n${exam.date}",
        ));
      }
    }
  }

  @override
  State<SPage> createState() => _SPageState();
}

class _SPageState extends State<SPage> {
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
