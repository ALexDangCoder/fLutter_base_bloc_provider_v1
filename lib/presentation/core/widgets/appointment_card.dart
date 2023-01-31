import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';
import '../../../domain/core/style_manager.dart';
import '../../../gen/assets.gen.dart';

class AppointmentCard extends StatelessWidget {
  final String title;
  final List<String> subtitles;
  final Widget? locationIcon;
  final String locationText;
  final String phoneNumber;
  final Function() onTap;
  const AppointmentCard({
    required this.title,
    required this.subtitles,
    required this.locationText,
    required this.phoneNumber,
    required this.onTap,
    super.key,
    this.locationIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: ColorsManager.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyleManager.paragraph,
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                ...List.generate(subtitles.length, (index) {
                  return _subtitleWidget(
                    subtitle: subtitles[index],
                    isHiddenLine: index == subtitles.length - 1,
                  );
                }),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            _locationWidget(),
            SizedBox(
              height: 8.h,
            ),
            _phonenumberWidget(),
            SizedBox(
              height: 8.h,
            ),
            _bookingWidget(),
          ],
        ),
      ),
    );
  }

  Widget _subtitleWidget({required String subtitle, bool? isHiddenLine}) {
    return Row(
      children: [
        Text(
          subtitle,
          style:
              TextStyleManager.fineText.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 8.w,
        ),
        Container(
          width: 1,
          height: 10.h,
          color: (isHiddenLine ?? false)
              ? Colors.transparent
              : ColorsManager.divider,
        ),
        SizedBox(
          width: 8.w,
        ),
      ],
    );
  }

  Widget _locationWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        locationIcon ??
            Assets.images.location.svg(
              color: ColorsManager.cueText,
            ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            locationText,
            style: TextStyleManager.description,
          ),
        ),
      ],
    );
  }

  Widget _phonenumberWidget() {
    return Row(
      children: [
        Assets.images.phone.svg(
          color: ColorsManager.cueText,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          phoneNumber,
          style: TextStyleManager.description,
        ),
      ],
    );
  }

  Widget _bookingWidget() {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Assets.images.launch.svg(color: ColorsManager.info100),
          SizedBox(
            width: 8.w,
          ),
          Text(
            'Appointment booking',
            style: TextStyleManager.description.copyWith(
              color: ColorsManager.info100,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
