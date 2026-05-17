extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }
}
