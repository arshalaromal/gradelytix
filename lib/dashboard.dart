// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradelytix/globals.dart';
import 'package:gradelytix/mark_adder.dart';
import 'package:gradelytix/student.dart';
import 'package:gradelytix/subdash.dart';
import 'package:gradelytix/subject.dart';
import 'package:gradelytix/widgets/catchooser.dart';

class Dashboard extends StatefulWidget {
  late Student student;

  Dashboard({required this.student, super.key});

  @override
  State<Dashboard> createState() => _DashboardState(student);
}

class _DashboardState extends State<Dashboard> {
  int Key = 1;
  int index = 0;
  int selected = 0;

  late List<Subject> subjects;
  List<Tab> tabs = [];
  List<Widget> tabWidgets = [];
  List<Subject> subs = [];
  late int sub_no;
  late Student student;
  _DashboardState(this.student) {
    tabWidgets = [];
    subjects = student.subjects;
    sub_no = subjects.length;
    for (var sub in subjects) {
      subs.add(sub);
      tabWidgets.add(SubDash(
        refresh: () {
          setState(() {
            init();
            log("called");
          });
        },
        subject: sub,
      ));
      tabs.add(Tab(
        text: sub.name,
      ));
    }
  }
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void init() {
    setState(() {
      tabs = [];
      tabWidgets = [];
      subs = [];
      tabs = [];
      subs = [];
      student = widget.student;
      tabWidgets = [];
      subjects = student.subjects;
      sub_no = subjects.length;
      for (var sub in subjects) {
        subs.add(sub);
        tabWidgets.add(SubDash(
          refresh: () {
            setState(() {
              init();
              log("called");
            });
          },
          subject: sub,
        ));
        tabs.add(Tab(
          text: sub.name,
        ));
      }
    });
  }

  void addMark() {
    init();
    TextEditingController markc = TextEditingController();
    TextEditingController totalc = TextEditingController();
    showDialog(
      context: context,
      builder: (Context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text("Add Mark"),
            actions: [
              TextButton(
                  onPressed: disabled
                      ? null
                      : () {
                          String markt = markc.text;
                          String totalt = totalc.text;
                          if (markt.isNotEmpty && totalt.isNotEmpty) {
                            double mark = double.parse(markt);
                            double total = double.parse(totalt);
                            Subject current_sub = subs[index];
                            MarkAdder markAdder = MarkAdder(
                                type: cat,
                                subject: current_sub,
                                mark: mark,
                                total: total);
                            markAdder.add();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                "Successfully Added Mark",
                              ),
                              showCloseIcon: true,
                            ));
                            Navigator.pop(Context);
                            init();
                            setState(() {
                              init();
                            });
                          } else {
                            Navigator.pop(Context);
                            ScaffoldMessenger.of(Context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please Enter Both Total Marks and Scored Marks"),
                              ),
                            );
                          }
                        },
                  child: const Text("Add Mark"))
            ],
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: markc,
                    autofocus: true,
                    decoration:
                        const InputDecoration(hintText: "Enter Marks Scored"),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                  ),
                  TextFormField(
                    controller: totalc,
                    decoration:
                        const InputDecoration(hintText: "Enter Total Marks"),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                  ),
                  CatChooser(() {
                    setState(() {});
                  })
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return DefaultTabController(
            initialIndex: selected,
            key: ValueKey(Key),
            length: sub_no,
            child: Scaffold(
              floatingActionButton: FloatingActionButton.extended(
                onPressed: addMark,
                label: const Text("Add Mark"),
                icon: const Icon(Icons.add),
              ),
              appBar: AppBar(
                title: Text("Marks of $student"),
                centerTitle: true,
                elevation: 0,
                bottom: TabBar(
                  onTap: (pos) {
                    index = pos;
                    selected = pos;
                  },
                  tabs: tabs,
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                ),
              ),
              body: Builder(
                builder: (context) {
                  return TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: tabWidgets);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
