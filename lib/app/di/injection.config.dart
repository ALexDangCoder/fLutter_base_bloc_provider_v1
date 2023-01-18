// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architechture/app/app.dart' as _i8;
import 'package:clean_architechture/app/managers/shared_pref_manager.dart'
    as _i7;
import 'package:clean_architechture/data/login/api/login_api.dart' as _i5;
import 'package:clean_architechture/data/login/repositories/login_repository_impl.dart'
    as _i4;
import 'package:clean_architechture/domain/login/repositories/login_repository.dart'
    as _i3;
import 'package:clean_architechture/domain/login/usecases/login_usecase.dart'
    as _i6;
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
    gh.lazySingleton<_i3.LoginRepository>(
        () => _i4.LoginRepositoryImpl(gh<_i5.LoginApi>()));
    gh.lazySingleton<_i6.LoginUseCase>(
        () => _i6.LoginUseCase(gh<_i3.LoginRepository>()));
    gh.lazySingleton<_i7.SharedPreferencesManager>(
        () => _i7.SharedPreferencesManager());
    gh.lazySingleton<_i8.ThemeManager>(() => _i8.ThemeManager());
    return this;
  }
}
