import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  List<double> marks;

  List<FlSpot> spots = [];
  Graph({required this.marks, super.key}) {
    for (int i = 0; i < marks.length; i++) {
      spots.add(FlSpot(i / 1, marks[i]));
    }
  }

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, top: 20, bottom: 10),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: LineChart(
          LineChartData(
              maxY: 100,
              minY: 0,
              titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: Text("Percentages"),
                    axisNameSize: 40,
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                    ),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      axisNameWidget: Text("Exams"),
                      sideTitles: SideTitles(
                          showTitles: true, interval: 1, reservedSize: 40)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false))),
              lineBarsData: [
                LineChartBarData(
                  color: Colors.green,
                  spots: widget.spots,
                ),
              ],
              backgroundColor: Colors.white70),
        ),
      ),
    );
  }
}
