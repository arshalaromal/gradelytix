// ignore_for_file: slash_for_doc_comments

import 'dart:io';

import 'package:flutter/material.dart' hide Page;
import 'package:gradelytix/record_maker.dart';
import 'package:gradelytix/settings.dart';
import 'package:gradelytix/splash.dart';
import 'package:gradelytix/student.dart';
import 'package:gradelytix/widgets/config.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gradelytix/page.dart';

List<Student> studentList = [];

void main() {
  runApp(MaterialApp(home: const SplashScreen()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  /**
/// *Loading the Students in an async function 
 */
  loadStudents() async {
    studentList = [];
    List? all = await ((await getExternalStorageDirectory())?.list())?.toList();
    List? folders = all?.whereType<Directory>().toList();

    for (var i = 0; i < folders!.length; i++) {
      Directory d = folders[i];
      String name = basename(d.path).split("=")[0];
      Student s = Student(name: name, dir: d);
      studentList.add(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Settings(
                          refresh: () {
                            setState(() {});
                          },
                          studentList: studentList,
                        ),
                      )),
                  icon: const Icon(Icons.settings))
            ],
            title: const Text("Gradelytix"),
            centerTitle: true,
            elevation: 1,
            shadowColor: Colors.black,
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton.extended(
              //////////////////////////////////////////////////
              //ONPRESSED
              /**
           * This Will create the dialog
           */

              onPressed: () {
                TextEditingController textController = TextEditingController();

                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text('Add Student'),
                        content: TextField(
                          controller: textController,
                          autofocus: true,
                          decoration: const InputDecoration(
                              hintText: "Enter Name Of Student"),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          FilledButton(
                            child: const Text('Add Student'),
                            onPressed: () {
                              /**
                               * Moving to subject selection 
                               * 
                               */
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => Config(
                                    name: textController.text,
                                    create: (List<String> subjects) async {
                                      //Passing Function for creating the folder

                                      RecordMaker rm = RecordMaker(subjects);
                                      await rm
                                          .createRecord(textController.text);
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                        studentList = [];
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            "Successfully Created Mark Record for ${textController.text}",
                                          ),
                                          showCloseIcon: true,
                                        ));
                                      }
                                    }),
                              ));
                            },
                          ),
                        ],
                      );
                    }));
              },

              // / // / // / /// / /// / / /// / /// / // / // / ///

              label: const Text("Add Student"),
              icon: const Icon(Icons.add),
            ),
          ),
          body: FutureBuilder(
            future: loadStudents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (studentList.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.fast),
                      itemCount: studentList.length,
                      itemBuilder: (context, index) {
                        for (var _ in studentList) {
                          return Card(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Page(
                                    student: studentList[index],
                                  ),
                                ));
                              },
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                title: Text(studentList[index].name),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                                subtitle: Text(
                                    "Add or View Marks of ${studentList[index]}"),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No Students Added"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ));
    });
  }
}
