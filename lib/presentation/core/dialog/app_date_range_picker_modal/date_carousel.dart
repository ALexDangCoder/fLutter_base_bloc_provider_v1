part of 'app_date_range_picker_modal.dart';

class DateCarousel extends StatefulWidget {
  final void Function(List<DateTime> chosenDates) onRangeChosen;
  const DateCarousel({
    required this.onRangeChosen,
    super.key,
  });

  @override
  State<DateCarousel> createState() => _DateCarouselState();
}

class _DateCarouselState extends State<DateCarousel> {
  int currentOffsetIndex = 1;
  List<int> offsets = [-1, 0, 1];
  late DateTime showMonth;
  late List<List<DateTime>> currentShowDates;

  late final DateTime now;
  final daysInWeek = ['s', 'm', 't', 'w', 't', 'f', 's'];
  final controller = CarouselController();
  final chosenDates = <DateTime>[];

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    showMonth = DateTime(
      now.year,
      now.month + offsets[currentOffsetIndex],
    );
    final showDates = <List<DateTime>>[];
    for (var offset in offsets) {
      showDates.add(getDatesForDateRangePickerByOffset(offset));
    }
    currentShowDates = showDates;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.previousPage();
                  },
                  child: Assets.images.directionLeft.svg(
                    width: 24.w,
                    height: 24.h,
                    color: ColorsManager.darkGreen100,
                  ),
                ),
                Text(
                  showMonth.monthYearFormat,
                  style: TextStyleManager.title.copyWith(
                    color: ColorsManager.darkGreen100,
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.nextPage();
                  },
                  child: Assets.images.directionRight.svg(
                    width: 24.w,
                    height: 24.h,
                    color: ColorsManager.darkGreen100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                daysInWeek.length,
                (index) => SizedBox(
                  width: 24.w,
                  child: Text(
                    daysInWeek[index].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyleManager.subtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.emerald100,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          CarouselSlider(
            items: List.generate(
              offsets.length,
              (_) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: List.generate(
                    6,
                    (columnIndex) {
                      final daysInRow = currentShowDates[currentOffsetIndex]
                          .getRange(
                            columnIndex * 7,
                            columnIndex * 7 + 7,
                          )
                          .toList();

                      return DateRow(
                        chosenDates: chosenDates,
                        daysInRow: daysInRow,
                        columnIndex: columnIndex,
                        showMonth: showMonth,
                        onDateTapped: (tappedDate) {
                          if (chosenDates.contains(tappedDate)) {
                            setState(() {
                              chosenDates.remove(tappedDate);
                            });
                          } else if (chosenDates.length == 2) {
                            setState(() {
                              chosenDates
                                ..clear()
                                ..add(tappedDate);
                            });
                          } else if (chosenDates.isEmpty) {
                            setState(() {
                              chosenDates.add(tappedDate);
                            });
                          } else {
                            if (chosenDates.first == tappedDate) return;

                            if (chosenDates.first.isBefore(tappedDate)) {
                              setState(() {
                                chosenDates.add(tappedDate);
                              });
                            } else {
                              setState(() {
                                chosenDates.insert(0, tappedDate);
                              });
                            }
                          }

                          widget.onRangeChosen(chosenDates);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            carouselController: controller,
            options: CarouselOptions(
              height: 272.h,
              viewportFraction: 1,
              initialPage: currentOffsetIndex,
              onPageChanged: (index, reason) {
                if (currentOffsetIndex == 2 && index == 0) {
                  _rightToLeft(index);
                } else if (currentOffsetIndex == 0 && index == 2) {
                  _leftToRight(index);
                } else if (index > currentOffsetIndex) {
                  _rightToLeft(index);
                } else {
                  _leftToRight(index);
                }
                setState(() {
                  currentOffsetIndex = index;
                  showMonth = DateTime(
                    now.year,
                    now.month + offsets[currentOffsetIndex],
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _rightToLeft(int index) {
    final replaceIndex = (index + 1) % 3;
    offsets[replaceIndex] = offsets[replaceIndex] + 3;
    currentShowDates[replaceIndex] =
        getDatesForDateRangePickerByOffset(offsets[replaceIndex]);
  }

  void _leftToRight(int index) {
    final replaceIndex = (index + 2) % 3;
    offsets[replaceIndex] = offsets[replaceIndex] - 3;
    currentShowDates[replaceIndex] =
        getDatesForDateRangePickerByOffset(offsets[replaceIndex]);
  }
}
