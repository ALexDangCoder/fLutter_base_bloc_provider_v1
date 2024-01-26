import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/home_route.dart';
import '../../list_user/list_user_route.dart';
import '../main_route.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.child, super.key});

  final Widget child;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location == '/home') {
      return 1;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = getCurrentIndex(context);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              HomeRoute().go(context);
            case 1:
              ListUserRoute().go(context);
          }
        },
      ),
    );
  }
}
