import 'package:flutter/material.dart';
import 'package:gradelytix/student.dart';

class StudentDeleter extends StatefulWidget {
  final List<Student> studentList;
  final Function loadAgain;
  const StudentDeleter(
      {required this.loadAgain, required this.studentList, super.key});

  @override
  State<StudentDeleter> createState() => _StudentDeleterState();
}

class _StudentDeleterState extends State<StudentDeleter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Students"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (widget.studentList.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.studentList[index].name),
            leading: const Icon(Icons.person),
            trailing: IconButton(
                onPressed: () {
                  widget.studentList[index].dir.deleteSync(recursive: true);
                  setState(() {
                    widget.studentList.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Deleted Successfully")));
                    widget.loadAgain();
                  });
                },
                icon: const Icon(Icons.delete)),
          );
        },
      );
    } else {
      return const Center(
        child: Text("No Students Added"),
      );
    }
  }
}
