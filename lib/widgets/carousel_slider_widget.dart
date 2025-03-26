import 'dart:async';
import 'package:flutter/material.dart';

class CarouselSliderWithAutoSwipe extends StatefulWidget {
  const CarouselSliderWithAutoSwipe({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderWithAutoSwipeState createState() =>
      _CarouselSliderWithAutoSwipeState();
}

class _CarouselSliderWithAutoSwipeState
    extends State<CarouselSliderWithAutoSwipe> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<String> _bannerImages = [
    // 1
    'lib/images/espresso shot rectangular banner.png',

    // 2
    'lib/images/Cappuccion Coffee rectangular banner.png',

    // 3
    'lib/images/iced Coffee rectangular banner .png',

    // 4
    "lib/images/hot tea rectangular banner .png",

    // 5
    "lib/images/latte rectangular banner .png"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoSwipe();
  }

  void _startAutoSwipe() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      // Animate to the next page with a smooth transition
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Slider with images
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _bannerImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    _bannerImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Dot indicators for active page
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _bannerImages.length,
            (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 6 : 5, // Active dot larger
                height: _currentPage == index ? 12 : 8, // Active dot larger
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.white
                      : Colors.grey, // Change color
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
