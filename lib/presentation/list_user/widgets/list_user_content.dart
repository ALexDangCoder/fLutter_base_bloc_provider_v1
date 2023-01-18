import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../application/list_user/list_user_bloc.dart';
import '../../../domain/core/style_manager.dart';

class ListUserContent extends StatefulWidget {
  const ListUserContent({super.key});

  @override
  State<ListUserContent> createState() => _ListUserContentState();
}

class _ListUserContentState extends State<ListUserContent> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListUserBloc, ListUserState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          showListUser: (_) {
            _refreshController.refreshCompleted();
            _refreshController.loadComplete();
          },
          loadingListUser: () {},
        );
      },
      buildWhen: (_, current) => current.maybeWhen(
        showListUser: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          showListUser: (listUser) {
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: () => context
                  .read<ListUserBloc>()
                  .add(const ListUserEvent.getListUser()),
              onLoading: () => context
                  .read<ListUserBloc>()
                  .add(const ListUserEvent.loadMoreUser()),
              child: ListView.separated(
                itemBuilder: (context, index) => Center(
                  child: Text(
                    "User $index",
                    style: TextStyleManager.label3,
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: listUser.length,
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
