import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gradelytix/exam.dart';
import 'package:gradelytix/subject.dart';

class BarGraph extends StatefulWidget {
  BarGraph({super.key, required this.percentages});
  Map<Subject, Exam> percentages;
  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  List<BarChartGroupData> list = [];

  void init() {
    list = [];
    int i = 1;
    Color c = Colors.blue;
    widget.percentages.forEach((subject, exam) {
      switch (subject.name) {
        case "Science":
          c = Colors.blue.shade200;
          break;
        case "Social Studies":
          c = Colors.red;
          break;
        case "Mathematics":
          c = Colors.purple;
          break;
        case "Physics":
          c = Colors.blue.shade900;
          break;
        case "Chemistry":
          c = Colors.orange;
          break;
        case "Computer Science":
          c = Colors.yellow.shade600;
          break;
        case "English":
          c = Colors.pink;
          break;
        case "Malayalam":
          c = Colors.lightGreenAccent.shade700;
          break;
        case "Hindi":
          c = Colors.cyan;
          break;
        case "Biology":
          c = Colors.green;
          break;
        case "History":
          c = Colors.brown;
          break;
        case "Geography":
          c = Colors.blueGrey;
          break;
        case "Politics":
          c = const Color.fromARGB(255, 2, 53, 59);
          break;
        case "Sanskrit":
          c = Colors.deepPurpleAccent;
          break;
        default:
          Colors.blue;
      }

      double mark = exam.percentage;
      list.add(
        BarChartGroupData(
            x: i, barRods: [BarChartRodData(toY: mark, color: c)]),
      );
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BarChart(
              BarChartData(
                minY: 0,
                barGroups: list,
                maxY: 100,
                titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                      axisNameWidget: Text("Percentages"),
                      sideTitles: SideTitles(
                          showTitles: true, interval: 20, reservedSize: 40),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text("Subjects"),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false))),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 30,
          children: [
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10,
                      child: Container(color: Colors.blue.shade200)),
                ),
                const Text("Science")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10,
                      child: Container(color: Colors.red.shade600)),
                ),
                const Text("Social Studies")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10, child: Container(color: Colors.purple)),
                ),
                const Text("Mathematics")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10,
                      child: Container(color: Colors.blue.shade900)),
                ),
                const Text("Physics")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10, child: Container(color: Colors.orange)),
                ),
                const Text("Chemistry")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10,
                      child: Container(color: Colors.yellow.shade600)),
                ),
                const Text("Computer Science")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10, child: Container(color: Colors.pink)),
                ),
                const Text("English")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10,
                      child:
                          Container(color: Colors.lightGreenAccent.shade700)),
                ),
                const Text("Malayalam")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10, child: Container(color: Colors.cyan)),
                ),
                const Text("Hindi")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10, child: Container(color: Colors.green)),
                ),
                const Text("Biology")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10, child: Container(color: Colors.brown)),
                ),
                const Text("History")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10, child: Container(color: Colors.blueGrey)),
                ),
                const Text("Geography")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10,
                      child: Container(
                          color: const Color.fromARGB(255, 2, 53, 59))),
                ),
                const Text("Politics")
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox.square(
                      dimension: 10,
                      child: Container(color: Colors.deepPurpleAccent)),
                ),
                const Text("Sanskrit")
              ],
            ),
          ],
        )
      ],
    );
  }
}
