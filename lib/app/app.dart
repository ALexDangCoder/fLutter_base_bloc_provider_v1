library app_layer;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../app/managers/shared_pref_manager.dart';
import '../firebase/firebase_options.dart' as prod;
import '../firebase/firebase_options_dev.dart' as dev;
import '../firebase/firebase_options_staging.dart' as staging;
import 'di/injection.dart';

part 'core/enum.dart';
part 'managers/theme_manager.dart';
part 'managers/color_manager.dart';
part 'managers/style_manager.dart';
part 'managers/config_manager.dart';
part 'utils/session_utils.dart';
