import 'package:get/get.dart';
import 'package:mobile/routes/appPages.dart';

class LockPinController extends GetxController {
  var pin = "".obs;

  final String correctPin = "123456"; // PIN yang benar

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
      // pindah ke halaman HistoryPage
      Get.offAllNamed(Routes.HISTORYPAGE);
    } else {
      // reset jika salah
      Get.snackbar("PIN Salah", "Silakan coba lagi");
      clearPin();
    }
  }
}
