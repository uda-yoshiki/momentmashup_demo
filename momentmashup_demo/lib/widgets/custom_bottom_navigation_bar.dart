import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'ランキング',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'プレミアム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timeline),
          label: 'timeline',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'setting',
        ),
      ],
      selectedItemColor: const Color(0xFF03AED2),
      unselectedItemColor: const Color(0xFF68D2E8),
      onTap: onItemSelected,
    );
  }
}