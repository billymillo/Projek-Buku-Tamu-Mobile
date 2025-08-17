import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ApiService {
  static String baseUrl =
      "http://192.168.138.73/Buku-Tamu-PPLG-XII-3/backend/public/api";
  final box = GetStorage();

  // Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = '$baseUrl/login';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['data']['token'];

      box.write('token', token);

      return data;
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<Map<String, dynamic>> kunjungan(
    String name,
    String institution,
    String phone,
    String email,
    String purpose,
    File? signature,
  ) async {
    final url = Uri.parse('$baseUrl/guest-visitors');
    final token = box.read('token');

    final request = http.MultipartRequest('POST', url);

    // fields
    request.fields['name'] = name;
    request.fields['institution'] = institution;
    request.fields['phone'] = phone;
    request.fields['email'] = email;
    request.fields['purpose'] = purpose;

    if (signature != null) {
      var sigFile = await http.MultipartFile.fromPath(
        'signature_path',
        signature.path,
      );
      request.files.add(sigFile);
    }

    // headers
    request.headers.addAll({
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    });

    try {
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      Map<String, dynamic> result = jsonDecode(responseData.body);

      return {
        'status': response.statusCode == 200 || response.statusCode == 201,
        'message': result['message'] ?? 'Gagal menambahkan kunjungan',
        'data': result['data'] ?? {},
      };
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan: $e', 'data': {}};
    }
  }

  Future<Map<String, dynamic>> parent(
    String name,
    String studentName,
    String rayon,
    String address,
    String phone,
    String email,
    String purposes,
    File? signature,
  ) async {
    final url = Uri.parse('$baseUrl/guest-parents');
    final token = box.read('token');

    final request = http.MultipartRequest('POST', url);

    request.fields['name'] = name;
    request.fields['student_name'] = studentName;
    request.fields['rayon'] = rayon;
    request.fields['address'] = address;
    request.fields['phone'] = phone;
    request.fields['email'] = email;
    request.fields['purpose'] = purposes;

    if (signature != null) {
      var sigFile = await http.MultipartFile.fromPath(
        'signature_path',
        signature.path,
      );
      request.files.add(sigFile);
    }

    request.headers.addAll({
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    });

    try {
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      Map<String, dynamic> result = jsonDecode(responseData.body);

      return {
        'status': response.statusCode == 200 || response.statusCode == 201,
        'message': result['message'] ?? 'Gagal menambahkan kunjungan',
        'data': result['data'] ?? {},
      };
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan: $e', 'data': {}};
    }
  }

  Future<Map<String, dynamic>> alumni(
    String name,
    String graduation,
    String major,
    String phone,
    String email,
    String purpose,
    File? signature,
  ) async {
    final url = Uri.parse('$baseUrl/guest-alumni');
    final token = box.read('token');

    final request = http.MultipartRequest('POST', url);

    // fields
    request.fields['name'] = name;
    request.fields['graduation_year'] = graduation;
    request.fields['major'] = graduation;
    request.fields['phone'] = phone;
    request.fields['email'] = email;
    request.fields['purpose'] = purpose;

    if (signature != null) {
      var sigFile = await http.MultipartFile.fromPath(
        'signature_path',
        signature.path,
      );
      request.files.add(sigFile);
    }

    // headers
    request.headers.addAll({
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    });

    try {
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      Map<String, dynamic> result = jsonDecode(responseData.body);

      return {
        'status': response.statusCode == 200 || response.statusCode == 201,
        'message': result['message'] ?? 'Gagal menambahkan kunjungan',
        'data': result['data'] ?? {},
      };
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan: $e', 'data': {}};
    }
  }

  Future<Map<String, dynamic>> perusahaan(
    String name,
    String company,
    String phone,
    String email,
    String purpose,
    File? signature,
  ) async {
    final url = Uri.parse('$baseUrl/guest-companies');
    final token = box.read('token');

    final request = http.MultipartRequest('POST', url);

    // fields
    request.fields['name'] = name;
    request.fields['company_name'] = company;
    request.fields['phone'] = phone;
    request.fields['email'] = email;
    request.fields['purpose'] = purpose;

    if (signature != null) {
      var sigFile = await http.MultipartFile.fromPath(
        'signature_path',
        signature.path,
      );
      request.files.add(sigFile);
    }

    // headers
    request.headers.addAll({
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    });

    try {
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      Map<String, dynamic> result = jsonDecode(responseData.body);

      return {
        'status': response.statusCode == 200 || response.statusCode == 201,
        'message': result['message'] ?? 'Gagal menambahkan kunjungan',
        'data': result['data'] ?? {},
      };
    } catch (e) {
      return {'status': false, 'message': 'Terjadi kesalahan: $e', 'data': {}};
    }
  }
}
