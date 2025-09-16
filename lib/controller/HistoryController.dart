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

  var currentPage = 1.obs;
  var selectedTab = 'alumni'.obs;
  var visibleItemCount = 5.obs;
  var searchQuery = "".obs;

  var alumniPage = 1.obs;
  var companyPage = 1.obs;
  var kunjunganPage = 1.obs;
  var parentPage = 1.obs;

  var alumniLastPage = 1.obs;
  var companyLastPage = 1.obs;
  var parentLastPage = 1.obs;
  var kunjunganLastPage = 1.obs;

  final int perPage = 10;

  @override
  void onInit() async {
    super.onInit();
    await initializeDateFormatting('id_ID', null);
    fetchAlumni();
    fetchCompany();
    fetchParent();
    fetchKunjungan();
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  Future<void> fetchData({
    required String endpoint,
    required int page,
    required RxList<Map<String, dynamic>> targetList,
    required RxInt lastPageVar,
  }) async {
    final box = GetStorage();
    final token = box.read('token');
    if (token == null) {
      print("Token tidak ditemukan, silakan login ulang.");
      return;
    }

    try {
      isLoading(true);
      var url = '${ApiService.baseUrl}/$endpoint?page=$page';

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
          if (page == 1) targetList.clear();

          targetList.addAll(
            List<Map<String, dynamic>>.from(jsonData['data']),
          );

          // === Ambil last_page & current_page dari API ===
          if (jsonData['last_page'] != null) {
            lastPageVar.value = jsonData['last_page'];
            currentPage.value = page;
          } else if (jsonData['meta']?['last_page'] != null) {
            lastPageVar.value = jsonData['meta']['last_page'];
            currentPage.value = page;
          } else if (jsonData['meta']?['pagination'] != null) {
            final pagination = jsonData['meta']['pagination'];
            lastPageVar.value = pagination['last_page'] ?? 1;
            currentPage.value = pagination['current_page'] ?? page;
          }
        } else {
          throw Exception("Gagal load data dari $endpoint");
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetch $endpoint: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchAlumni({int? page, bool loadMore = false}) async {
    if (page != null) {
      // Kalau spesifik ke halaman tertentu
      alumniPage.value = page;
      alumni.clear();
    } else if (loadMore) {
      alumniPage.value++;
    } else {
      alumniPage.value = 1;
      alumni.clear();
    }

    await fetchData(
      endpoint: 'guest-alumni',
      page: alumniPage.value,
      targetList: alumni,
      lastPageVar: alumniLastPage,
    );
  }

  Future<void> fetchCompany({int? page, bool loadMore = false}) async {
    if (page != null) {
      companyPage.value = page;
      company.clear();
    } else if (loadMore) {
      companyPage.value++;
    } else {
      companyPage.value = 1;
      company.clear();
    }

    await fetchData(
      endpoint: 'guest-companies',
      page: companyPage.value,
      targetList: company,
      lastPageVar: companyLastPage,
    );
  }

  Future<void> fetchParent({int? page, bool loadMore = false}) async {
    if (page != null) {
      parentPage.value = page;
      parent.clear();
    } else if (loadMore) {
      parentPage.value++;
    } else {
      parentPage.value = 1;
      parent.clear();
    }

    await fetchData(
      endpoint: 'guest-parents',
      page: parentPage.value,
      targetList: parent,
      lastPageVar: parentLastPage,
    );
  }

  Future<void> fetchKunjungan({int? page, bool loadMore = false}) async {
    if (page != null) {
      kunjunganPage.value = page;
      kunjungan.clear();
    } else if (loadMore) {
      kunjunganPage.value++;
    } else {
      kunjunganPage.value = 1;
      kunjungan.clear();
    }

    await fetchData(
      endpoint: 'guest-visitors',
      page: kunjunganPage.value,
      targetList: kunjungan,
      lastPageVar: kunjunganLastPage,
    );
  }
}
