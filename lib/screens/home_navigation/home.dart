import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import './onboarding_screen_list.dart';
import '../../theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _pageChangeHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Theme(
      data: homeScreenTheme,
      child: Builder(builder: (context) {
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const OnboardingScreenList(),
                  Center(
                    child: Text(
                      'Home 3',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Home 4',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1,
                sigmaY: 20,
              ),
              child: NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _pageChangeHandler,
                destinations: [
                  NavigationDestination(
                    selectedIcon: Icon(
                      Ionicons.grid_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    icon: const Icon(
                      Ionicons.grid_outline,
                    ),
                    label: 'Dashboard',
                  ),
                  NavigationDestination(
                    icon: const Icon(Ionicons.tv_outline),
                    selectedIcon: Icon(
                      Ionicons.tv_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: 'Onboard Screens',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Ionicons.extension_puzzle_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    icon: const Icon(Ionicons.extension_puzzle_outline),
                    label: 'Form Screens',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.bookmark_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    icon: const Icon(Ionicons.bookmark_outline),
                    label: 'Saved',
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
