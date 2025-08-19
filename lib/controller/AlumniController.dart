import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/appPages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:mobile/services/apiService.dart';
import 'package:mobile/models/colorpalette.dart';

class AlumniController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;

  final signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  // observable file
  final savedSignatureFile = Rxn<File>();

  Future<bool> addAlumni(
    String name,
    String graduation,
    String major,
    String phone,
    String email,
    String purpose,
  ) async {
    isLoading.value = true;
    try {
      final response = await apiService.alumni(
        name,
        graduation,
        major,
        phone,
        email,
        purpose,
        savedSignatureFile.value,
      );

      if (response['status'] == true) {
        Get.snackbar(
          'Berhasil',
          "Data tamu Alumni berhasil ditambahkan",
          backgroundColor: PrimaryColor().green.withOpacity(0.5),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );
        return true; 
      } else {
        Get.snackbar(
          'Gagal',
          response['message'] ?? 'Gagal menambahkan Tamu Alumni',
          backgroundColor: PrimaryColor().red.withOpacity(0.5),
          icon: const Icon(Icons.error, color: Colors.white),
        );
        return false;
      }
    } catch (e) {
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
