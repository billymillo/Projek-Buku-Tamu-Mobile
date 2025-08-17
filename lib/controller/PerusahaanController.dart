import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:mobile/services/apiService.dart';
import 'package:mobile/models/colorpalette.dart';

class PerusahaanController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;

  final signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  // observable file
  final savedSignatureFile = Rxn<File>();

  Future<void> addPerusahaan(
    String name,
    String company,
    String phone,
    String email,
    String purpose,
  ) async {
    isLoading.value = true;
    try {
      final response = await apiService.perusahaan(
        name,
        company,
        phone,
        email,
        purpose,
        savedSignatureFile.value, // <-- akses file dari Rxn
      );

      if (response['status'] == true) {
        print(response['message']);
        Get.snackbar(
          'Success',
          "Data tamu Perusahaan berhasil ditambahkan",
          backgroundColor: PrimaryColor().green.withOpacity(0.5),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );
      } else {
        Get.snackbar(
          'Error',
          response['message'] ?? 'Gagal menambahkan tamu kunjungan',
          backgroundColor: PrimaryColor().red.withOpacity(0.5),
          icon: const Icon(Icons.error, color: Colors.white),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: PrimaryColor().red.withOpacity(0.5),
        icon: const Icon(Icons.crisis_alert, color: Colors.black),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
