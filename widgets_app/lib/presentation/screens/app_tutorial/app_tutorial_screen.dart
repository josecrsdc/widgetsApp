import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Est deserunt duis sunt aute ut. Eu elit irure occaecat qui cupidatat culpa. Ad nisi consectetur cillum laboris enim veniam commodo. Nostrud cillum magna et ipsum aliqua cupidatat aliquip Lorem. Quis aute magna anim excepteur voluptate labore occaecat elit pariatur labore ad ut. Irure est tempor nisi aliqua voluptate laborum id nostrud ipsum.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Magna non labore aliqua duis. Deserunt ea dolor sunt commodo laborum officia. Ad nulla nisi eiusmod in mollit officia sit cupidatat. Voluptate nostrud dolore dolore quis ad aliqua et non commodo excepteur ut mollit anim sunt. Eu commodo sint minim amet consequat amet eiusmod non laborum nulla et.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Qui adipisicing tempor ex non excepteur quis nostrud do proident quis. Commodo proident in mollit eu. Nostrud incididunt anim aute ullamco aliqua aliqua.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slidesData) => _Slide(
                    title: slidesData.title,
                    caption: slidesData.caption,
                    imageUrl: slidesData.imageUrl,
                  ),
                )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),

          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}
