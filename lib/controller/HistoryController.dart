import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:mobile/services/apiService.dart';
import 'package:http/http.dart' as http;

class HistoryController extends GetxController {
  final ApiService apiService = ApiService();
  var isLoading = false.obs;
  var alumni = <Map<String, dynamic>>[].obs;
  var company = <Map<String, dynamic>>[].obs;
  var kunjungan = <Map<String, dynamic>>[].obs;
  var parent = <Map<String, dynamic>>[].obs;
  var selectedTab = 'alumni'.obs;
  var visibleItemCount = 5.obs;

  @override
  void onInit() async {
    super.onInit();
    await initializeDateFormatting('id_ID', null);
    await fetchCompany();
    await fetchAlumni();
    await fetchParent();
    await fetchKunjungan();
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  Future<void> fetchKunjungan() async {
    var url = '${ApiService.baseUrl}/guest-visitors';
    final box = GetStorage();
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception("Token tidak ditemukan, silakan login ulang.");
      }
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['status'] == "success") {
          kunjungan.value = List<Map<String, dynamic>>.from(jsonData['data']);
        } else {
          throw Exception('Failed to load guest Kunjungan');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchParent() async {
    var url = '${ApiService.baseUrl}/guest-parents';
    final box = GetStorage();
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception("Token tidak ditemukan, silakan login ulang.");
      }
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['status'] == "success") {
          parent.value = List<Map<String, dynamic>>.from(jsonData['data']);
        } else {
          throw Exception('Failed to load guest orang tua');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchAlumni() async {
    var url = '${ApiService.baseUrl}/guest-alumni';
    final box = GetStorage();
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception("Token tidak ditemukan, silakan login ulang.");
      }
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['status'] == "success") {
          alumni.value = List<Map<String, dynamic>>.from(jsonData['data']);
        } else {
          throw Exception('Failed to load guest Alumni');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchCompany() async {
    var url = '${ApiService.baseUrl}/guest-companies';
    final box = GetStorage();
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception("Token tidak ditemukan, silakan login ulang.");
      }
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['status'] == "success") {
          company.value = List<Map<String, dynamic>>.from(jsonData['data']);
        } else {
          throw Exception('Failed to load guest companies');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
