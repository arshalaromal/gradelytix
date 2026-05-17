import 'package:flutter/material.dart';
import 'package:gradelytix/overview.dart';
import 'package:gradelytix/subject.dart';
import 'package:gradelytix/widgets/spage.dart';

class SubDash extends StatefulWidget {
  final Subject subject;
  final Function refresh;
  const SubDash({required this.refresh, required this.subject, super.key});

  @override
  State<SubDash> createState() => _SubDashState();
}

class _SubDashState extends State<SubDash> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const TabBar(tabs: [
            Tab(text: "Overview"),
            Tab(text: "Marks"),
          ]),
          Expanded(
            //Add this to give height
            child: TabBarView(children: [
              Overview(subject: widget.subject),
              SPage(
                refresh: widget.refresh,
                subject: widget.subject,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
