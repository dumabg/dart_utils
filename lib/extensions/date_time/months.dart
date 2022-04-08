extension Months on DateTime {
  int monthsFrom(DateTime dateTime) {
    return (year - dateTime.year) * 12 + (month - dateTime.month);
  }

  int lastMonthDay() {
    return DateTime(year, month + 1, 0).day;
  }
}
