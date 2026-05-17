import 'package:flutter/material.dart';
import 'package:gradelytix/exam.dart';
import 'package:gradelytix/mark_remover.dart';
import 'package:gradelytix/subject.dart';

class Progress extends StatefulWidget {
  late double mark, percent, total;
  String t = '';
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '$percent';
  }

  bool average;
  String heading;
  bool showDelete;
  String date;
  Exam? exam;
  Function? refrsh;
  Subject? subject;
  Progress(
      {this.refrsh,
      this.heading = "Average Percentage",
      this.showDelete = false,
      required this.mark,
      required this.total,
      required this.percent,
      super.key,
      this.t = '',
      this.average = false,
      this.date = "",
      this.exam,
      this.subject}) {
    if (t == '') {
      t = "Scored $mark out of $total";
    }
  }

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: loadWidgets(),
    );
  }

  Widget loadWidgets() {
    if (!widget.showDelete) {
      return Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Center(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: TweenAnimationBuilder(
                                curve: Curves.easeInOutQuad,
                                tween: Tween<double>(
                                    begin: -0.1, end: widget.percent / 100),
                                duration: const Duration(milliseconds: 1500),
                                builder: (context, value, _) =>
                                    CircularProgressIndicator(
                                  color: Colors.green,
                                  strokeWidth: 15,
                                  value: value,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: TweenAnimationBuilder(
                              curve: Curves.easeOutQuad,
                              tween:
                                  Tween<double>(begin: -1, end: widget.percent),
                              duration: const Duration(milliseconds: 1500),
                              builder: (context, value, _) {
                                return Text(
                                  "${value.round()}%",
                                  style: TextStyle(fontSize: 20),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "${widget.percent.round()}%",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          widget.t,
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(widget.heading),
              ),
            )
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  MarkRemover mr =
                      MarkRemover(subject: widget.subject, exam: widget.exam);
                  mr.remove();
                  if (widget.refrsh != null) widget.refrsh!();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Mark Deleted Successfully")));
                },
                icon: const Icon(Icons.delete)),
          ),
          Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: TweenAnimationBuilder(
                              curve: Curves.easeInOutQuad,
                              tween: Tween<double>(
                                  begin: -0.1, end: widget.percent / 100),
                              duration: const Duration(milliseconds: 1500),
                              builder: (context, value, _) =>
                                  CircularProgressIndicator(
                                color: Colors.green,
                                strokeWidth: 15,
                                value: value,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: TweenAnimationBuilder(
                            curve: Curves.easeOutQuad,
                            tween:
                                Tween<double>(begin: -1, end: widget.percent),
                            duration: const Duration(milliseconds: 1500),
                            builder: (context, value, _) {
                              return Text(
                                "${value.round()}%",
                                style: TextStyle(fontSize: 20),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "${widget.percent.round()}%",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        widget.t,
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(widget.heading),
            ),
          )
        ],
      );
    }
  }
}
