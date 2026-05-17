import 'package:flutter/material.dart';
import 'package:gradelytix/student.dart';
import 'package:gradelytix/student_deleter.dart';

class Settings extends StatelessWidget {
  const Settings({required this.refresh, required this.studentList, super.key});
  final List<Student> studentList;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StudentDeleter(
                studentList: studentList,
                loadAgain: refresh,
              ),
            )),
            leading: const Icon(Icons.delete),
            title: const Text("Delete Students"),
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MaterialApp(
                    home: Scaffold(
                      appBar: AppBar(
                        title: const Text("About"),
                      ),
                      body: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        children: const [
                          Text("Made By ARSHAL AROMAL"),
                          Text(
                              "Made using Dart programming language using Flutter UI Framework"),
                        ],
                      ),
                    ),
                  );
                },
              ));
            },
            title: const Text("About"),
            leading: const Icon(Icons.info_outline_rounded),
            trailing: Icon(Icons.arrow_forward_rounded),
          )
        ],
      ),
    );
  }
}
