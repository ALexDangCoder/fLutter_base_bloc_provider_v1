// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// Package imports:
import 'package:clean_architechture/domain/core/theme_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:clean_architechture/presentation/home/home_screen.dart';
import 'utilities/test_utilitiy.dart';

void main() {
  setUpAll(() {
    GetIt.I.registerLazySingleton<ThemeManager>(
      () => ThemeManager(),
    );
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const TestWidgetWrapper(
        child: HomeScreen(),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('1'), findsNothing);
    expect(find.text('Get Size'), findsOneWidget);
    expect(find.text('Change Theme'), findsOneWidget);
  });
}
