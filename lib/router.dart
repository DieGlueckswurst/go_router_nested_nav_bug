import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
import 'main.dart';
import 'navbar.dart';

final GoRouter router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  redirect: (state) {
    return null;
  },
  debugLogDiagnostics: true,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text(
          'No route defined for ${state.path}.\n error: ${state.error}',
        ),
      ),
    );
  },
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/',
      redirect: (_) => '/home/${BottomNavBarOption.wishlists.name}',
    ),
    GoRoute(
      path: '/home/:navBarOptionName',
      builder: (context, state) {
        final navBarOptionName = state.params['navBarOptionName']!;
        final navBarOption = BottomNavBarOption.values.firstWhere(
          (navBarOption) => navBarOption.name == navBarOptionName,
          orElse: () => throw Exception(
            'navBarOption not found: $navBarOptionName',
          ),
        );

        return NavBarScaffold(
          key: state.pageKey,
          navBarOption: navBarOption,
        );
      },
      // pageBuilder: (context, state) {
      //   final navBarOptionName = state.params['navBarOptionName']!;
      //   final navBarOption = BottomNavBarOption.values.firstWhere(
      //       (navBarOption) => navBarOption.name == navBarOptionName,
      //       orElse: () =>
      //           throw Exception('navBarOption not found: $navBarOptionName'));

      //   return NativePageTransition(
      //     screenToTransition: NavBarScaffold(
      //       key: state.pageKey,
      //       navBarOption: navBarOption,
      //     ),
      //     key: state.pageKey,
      //     restorationId: state.pageKey.value,
      //   );
      // },
    ),
  ],
);
