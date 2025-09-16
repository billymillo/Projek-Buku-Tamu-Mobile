import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/appPages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:mobile/services/apiService.dart';
import 'package:mobile/models/colorpalette.dart';

class ParentController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;

  final signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  // observable file
  final savedSignatureFile = Rxn<File>();
  final rayon = [
    'Ciawi 1',
    'Ciawi 2',
    'Ciawi 3',
    'Ciawi 4',
    'Ciawi 5',
    'Ciawi 6',
    'Cibedug 1',
    'Cibedug 2',
    'Cibedug 3',
    'Cibedug 4',
    'Cicurug 1',
    'Cicurug 2',
    'Cicurug 3',
    'Cicurug 4',
    'Cicurug 5',
    'Cicurug 6',
    'Cicurug 7',
    'Cicurug 8',
    'Cicurug 9',
    'Cicurug 10',
    'Cisarua 1',
    'Cisarua 2',
    'Cisarua 3',
    'Cisarua 4',
    'Cisarua 5',
    'Cisarua 6',
    'Cisarua 7',
    'Sukasari 1',
    'Sukasari 2',
    'Tajur 1',
    'Tajur 2',
    'Tajur 3',
    'Tajur 4',
    'Tajur 5',
    'Tajur 6',
    'Wikrama 1',
    'Wikrama 2',
    'Wikrama 3',
    'Wikrama 4',
    'Wikrama 5',
  ];

  Future<bool> addParent(
    String name,
    String studentName,
    String rayon,
    String address,
    String phone,
    String email,
    String purposes,
  ) async {
    isLoading.value = true;
    try {
      final response = await apiService.parent(
        name,
        studentName,
        rayon,
        address,
        phone,
        email,
        purposes,
        savedSignatureFile.value,
      );

      if (response['status'] == 'success') {
        print(response['message']);
        Get.snackbar(
          'Berhasil',
          "Data tamu Orang Tua berhasil ditambahkan",
          backgroundColor: PrimaryColor().green.withOpacity(0.5),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );
        Get.to(Routes.MAINMENUP);
        return true;
      } else {
        Get.snackbar(
          'Gagal',
          response['message'] ?? 'Gagal menambahkan Tamu Orang Tua',
          backgroundColor: PrimaryColor().red.withOpacity(0.5),
          icon: const Icon(Icons.error, color: Colors.white),
        );
        print("error api" + response['message']);
      }
      return false;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: PrimaryColor().red.withOpacity(0.5),
        icon: const Icon(Icons.crisis_alert, color: Colors.black),
      );
      print("Error: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
