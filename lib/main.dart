// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'app/app.dart';
import 'app/route/app_routing.dart';

void main() async {
  await _beforeRunApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'resources/langs/langs.csv',
      assetLoader: CsvAssetLoader(),
      child: MyApp(),
    ),
  );
}

Future<void> _beforeRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _flavor;

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: ConfigManager.getInstance()!.flavorFirebaseOption,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await setupInjection();
}

Future<void> get _flavor async {
  await const MethodChannel('flavor')
      .invokeMethod<String>('getFlavor')
      .then((String? flavor) => ConfigManager.getInstance(flavorName: flavor))
      .catchError(
    (error) {
      log("Error when set up enviroment: $error");
      ConfigManager.getInstance(flavorName: FlavorManager.dev.name);
    },
  );
}

class MyApp extends StatefulWidget {
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var appTheme = getIt<ThemeManager>();
  final _appRouter = AppRouter();

  @override
  void initState() {
    appTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    appTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      builder: (_, __) => MaterialApp.router(
        builder: (context, child) {
          return child ?? const SizedBox();
        },
        title: 'Flutter Template',
        routerDelegate: _appRouter.delegate(
          navigatorObservers: () => [MyApp.observer],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.lightTheme,
        darkTheme: ThemeManager.darkTheme,
        themeMode: appTheme.currentTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
