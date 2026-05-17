class ExamType {
  @override
  String toString() {
    return type;
  }

  String type;
  ExamType({required this.type});
  @override
  bool operator ==(covariant ExamType other) {
    if (type == other.type)
      return true;
    else
      return false;
  }
}
