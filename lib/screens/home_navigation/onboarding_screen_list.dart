import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreenList extends StatelessWidget {
  const OnboardingScreenList({super.key});

  void _selectedOnboard(BuildContext context, String url) {
    context.push(url);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Onboarding Screens',
            style: themeData.textTheme.displaySmall,
          ),
          Text(
            'Heare are the list onf all onboarding screens created by me you can clikc to view theme...',
            style: themeData.textTheme.labelLarge!.copyWith(color: Colors.grey),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          ...dataList
              .map((obj) => OnboardingScreenDetailCard(
                    object: obj,
                    onSelectedOnboard: () {
                      _selectedOnboard(context, obj.url);
                    },
                  ))
              .toList()
        ],
      ),
    );
  }
}

class OnboardingScreenDetailCard extends StatelessWidget {
  const OnboardingScreenDetailCard(
      {super.key, required this.object, required this.onSelectedOnboard});

  final OnboardingScreen object;
  final void Function() onSelectedOnboard;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: onSelectedOnboard,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                width: 150,
                object.imageUrl,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    object.title,
                    style: themeData.textTheme.titleLarge,
                  ),
                  Text(
                    object.subTitle,
                    style: themeData.textTheme.labelMedium!
                        .copyWith(color: Colors.grey.shade500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${object.slides} Slides',
                    style: themeData.textTheme.labelLarge!.copyWith(),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: object.tags
                        .map(
                          (t) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1.7),
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              t,
                              style: themeData.textTheme.labelMedium!.copyWith(
                                color: Colors.green.shade700,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen {
  const OnboardingScreen({
    required this.title,
    required this.url,
    required this.subTitle,
    required this.imageUrl,
    required this.slides,
    required this.tags,
  });
  final String title;
  final String url;
  final String subTitle;
  final String imageUrl;
  final int slides;
  final List<String> tags;
}

List<OnboardingScreen> dataList = const [
  OnboardingScreen(
    title: 'ScreenOne',
    url: "/onboarding_one",
    subTitle: 'Onboarding Screen sub title which is long and will more long',
    imageUrl:
        'https://cdn.dribbble.com/users/4208985/screenshots/15797352/media/cbeda99751314125e53dd9aab55b0914.png?compress=1&resize=1000x750&vertical=center',
    slides: 4,
    tags: ['Animated', 'Cool'],
  ),
  OnboardingScreen(
    title: 'Title Two',
    url: '/onboarding_two',
    subTitle: 'Onboarding Screen sub title which is long and will more long',
    imageUrl:
        'https://cdn.dribbble.com/users/2113704/screenshots/14936270/media/100c42747dece9e5ec9535e2c169692a.png?compress=1&resize=1000x750&vertical=center',
    slides: 3,
    tags: ['Animated'],
  ),
];
