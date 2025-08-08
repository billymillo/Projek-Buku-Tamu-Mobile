import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/slider5.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/slider6.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 21,
              right: 21,
              child: Image.asset(
                'assets/image/Icon.png',
                height: 35,
                width: 35,
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF001E42),
                        fontFamily: "Roboto"),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Email *",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF001E42),
                        fontSize: 14),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukan Email...",
                      hintStyle: TextStyle(
                          fontSize: 12, color: PrimaryColor().shadowBlue),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: PrimaryColor().blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: PrimaryColor().blue, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Kata Sandi *",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF001E42),
                        fontSize: 14),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan Kata Sandi...",
                      hintStyle: TextStyle(
                          fontSize: 12, color: PrimaryColor().shadowBlue),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: PrimaryColor().blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: PrimaryColor().blue, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: PrimaryColor().blue,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Remember me?",
                        style: TextStyle(
                          color: PrimaryColor().blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.MAINMENUP);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PrimaryColor().blue,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Lanjutkan",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                  const Center(
                    child: Text(
                      "© 2025 PPLG XII - 3 | GEN - 21. All rights reserved.",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
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
