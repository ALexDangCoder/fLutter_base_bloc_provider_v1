import 'package:firebase_core/firebase_core.dart';

import '../../firebase/firebase_options_dev.dart' as dev;
import '../../firebase/firebase_options_staging.dart' as staging;
import '../../firebase/firebase_options.dart' as prod;

enum FlavorManager {
  dev,
  staging,
  production,
}

class ConfigManager {
  final String apiBaseUrl;
  final FlavorManager appFlavor;

  ConfigManager({
    required this.apiBaseUrl,
    required this.appFlavor,
  });

  static ConfigManager? _instance;

  static ConfigManager devConfig = ConfigManager(
    apiBaseUrl: 'https://your_dev_api/',
    appFlavor: FlavorManager.dev,
  );

  static ConfigManager stagingConfig = ConfigManager(
    apiBaseUrl: 'https://your_staging_api/',
    appFlavor: FlavorManager.staging,
  );

  static ConfigManager productionConfig = ConfigManager(
    apiBaseUrl: 'https://your_production_api/',
    appFlavor: FlavorManager.production,
  );

  FirebaseOptions get flavorFirebaseOption {
    switch (_instance?.appFlavor) {
      case FlavorManager.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case FlavorManager.staging:
        return staging.DefaultFirebaseOptions.currentPlatform;
      case FlavorManager.production:
        return prod.DefaultFirebaseOptions.currentPlatform;
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }

  static ConfigManager? getInstance({String? flavorName}) {
    if (_instance == null) {
      switch (flavorName) {
        case 'dev':
          {
            _instance = devConfig;
          }
          break;
        case 'staging':
          {
            _instance = stagingConfig;
          }
          break;
        case 'production':
          {
            _instance = productionConfig;
          }
          break;
      }

      return _instance;
    }

    return _instance;
  }
}
