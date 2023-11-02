import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwo();
}

class _OnboardingScreenTwo extends State<OnboardingScreenTwo> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
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
      data: onBoardScreenTwoTheme,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/onbarding_screen_one_backgroud.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (value) =>
                              {setState(() => _pageIndex = value)},
                          itemCount: 3,
                          itemBuilder: (context, index) => OnboardContent(
                            title: demoData[index].title,
                            text: demoData[index].text,
                            image: demoData[index].image,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                demoData.length,
                                (index) =>
                                    DotIndicator(isActive: index == _pageIndex),
                              ),
                            ],
                          ),
                          Visibility.maintain(
                            visible: _pageIndex != (demoData.length - 1),
                            child: Ink(
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: nextPage,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: isActive ? 10 : 6,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: isActive ? Colors.white : Colors.grey,
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });

  final String title;
  final String text;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        image,
        const SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white70,
              ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}

class Onboard {
  const Onboard({required this.title, required this.text, required this.image});

  final String title;
  final String text;
  final Image image;
}

const List<Onboard> demoData = [
  Onboard(
    title: 'Behavioral Health Service',
    text:
        'Transforming lives by offering hope and opportunities for recovery, wellness, and independence.',
    image: Image(
      image: AssetImage('assets/images/Object.png'),
    ),
  ),
  Onboard(
    title: 'Mental Health Service',
    text:
        'If you think that you or someone you know has a mental health problem, there are a number of ways that you can seek advice.',
    image: Image(
      image: AssetImage('assets/images/Object 3.png'),
    ),
  ),
  Onboard(
    title: 'Get Started',
    text:
        'Take the first step on your journey to better mental health. Get started today!',
    image: Image(
      image: AssetImage('assets/images/Object 2.png'),
    ),
  )
];
