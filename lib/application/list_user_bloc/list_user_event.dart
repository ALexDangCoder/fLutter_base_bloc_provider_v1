part of 'list_user_bloc.dart';

@freezed
class ListUserEvent with _$ListUserEvent {
  const factory ListUserEvent.loadMoreUser() = _LoadMoreUser;
  const factory ListUserEvent.getListUser() = _GetListUser;
}
