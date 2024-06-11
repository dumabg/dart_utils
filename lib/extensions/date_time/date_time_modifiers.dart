//import 'package:intl/intl.dart';

extension DateTimeModifiers on DateTime {
  DateTime addMonths(int num) {
    // month must be zero based for calculating divisions of yearOffset
    //and newMonth
    final int months = (month - 1) + num;
    final int yearOffset = months ~/ 12;
    final int newMonth = (months % 12) + 1;
    final int lastDayInMonth = _daysInMonth(newMonth);
    return DateTime(
        year + (months < 0 ? yearOffset - 1 : yearOffset),
        newMonth,
        day > lastDayInMonth ? lastDayInMonth : day,
        hour,
        minute,
        second,
        millisecond,
        microsecond);
  }

  DateTime addDays(int num) {
    DateTime newDateTime = add(Duration(days: num));
    // If changing hours adding days, DST has ocurred.
    // https://github.com/dart-lang/sdk/issues/46573
    if (newDateTime.hour != hour) {
      newDateTime = DateTime(year, month, day, 1).add(Duration(days: num));
      newDateTime = DateTime(newDateTime.year, newDateTime.month,
          newDateTime.day, hour, minute, second, millisecond, microsecond);
    }
    return newDateTime;
  }

  /// Returns true if this year is a leap year.
  bool get isLeapYear =>
      // Leap years are used since 1582.
      year >= 1582 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  int _daysInMonth(int month) {
    final days = [
      31, // January
      if (isLeapYear) 29 else 28, // February
      31, // March
      30, // April
      31, // May
      30, // June
      31, // July
      31, // August
      30, // September
      31, // October
      30, // November
      31, // December
    ];
    return days[month - 1];
  }

  /// Returns the amount of days that are in this month.
  ///
  /// Accounts for leap years.
  int get daysInMonth {
    return _daysInMonth(month);
  }

  bool sameDay(DateTime other) =>
      (day == other.day) && (month == other.month) && (year == other.year);
}
