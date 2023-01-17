import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time/time.dart';

part 'list_user_event.dart';
part 'list_user_state.dart';
part 'list_user_bloc.freezed.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  List<String> items = <String>[];

  ListUserBloc() : super(const _Initial()) {
    on<ListUserEvent>((event, emit) async {
      event.when(
        loadMoreUser: () async {
          await _mapLoadMoreListUserToState(emit);
        },
        getListUser: () async {
          await _mapGetListUserToState(emit);
        },
      );
    });
  }

  Future<void> _mapLoadMoreListUserToState(Emitter<ListUserState> emit) async {
    emit(const _LoadingListUser());
    await 2.seconds.delay;
    int lastItem = int.parse(items.last);
    items.addAll(
      <String>[
        (lastItem + 1).toString(),
        (lastItem + 2).toString(),
        (lastItem + 3).toString(),
      ],
    );
    emit(_ShowListUser(listUser: items));
  }

  Future<void> _mapGetListUserToState(Emitter<ListUserState> emit) async {
    emit(const _LoadingListUser());
    await 500.milliseconds.delay;
    items = ["1", "2", "3", "4", "5", "6", "7", "8"];
    emit(_ShowListUser(listUser: items));
  }
}
