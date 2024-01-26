// part of app_layer;
//
// enum RouteDefine {
//   loginScreen,
//   homeScreen,
//   listUserScreen,
// }
//
// extension RouteDefineExtension on RouteDefine {
//   String get path => '/$name';
// }
//
// class AppRouting {
//   static final GoRouter generateRoute = GoRouter(
//     routes: <RouteBase>[
//       GoRoute(
//         path: '/',
//         builder: (_, __) => LoginRoute.route,
//         routes: <RouteBase>[
//           GoRoute(
//             path: RouteDefine.loginScreen.name,
//             builder: (_, __) => LoginRoute.route,
//           ),
//           GoRoute(
//             path: RouteDefine.homeScreen.name,
//             builder: (_, __) => HomeRoute.route,
//           ),
//           GoRoute(
//             path: RouteDefine.listUserScreen.name,
//             builder: (_, __) => ListUserRoute.route,
//           ),
//         ],
//       ),
//     ],
//   );
// }
