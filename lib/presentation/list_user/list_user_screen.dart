// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../app/app.dart';
import 'bloc/list_user_bloc.dart';
import 'widgets/list_user_content.dart';

// Project imports:

class ListUserScreen extends StatelessWidget with AutoRouteWrapper {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ListUserBloc()..add(GetListUser()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "List User",
          style: TextStyleManager.label3,
        ),
        automaticallyImplyLeading: false,
      ),
      body: const ListUserContent(),
    );
  }
}
