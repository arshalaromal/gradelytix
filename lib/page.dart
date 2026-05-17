import 'package:flutter/material.dart';
import 'package:gradelytix/dashboard.dart';
import 'package:gradelytix/details.dart';
import 'package:gradelytix/student.dart';

class Page extends StatefulWidget {
  const Page({super.key, required this.student});
  final Student student;
  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Details(student: widget.student),
      Dashboard(
        student: widget.student,
      )
    ];
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) => setState(() {
            selectedIndex = newIndex;
          }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart), label: "Exam-Wise"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: "Subject-Wise")
          ],
        ),
        body: pages[selectedIndex],
      ),
    );
  }
}
