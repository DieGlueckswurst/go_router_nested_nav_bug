import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onPageChanged;
  final int initialIndex;
  const BottomNavBar({
    Key? key,
    required this.onPageChanged,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              ...BottomNavBarOption.values.map((option) {
                return BottomNavBarItem(
                  option: option,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    if (_selectedIndex != option.index) {
                      widget.onPageChanged(option.index);
                      setState(() {
                        _selectedIndex = option.index;
                      });
                    }
                  },
                );
              }).toList()
            ],
          ),
        ),
      ],
    );
  }
}

enum BottomNavBarOption {
  wishlists,
  friends,
  events,
  inbox,
  profile,
}

extension BottomNavBarOptionExtension on BottomNavBarOption {
  int get index {
    switch (this) {
      case BottomNavBarOption.wishlists:
        return 0;
      case BottomNavBarOption.friends:
        return 1;
      case BottomNavBarOption.events:
        return 2;
      case BottomNavBarOption.inbox:
        return 3;
      case BottomNavBarOption.profile:
        return 4;
    }
  }

  String get title {
    switch (this) {
      case BottomNavBarOption.wishlists:
        return 'Wishlists';
      case BottomNavBarOption.friends:
        return 'Freunde';
      case BottomNavBarOption.events:
        return 'Events';
      case BottomNavBarOption.inbox:
        return 'Inbox';
      case BottomNavBarOption.profile:
        return 'Profil';
    }
  }
}

class BottomNavBarItem extends StatelessWidget {
  final BottomNavBarOption option;
  final int selectedIndex;
  final VoidCallback onTap;
  const BottomNavBarItem({
    Key? key,
    required this.option,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/bottom_nav_bar_icons/${option.name}${selectedIndex == option.index ? '_filled' : ''}.png',
                height: 18,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                option.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
