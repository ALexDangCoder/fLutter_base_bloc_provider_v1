part of 'list_user_bloc.dart';

@freezed
class ListUserState with _$ListUserState {
  const factory ListUserState.initial() = _Initial;
  const factory ListUserState.showListUser({
    required List<String> listUser,
  }) = _ShowListUser;
  const factory ListUserState.loadingListUser() = _LoadingListUser;
}
