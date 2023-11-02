import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';

import '../../theme.dart';

class OnboardingScreenOne extends StatefulWidget {
  const OnboardingScreenOne({super.key});

  @override
  State<OnboardingScreenOne> createState() => _OnboardingScreenOne();
}

class _OnboardingScreenOne extends State<OnboardingScreenOne> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    _pageIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(_pageIndex + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: onBoardScreenOneTheme,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                _pageIndex = value;
              }),
              physics: const ClampingScrollPhysics(),
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: pages[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 1.1,
                        sigmaY: 3.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 30, right: 90, bottom: 150, top: 150),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black, Color.fromARGB(0, 0, 0, 0)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(
                          pages[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 110,
              left: 30,
              child: Row(
                children: List.generate(
                  pages.length,
                  (idx) => Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: _pageIndex == idx
                            ? Colors.white70
                            : Colors.white24),
                    margin: const EdgeInsets.all(5),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "Skip",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Visibility.maintain(
                    visible: _pageIndex != (pages.length - 1),
                    child: IconButton(
                      onPressed: nextPage,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoard {
  const OnBoard({required this.image, required this.title});

  final AssetImage image;
  final String title;
}

List<OnBoard> pages = const [
  OnBoard(
    image: AssetImage('assets/images/row-1-column-1.png'),
    title: 'Review and edit your track fast',
  ),
  OnBoard(
    image: AssetImage('assets/images/row-1-column-2.png'),
    title: 'Schedule your returns pickup',
  ),
  OnBoard(
    image: AssetImage('assets/images/row-1-column-3.png'),
    title: 'Give Your best product feedback',
  ),
];
