import 'package:easy_localization/easy_localization.dart';

List<DateTime> getDatesForDateRangePickerByOffset(int offset) {
  final now = DateTime.now();
  final firstDayOfCurrentMonth = DateTime(
    now.year,
    now.month + offset,
    1,
  );
  final lastDayOfCurrentMonth = DateTime(
    firstDayOfCurrentMonth.year,
    firstDayOfCurrentMonth.month + 1 + offset,
    0,
  );
  final totalDaysInMonth = lastDayOfCurrentMonth.day;
  final daysOfThisMonth = List.generate(
    totalDaysInMonth,
    (index) => DateTime(now.year, now.month + offset, index + 1),
  );
  final daysOfLastMonthToBeAdded = firstDayOfCurrentMonth.weekday % 7;
  final daysOfLastMonth = List.generate(
    daysOfLastMonthToBeAdded,
    (index) => DateTime(now.year, now.month + offset, -index),
  );
  final daysOfNextMonthToBeAdded =
      42 - daysOfThisMonth.length - daysOfLastMonth.length;
  final daysOfNextMonth = List.generate(
    daysOfNextMonthToBeAdded,
    (index) => DateTime(
      lastDayOfCurrentMonth.year,
      lastDayOfCurrentMonth.month + offset,
      lastDayOfCurrentMonth.day + index + 1,
    ),
  );

  return [...daysOfLastMonth, ...daysOfThisMonth, ...daysOfNextMonth];
}

extension DateTimeExt on DateTime {
  bool onSameMonthWith(DateTime other) {
    return month == other.month && year == other.year;
  }

  String get monthYearFormat {
    return DateFormat('MMMM yyyy').format(this);
  }

  bool isInRangeOf(List<DateTime> dateRange) {
    return isAtSameMomentAs(dateRange.first) ||
        isAtSameMomentAs(dateRange.last) ||
        (isAfter(dateRange.first) && isBefore(dateRange.last));
  }
}
