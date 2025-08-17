import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';
import 'package:mobile/services/apiService.dart';

class LoginController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;
  // Fungsi login
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await apiService.login(email, password);
      if (response['status'] == "success") {
        Get.toNamed(Routes.MAINMENUP);
        Get.snackbar(
          'Berhasil Masuk',
          "Anda telah berhasil melakukan Login",
          backgroundColor: PrimaryColor().green.withOpacity(0.5),
          icon: const Icon(Icons.check_circle, color: Colors.black),
        );
      } else {
        Get.snackbar(
          'Gagal',
          "Masukkan Email dan Password untuk melakukan Login!",
          backgroundColor: PrimaryColor().red.withOpacity(0.5),
          icon: const Icon(Icons.crisis_alert, color: Colors.black),
        );
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
        'Gagal',
        'Terjadi kesalahan ketika melakukan Login',
        backgroundColor: PrimaryColor().red.withOpacity(0.5),
        icon: const Icon(Icons.crisis_alert, color: Colors.black),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
