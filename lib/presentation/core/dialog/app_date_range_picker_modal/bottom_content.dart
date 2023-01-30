part of 'app_date_range_picker_modal.dart';

class BottomContent extends StatelessWidget {
  final int numberOfDateChosen;
  final VoidCallback onApply;
  const BottomContent({
    required this.numberOfDateChosen,
    required this.onApply,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (numberOfDateChosen != 0)
            Expanded(
              child: Text(
                '$numberOfDateChosen days',
                style: TextStyleManager.description.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.gray70,
                ),
              ),
            ),
          AppButton(
            text: 'Cancel',
            onTap: () {
              Navigator.of(context).pop();
            },
            appButtonType: AppButtonType.secondary,
            appButtonLength: AppButtonLength.mini,
            color: ColorsManager.darkGreen100,
          ),
          SizedBox(width: 16.w),
          AppButton(
            text: 'Apply',
            onTap: onApply,
            appButtonType: AppButtonType.primary,
            appButtonLength: AppButtonLength.mini,
            color: ColorsManager.darkGreen100,
          ),
        ],
      ),
    );
  }
}
