part of 'app_date_range_picker_modal.dart';

class ModalContent extends StatefulWidget {
  const ModalContent({super.key});

  @override
  State<ModalContent> createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  int numberOfDateChosen = 0;
  final chosenDates = <DateTime>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DateCarousel(
          onRangeChosen: (chosenDates) {
            setState(() {
              this.chosenDates
                ..clear()
                ..addAll(chosenDates);
              numberOfDateChosen =
                  chosenDates.last.difference(chosenDates.first).inDays + 1;
            });
          },
        ),
        SizedBox(height: 12.h),
        Divider(
          color: ColorsManager.gray30,
          thickness: 1,
          height: 1,
          indent: 24.w,
          endIndent: 15.w,
        ),
        SizedBox(height: 16.h),
        BottomContent(
          numberOfDateChosen: numberOfDateChosen,
          onApply: () {
            if (chosenDates.length != 2) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop(chosenDates);
            }
          },
        ),
      ],
    );
  }
}
