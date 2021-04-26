// import 'package:clean_architechture/presentation/list_user/bloc/list_user_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// class ListUserScreen extends StatefulWidget {
//   ListUserScreen({Key? key}) : super(key: key);
//
//   @override
//   _ListUserScreenState createState() {
//     return _ListUserScreenState();
//   }
// }
//
// class _ListUserScreenState extends State<ListUserScreen> {
//   final RefreshController _refreshController =
//       RefreshController(initialRefresh: false);
//
//   @override
//   void dispose() {
//     _refreshController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       appBar: AppBar(
//         title: Text(
//           "List User",
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         automaticallyImplyLeading: false,
//       ),
//       body: BlocConsumer<ListUserBloc, ListUserState>(
//         listener: (context, state) {
//           switch (state.runtimeType) {
//             case LoadingListUser:
//               break;
//             case ShowListUser:
//               _refreshController.refreshCompleted();
//               _refreshController.loadComplete();
//               break;
//           }
//         },
//         buildWhen: (_, current) => current is ShowListUser,
//         builder: (context, state) {
//           if (state is ShowListUser) {
//             return SmartRefresher(
//               controller: _refreshController,
//               enablePullDown: true,
//               enablePullUp: true,
//               onRefresh: () => context.read<ListUserBloc>().add(GetListUser()),
//               onLoading: () => context.read<ListUserBloc>().add(LoadMoreUser()),
//               child: ListView.separated(
//                 itemBuilder: (context, index) => Center(
//                   child: Text(
//                     "User $index",
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                 ),
//                 separatorBuilder: (context, index) => const Divider(),
//                 itemCount: state.listUser.length,
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
