import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/routes/appPages.dart';

class ValidationP extends StatefulWidget {
  const ValidationP({super.key});

  @override
  State<ValidationP> createState() => _ValidationPState();
}

class _ValidationPState extends State<ValidationP>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offNamed(Routes.MAINMENUP);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          "assets/lottie/splashScreen.json",
          controller: _controller,
          onLoaded: (composition) {
            final fullDuration = composition.duration;
            final skippedStart = Duration(seconds: 1);
            final remainingDuration = fullDuration - skippedStart;
            _controller.duration = remainingDuration * (1 / 1.5);
            final startProgress =
                skippedStart.inMilliseconds / fullDuration.inMilliseconds;

            _controller.forward(from: startProgress);
          },
        ),
      ),
    );
  }
}
