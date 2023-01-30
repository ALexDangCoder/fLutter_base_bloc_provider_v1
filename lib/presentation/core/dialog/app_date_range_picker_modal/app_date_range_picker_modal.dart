import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/core/color_manager.dart';
import '../../../../domain/core/datetime_extenstion.dart';
import '../../../../domain/core/style_manager.dart';
import '../../../../gen/assets.gen.dart';
import '../../widgets/app_button.dart';

part 'modal_content.dart';
part 'bottom_content.dart';
part 'date_carousel.dart';
part 'date_row.dart';

class AppDateRangePickerModal extends ModalRoute<List<DateTime>?> {
  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismiss date range picker';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: 312.w,
        height: 516.h,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 20.r,
            ),
          ],
        ),
        padding: EdgeInsets.only(bottom: 24.h),
        alignment: Alignment.bottomCenter,
        child: const ModalContent(),
      ),
    );
  }

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Center(
      child: AnimatedScale(
        scale: animation.value,
        duration: Duration.zero,
        child: child,
      ),
    );
  }
}
