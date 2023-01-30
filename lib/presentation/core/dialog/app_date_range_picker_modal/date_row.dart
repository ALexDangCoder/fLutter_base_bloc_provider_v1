part of 'app_date_range_picker_modal.dart';

class DateRow extends StatelessWidget {
  final List<DateTime> chosenDates;
  final List<DateTime> daysInRow;
  final int columnIndex;
  final DateTime showMonth;
  final void Function(DateTime tappedDate) onDateTapped;
  const DateRow({
    required this.chosenDates,
    required this.daysInRow,
    required this.columnIndex,
    required this.showMonth,
    required this.onDateTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double marginLeft = 0;
    double marginRight = 0;
    final rowContainChosenDate = chosenDates.length == 2 &&
        daysInRow.where((day) => day.isInRangeOf(chosenDates)).isNotEmpty;
    if (rowContainChosenDate) {
      if (daysInRow.contains(chosenDates.first)) {
        final dateIndex = daysInRow.indexOf(chosenDates.first);
        marginLeft = 40.w * dateIndex;
      }
      if (daysInRow.contains(chosenDates.last)) {
        final dateIndex = daysInRow.indexOf(chosenDates.last);
        marginRight = 40.w * (daysInRow.length - dateIndex - 1);
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        top: columnIndex == 0 ? 0 : 16.h,
      ),
      child: Stack(
        children: [
          if (rowContainChosenDate)
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.only(
                  left: marginLeft,
                  right: marginRight,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.emerald10,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              7,
              (rowIndex) {
                final date = daysInRow[rowIndex];
                final isCurrentMonth = date.onSameMonthWith(showMonth);
                final isChosen = chosenDates.contains(date);

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    onDateTapped(date);
                  },
                  child: Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: BoxDecoration(
                      color: isChosen ? ColorsManager.emerald100 : null,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyleManager.description.copyWith(
                        height: 20.h / 14.sp,
                        fontWeight: FontWeight.normal,
                        color: isChosen
                            ? ColorsManager.white
                            : isCurrentMonth
                                ? ColorsManager.black
                                : ColorsManager.gray50,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
