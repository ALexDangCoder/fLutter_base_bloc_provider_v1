// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architechture/application/auth/auth_bloc.dart' as _i7;
import 'package:clean_architechture/domain/auth/i_auth_facade.dart' as _i3;
import 'package:clean_architechture/domain/core/shared_pref_manager.dart'
    as _i5;
import 'package:clean_architechture/domain/core/theme_manager.dart' as _i6;
import 'package:clean_architechture/infrastructure/auth/app_auth_facade.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IAuthFacade>(() => _i4.AppAuthFacade());
    gh.lazySingleton<_i5.SharedPreferencesManager>(
        () => _i5.SharedPreferencesManager());
    gh.lazySingleton<_i6.ThemeManager>(() => _i6.ThemeManager());
    gh.factory<_i7.AuthBloc>(
        () => _i7.AuthBloc(authFacade: gh<_i3.IAuthFacade>()));
    return this;
  }
}
