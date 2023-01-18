import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty({required T failedValue}) = _Empty<T>;
  const factory ValueFailure.invalidEmail({required T failedValue}) =
      _InvalidEmail<T>;
  const factory ValueFailure.shortPassword({required T failedValue}) =
      _ShortPassword<T>;
}
