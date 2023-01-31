part of 'auth_pageview.dart';

class AuthTabItem extends StatelessWidget {
  final bool isSignUp;
  final bool isActive;
  final VoidCallback onTap;
  const AuthTabItem({
    required this.isSignUp,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: 80.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isSignUp ? 'Sign up' : 'Log in',
              textAlign: TextAlign.center,
              style: TextStyleManager.paragraph.copyWith(
                color: ColorsManager.raspberry100,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              height: 4.h,
              margin: EdgeInsets.only(top: 8.h),
              width: isActive ? 80.w : 0,
              decoration: BoxDecoration(
                color: ColorsManager.raspberry100,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
