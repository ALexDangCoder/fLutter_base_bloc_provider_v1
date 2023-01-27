import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/core/color_manager.dart';

class CarouselIndicator extends StatefulWidget {
  final bool isCurrent;
  const CarouselIndicator({
    required this.isCurrent,
    super.key,
  });

  @override
  State<CarouselIndicator> createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<CarouselIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation widthAnimation;
  late final Animation colorAnimation;
  late final Animation radiusAnimation;

  late bool isCurrent;

  @override
  void initState() {
    super.initState();
    isCurrent = widget.isCurrent;
    controller = AnimationController(
      vsync: this,
      value: isCurrent ? 1 : 0,
      duration: const Duration(milliseconds: 200),
    );
    widthAnimation = Tween<double>(begin: 8.w, end: 24.w).animate(controller);
    colorAnimation = ColorTween(
      begin: ColorsManager.plum40,
      end: ColorsManager.plum100,
    ).animate(controller);
    radiusAnimation = Tween<double>(begin: 8.r, end: 10.r).animate(controller);
  }

  @override
  void didUpdateWidget(covariant CarouselIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCurrent != widget.isCurrent) {
      setState(() {
        isCurrent = widget.isCurrent;
      });
      if (isCurrent) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          height: 8.h,
          width: widthAnimation.value,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(radiusAnimation.value),
          ),
        );
      },
    );
  }
}
