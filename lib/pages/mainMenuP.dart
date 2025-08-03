import 'package:flutter/material.dart';

class MainMenuP extends StatelessWidget {
  const MainMenuP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/slider1.jpg'),
                    fit: BoxFit.cover),
              ),
            )
          ],
        ),
      ),
    );
  }
}
