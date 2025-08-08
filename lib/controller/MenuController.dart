import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  final PageController pageController = PageController();
  final currentPage = 0.obs;
  final List<String> sliderImages = [
    'assets/image/slider1.jpg',
    'assets/image/slider2.png',
    'assets/image/slider3.png',
  ];

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 5), (time) {
      if (pageController.hasClients) {
        int next = (currentPage.value + 1) % sliderImages.length;
        pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        currentPage.value = next;
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
