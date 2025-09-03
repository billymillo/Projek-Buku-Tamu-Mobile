import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/LockPinController.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';

class LockPinPage extends StatelessWidget {
  LockPinPage({super.key});

  final LockPinController c = Get.put(LockPinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Background bawah
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
                    image: AssetImage('assets/image/slider7.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),

          /// Konten utama
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  /// Tombol Back
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: PrimaryColor().blue, size: 28),
                      onPressed: () => Get.toNamed(Routes.MAINMENUP),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Image.asset("assets/icon/bukuTamu.png", width: 90),
                  const SizedBox(height: 12),
                  const Text(
                    'Masukkan PIN',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'PIN diperlukan untuk masuk ke dalam sistem Buku Tamu',
                      style: TextStyle(fontFamily: "Roboto", fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Pin Bulat indikator
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) {
                        bool filled = index < c.pin.value.length;
                        return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 14,
                            height: 14,
                            child: filled
                                ? Icon(Icons.circle,
                                    color: PrimaryColor().blue, size: 14)
                                : Icon(Icons.circle_outlined,
                                    color: Colors.grey.shade300, size: 14));
                      }),
                    );
                  }),

                  const SizedBox(height: 25),

                  /// Keypad
                  /// Keypad
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      _buildRow(["1", "2", "3"]),
                      const SizedBox(height: 16),
                      _buildRow(["4", "5", "6"]),
                      const SizedBox(height: 16),
                      _buildRow(["7", "8", "9"]),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPinButtonIcon(FontAwesomeIcons.circleXmark,
                              onTap: () => c.clearPin()), // X
                          _buildPinButton("0", onTap: () => c.addDigit("0")),
                          _buildPinButtonIcon(FontAwesomeIcons.deleteLeft,
                              onTap: () => c.removeDigit()), // backspace
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),

                  const SizedBox(height: 10),
                  Text(
                    '© 2025 PPLG XII - 3 | GEN - 21 All rights reserved.',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build Row angka
  Widget _buildRow(List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: numbers
          .map((n) => _buildPinButton(n, onTap: () => c.addDigit(n)))
          .toList(),
    );
  }

  /// Button Angka
  Widget _buildPinButton(String text, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
          if (c.pin.value.length == 6) {
            if (c.pin.value == "123456") {
              Get.offAllNamed(Routes.HISTORYPAGE);
            } else {
              Get.snackbar("Error", "PIN salah",
                  backgroundColor: Colors.red.shade100);
              c.clearPin();
            }
          }
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F1FA),
            shape: BoxShape.circle,
            border: Border.all(color: PrimaryColor().blue, width: 1),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PrimaryColor().blue,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Button Icon
  Widget _buildPinButtonIcon(IconData icon, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F1FA),
            shape: BoxShape.circle,
            border: Border.all(color: PrimaryColor().blue, width: 1),
          ),
          child: Center(
            child: Icon(icon, color: PrimaryColor().blue, size: 20),
          ),
        ),
      ),
    );
  }
}
