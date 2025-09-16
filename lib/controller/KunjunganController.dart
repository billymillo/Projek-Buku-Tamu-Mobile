import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/appPages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:mobile/services/apiService.dart';
import 'package:mobile/models/colorpalette.dart';

class KunjunganController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;

  final signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  // observable file
  final savedSignatureFile = Rxn<File>();

  Future<bool> addKunjungan(
    String name,
    String institution,
    String phone,
    String email,
    String purpose,
  ) async {
    isLoading.value = true;
    try {
      final response = await apiService.kunjungan(
        name,
        institution,
        phone,
        email,
        purpose,
        savedSignatureFile.value,
      );

      if (response['status'] == true) {
        Get.snackbar(
          'Berhasil',
          "Data tamu berhasil ditambahkan",
          backgroundColor: PrimaryColor().green.withOpacity(0.5),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );
        return true;
      } else {
        print("error api" + response['message']);
        Get.snackbar(
          'Gagal',
          response['message'] ?? 'Gagal menambahkan tamu kunjungan',
          backgroundColor: PrimaryColor().red.withOpacity(0.5),
          icon: const Icon(Icons.error, color: Colors.white),
        );
        return false;
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
        'Gagal',
        e.toString(),
        backgroundColor: PrimaryColor().red.withOpacity(0.5),
        icon: const Icon(Icons.crisis_alert, color: Colors.black),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
