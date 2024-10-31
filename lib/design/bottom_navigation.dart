import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';

class BottomNavigation extends StatelessWidget {
  final int current;
  final void Function(int) onTap;
  const BottomNavigation({super.key, required this.current, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: system4
          )
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: system3,
          currentIndex: current,
          onTap: onTap,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedFontSize: 7,
          unselectedFontSize: 7,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                current == 0 ? Icons.person_search_rounded : Icons.person_search_outlined,
                color: Colors.black,
                size: 28
              ),
              label: '유저 검색'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                current == 1 ? Icons.home : Icons.home_outlined,
                color: Colors.black,
                size: 28
              ),
              label: '홈'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                current == 2 ? Icons.favorite : Icons.favorite_border,
                color: Colors.black,
                size: 28
              ),
              label: '찜'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                current == 3 ? Icons.person : Icons.person_outline,
                color: Colors.black,
                size: 28
              ),
              label: '프로필'
            )
          ]
        )
      )
    );
  }
}
