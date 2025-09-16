import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';

class LockPinController extends GetxController {
  var pin = "".obs;

  final String correctPin = "242411";

  void addDigit(String digit) {
    if (pin.value.length < 6) {
      pin.value += digit;

      if (pin.value.length == 6) {
        checkPin();
      }
    }
  }

  void removeDigit() {
    if (pin.value.isNotEmpty) {
      pin.value = pin.value.substring(0, pin.value.length - 1);
    }
  }

  void clearPin() {
    pin.value = "";
  }

  void checkPin() {
    if (pin.value == correctPin) {
      Get.offAllNamed(Routes.HISTORYPAGE);
    } else {
      Get.snackbar(
        'Gagal',
        "Pin yang dimasukkan salah!",
        backgroundColor: PrimaryColor().red.withOpacity(0.5),
        icon: const Icon(Icons.crisis_alert, color: Colors.black),
      );
      clearPin();
    }
  }
}
