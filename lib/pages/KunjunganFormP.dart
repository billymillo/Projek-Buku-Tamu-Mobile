import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/KunjunganController.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class KunjunganFormPage extends StatefulWidget {
  KunjunganFormPage({super.key});

  @override
  State<KunjunganFormPage> createState() => _KunjunganFormPageState();
}

class _KunjunganFormPageState extends State<KunjunganFormPage> {
  final _formKey = GlobalKey<FormState>();

  final KunjunganController kunjunganC = Get.put(KunjunganController());

  final TextEditingController namaController = TextEditingController();
  final TextEditingController instansiController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController kunjunganController = TextEditingController();

  String? selectedPurpose;

  final purposes = ['Bertamu', 'Kunjungan Dinas', 'Lainnya'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 200),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/image/slider5.png',
              width: 300,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 200),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/image/slider6.png',
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '© 2025 PPLG XII - 3 | GEN - 21 All rights reserved.',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 20,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/image/Icon.png',
                        height: 40,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kunjungan',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'roboto',
                        color: PrimaryColor().blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      namaController.clear();
                      instansiController.clear();
                      teleponController.clear();
                      emailController.clear();
                      kunjunganController.clear();
                      selectedPurpose = null;
                      kunjunganC.savedSignatureFile.value = null;
                      await Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              inputField('Nama', " *", namaController),
                              inputField('Instansi', " *", instansiController),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: DropdownButtonFormField<String>(
                                  value: selectedPurpose,
                                  hint: const Text(
                                    'Sebutkan Keperluan Anda',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'roboto',
                                        fontWeight: FontWeight.normal),
                                  ),
                                  items: purposes
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'roboto',
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      selectedPurpose = val;
                                      if (val != "Lainnya") {
                                        kunjunganController.clear();
                                      }
                                    });
                                  },
                                  decoration: inputDecoration(
                                      label: "Keperluan", label2: " *"),
                                ),
                              ),
                              if (selectedPurpose == "Lainnya") ...[
                                inputField('Keperluan Lainnya', " *",
                                    kunjunganController),
                              ],
                              inputField('No. Telp', " *", teleponController,
                                  type: TextInputType.phone),
                              inputField('Email', " ", emailController,
                                  type: TextInputType.emailAddress),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    Container(
                                      height: 350,
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Tanda Tangan",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Roboto",
                                                color: PrimaryColor().blue),
                                          ),
                                          const SizedBox(height: 10),
                                          Expanded(
                                            child: Signature(
                                              controller: kunjunganC
                                                  .signatureController,
                                              backgroundColor:
                                                  Colors.grey[200]!,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton.icon(
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.white)),
                                                onPressed: () {
                                                  kunjunganC.signatureController
                                                      .clear();
                                                },
                                                icon: Icon(
                                                  Icons.clear,
                                                  color: PrimaryColor().red,
                                                ),
                                                label: const Text(
                                                  "Clear",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton.icon(
                                                onPressed: () async {
                                                  final bytes = await kunjunganC
                                                      .signatureController
                                                      .toPngBytes();
                                                  if (bytes != null) {
                                                    final tempDir =
                                                        await getTemporaryDirectory();
                                                    final file = File(
                                                      '${tempDir.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png',
                                                    );
                                                    await file
                                                        .writeAsBytes(bytes);

                                                    kunjunganC
                                                        .savedSignatureFile
                                                        .value = file;

                                                    debugPrint(
                                                        "Signature tersimpan di: ${file.path}");
                                                    Get.back();
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.check,
                                                  color: PrimaryColor().green,
                                                ),
                                                label: const Text(
                                                  "Simpan",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    isScrollControlled: true,
                                  );
                                },
                                child: Obx(() {
                                  return Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child: kunjunganC
                                                  .savedSignatureFile.value !=
                                              null
                                          ? Image.file(
                                              kunjunganC
                                                  .savedSignatureFile.value!,
                                              key: ValueKey(DateTime.now()
                                                  .millisecondsSinceEpoch),
                                              fit: BoxFit.contain,
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: Image.asset(
                                                    'assets/icon/signature.png',
                                                    height: 40,
                                                    width: 40,
                                                    color: PrimaryColor().blue,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                const Text(
                                                  'Tanda Tangan',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Roboto",
                                                      color: Color(0xff27374D)),
                                                )
                                              ],
                                            ),
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  _actionButton('Kembali', Colors.grey[300]!,
                                      Colors.black, () {
                                    Get.back();
                                  }),
                                  const SizedBox(width: 10),
                                  _actionButton(
                                    "Simpan",
                                    const Color(0xFF112D4E),
                                    Colors.white,
                                    () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            child: SingleChildScrollView(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                padding:
                                                    const EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  PrimaryColor()
                                                                      .shadowBlue,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  PrimaryColor()
                                                                      .blue,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 25),
                                                        Text(
                                                          "Simpan Data?",
                                                          style: TextStyle(
                                                            color:
                                                                PrimaryColor()
                                                                    .blue,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        const Text(
                                                          "Apakah data Kunjungan sudah sesuai yang diinginkan?",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    133,
                                                                    14,
                                                                    14,
                                                                    14),
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 15),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            bool success =
                                                                false;
                                                            if (selectedPurpose !=
                                                                "Lainnya") {
                                                              success =
                                                                  await kunjunganC
                                                                      .addKunjungan(
                                                                namaController
                                                                    .text,
                                                                instansiController
                                                                    .text,
                                                                teleponController
                                                                    .text,
                                                                emailController
                                                                    .text,
                                                                selectedPurpose
                                                                    .toString(),
                                                              );
                                                            }
                                                            if (selectedPurpose ==
                                                                "Lainnya") {
                                                              success =
                                                                  await kunjunganC
                                                                      .addKunjungan(
                                                                namaController
                                                                    .text,
                                                                instansiController
                                                                    .text,
                                                                teleponController
                                                                    .text,
                                                                emailController
                                                                    .text,
                                                                kunjunganController
                                                                    .text,
                                                              );
                                                            }
                                                            if (success) {
                                                              namaController
                                                                  .clear();
                                                              instansiController
                                                                  .clear();
                                                              teleponController
                                                                  .clear();
                                                              emailController
                                                                  .clear();
                                                              kunjunganController
                                                                  .clear();
                                                              selectedPurpose =
                                                                  null;
                                                              kunjunganC
                                                                  .savedSignatureFile
                                                                  .value = null;
                                                              Navigator.pop(
                                                                  context);
                                                              Get.toNamed(Routes
                                                                  .MAINMENUP);
                                                            }
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                PrimaryColor()
                                                                    .blue,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const SizedBox(
                                                                  width: 8),
                                                              Obx(
                                                                () => kunjunganC
                                                                        .isLoading
                                                                        .value
                                                                    ? const SizedBox(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          strokeWidth:
                                                                              4,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      )
                                                                    : const Text(
                                                                        "Simpan",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              "Roboto",
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .shade200,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                          child: const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                'Cancel',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration inputDecoration({String? label, label2}) => InputDecoration(
        label: label != null
            ? RichText(
                text: TextSpan(
                  text: label,
                  style: TextStyle(
                    color: PrimaryColor().blue, // warna label
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: label2,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            : null,
        hintText: label != null ? 'Masukkan $label' : null,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        floatingLabelBehavior:
            FloatingLabelBehavior.always, // <-- label selalu di atas
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        fillColor: Colors.white,
      );

  Widget inputField(
          String label, String label2, TextEditingController controller,
          {TextInputType? type}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: TextFormField(
          style: const TextStyle(fontSize: 13),
          controller: controller,
          keyboardType: type,
          decoration: inputDecoration(label: label, label2: label2),
        ),
      );

  Widget _actionButton(String text, Color bg, Color fg, VoidCallback onTap) =>
      Expanded(
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: bg,
              foregroundColor: fg,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'roboto',
              ),
            )),
      );
}
