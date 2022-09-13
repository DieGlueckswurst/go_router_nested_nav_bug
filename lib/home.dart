import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_bug/view_1.dart';
import 'package:go_router_bug/view_2.dart';
import 'package:go_router_bug/view_3.dart';
import 'package:go_router_bug/view_4.dart';
import 'package:go_router_bug/view_5.dart';
import 'navbar.dart';

class NavBarScaffold extends StatefulWidget {
  final BottomNavBarOption navBarOption;
  const NavBarScaffold({
    Key? key,
    required this.navBarOption,
  }) : super(key: key);

  @override
  State<NavBarScaffold> createState() => _NavBarScaffoldState();
}

class _NavBarScaffoldState extends State<NavBarScaffold>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      animationDuration: Duration.zero,
      length: BottomNavBarOption.values.length,
      vsync: this,
      initialIndex: widget.navBarOption.index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(NavBarScaffold navBarScaffold) {
    super.didUpdateWidget(navBarScaffold);
    _controller.index = widget.navBarOption.index;
    print(widget.navBarOption.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              View1(),
              View2(),
              View3(),
              View4(),
              View5(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(
              initialIndex: widget.navBarOption.index,
              onPageChanged: (index) => _tap(context, index),
            ),
          ),
        ],
      ),
    );
  }

  void _tap(BuildContext context, int index) => context.go(
        '/home/${BottomNavBarOption.values[index].name}',
      );
}
