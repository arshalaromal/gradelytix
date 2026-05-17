import 'package:gradelytix/examtype.dart';
import 'package:gradelytix/extensions.dart';

class Exam {
  String date;
  double mark, total;
  late double percentage;
  ExamType type;

  Exam(
      {required this.date,
      required this.mark,
      required this.total,
      required this.type}) {
    double p = (mark * 100) / total;
    percentage = p.toPrecision(2);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> m = {
      "date": date,
      "mark": mark,
      "total": total,
      "percentage": percentage,
      "type": type.type
    };

    return m;
  }
}
