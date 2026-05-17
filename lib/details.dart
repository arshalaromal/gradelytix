import 'package:flutter/material.dart';
import 'package:gradelytix/ewise.dart';
import 'package:gradelytix/examtype.dart';
import 'package:gradelytix/globals.dart';
import 'package:gradelytix/student.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Student student;
  Details({super.key, required this.student});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<ExamType> categories = [];
  void init() {
    cats = [];
    Student student = widget.student;
    var subjects = student.subjects;
    for (var sub in subjects) {
      for (var exam in sub.exams) {
        ExamType type = exam.type;
        if (!categories.contains(type)) {
          categories.add(type);
        }
      }
    }
    cats = categories;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Exam-Wise"),
        ),
        body: loadBody());
  }

  Widget loadBody() {
    if (cats.isNotEmpty) {
      return ListView.separated(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cats[index].type),
            leading: const Icon(Icons.bar_chart_rounded),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EWise(name: cats[index].type, student: widget.student),
                  ));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
    } else {
      return const Center(
        child: Text("No Exam Categories Added"),
      );
    }
  }
}
