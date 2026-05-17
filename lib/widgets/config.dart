import 'package:flutter/material.dart';
import 'package:gradelytix/globals.dart';

class Config extends StatefulWidget {
  Function(List<String> list) create;
  String name;

  Config({required this.name, required this.create, super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  List<String> subjects = [];
  bool sci = false,
      ss = false,
      math = false,
      phy = false,
      che = false,
      cs = false,
      eng = false,
      mal = false,
      hin = false,
      bio = false,
      his = false,
      geo = false,
      pol = false,
      san = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Subjects for ${widget.name}"),
      ),
      body: Builder(builder: (context) {
        return ListView(
          children: [
            SizedBox(
              height: 500,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Check(
                    text: "Science",
                    subjects: subjects,
                    currentValue: sci,
                    sub: "sci",
                    refrsh: () {
                      setState(() {
                        sci = !sci;
                      });
                    },
                  ),
                  Check(
                    text: "Social Studies",
                    subjects: subjects,
                    currentValue: ss,
                    sub: "ss",
                    refrsh: () {
                      setState(() {
                        ss = !ss;
                      });
                    },
                  ),
                  Check(
                    text: "Mathematics",
                    subjects: subjects,
                    currentValue: math,
                    sub: "math",
                    refrsh: () {
                      setState(() {
                        math = !math;
                      });
                    },
                  ),
                  Check(
                    text: "Physics",
                    subjects: subjects,
                    currentValue: phy,
                    sub: "phy",
                    refrsh: () {
                      setState(() {
                        phy = !phy;
                      });
                    },
                  ),
                  Check(
                    text: "Chemistry",
                    subjects: subjects,
                    currentValue: che,
                    sub: "che",
                    refrsh: () {
                      setState(() {
                        che = !che;
                      });
                    },
                  ),
                  Check(
                      refrsh: () {
                        setState(() {
                          bio = !bio;
                        });
                      },
                      text: "Biology",
                      subjects: subjects,
                      currentValue: bio,
                      sub: "bio"),
                  Check(
                    text: "Computer Science",
                    subjects: subjects,
                    currentValue: cs,
                    sub: "cs",
                    refrsh: () {
                      setState(() {
                        cs = !cs;
                      });
                    },
                  ),
                  Check(
                    text: "English",
                    subjects: subjects,
                    currentValue: eng,
                    sub: "eng",
                    refrsh: () {
                      setState(() {
                        eng = !eng;
                      });
                    },
                  ),
                  Check(
                    text: "Hindi",
                    subjects: subjects,
                    currentValue: hin,
                    sub: "hin",
                    refrsh: () {
                      setState(() {
                        hin = !hin;
                      });
                    },
                  ),
                  Check(
                    text: "Malayalam",
                    subjects: subjects,
                    currentValue: mal,
                    sub: "mal",
                    refrsh: () {
                      setState(() {
                        mal = !mal;
                      });
                    },
                  ),
                  Check(
                    text: "History",
                    subjects: subjects,
                    currentValue: his,
                    sub: "his",
                    refrsh: () {
                      setState(() {
                        his = !his;
                      });
                    },
                  ),
                  Check(
                    text: "Geography",
                    subjects: subjects,
                    currentValue: geo,
                    sub: "geo",
                    refrsh: () {
                      setState(() {
                        geo = !geo;
                      });
                    },
                  ),
                  Check(
                    text: "Politics",
                    subjects: subjects,
                    currentValue: pol,
                    sub: "pol",
                    refrsh: () {
                      setState(() {
                        pol = !pol;
                      });
                    },
                  ),
                  Check(
                    text: "Sanskrit",
                    subjects: subjects,
                    currentValue: san,
                    sub: "san",
                    refrsh: () {
                      setState(() {
                        san = !san;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: FilledButton.icon(
                    onPressed: enabled
                        ? () {
                            widget.create(subjects);
                          }
                        : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Continue")),
              ),
            )
          ],
        );
      }),
    );
  }
}

class Check extends StatefulWidget {
  String text;
  VoidCallback refrsh;
  List<String> subjects;
  String sub;
  bool currentValue;
  Check(
      {required this.refrsh,
      required this.text,
      required this.subjects,
      required this.currentValue,
      required this.sub,
      super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CheckboxListTile(
          title: Text(widget.text),
          value: widget.currentValue,
          onChanged: (value) {
            setState(() {
              if (value == true) {
                widget.subjects.add(widget.sub);
              } else {
                widget.subjects.remove(widget.sub);
              }
              if (widget.subjects.isEmpty) {
                enabled = false;
              } else {
                enabled = true;
              }
              widget.refrsh();
            });
          },
        );
      },
    );
  }
}
