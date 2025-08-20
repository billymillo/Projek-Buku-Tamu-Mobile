// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mobile/controller/HistoryController.dart';
// import 'package:mobile/models/colorpalette.dart';
// import 'package:mobile/routes/appPages.dart';

// class Historypage extends StatelessWidget {
//   const Historypage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HistoryController());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: RefreshIndicator(
//         onRefresh: () async {
//           await controller.fetchCompany();
//           await controller.fetchAlumni();
//           await controller.fetchParent();
//           await controller.fetchKunjungan();
//         },
//         child: ListView(
//           physics: const AlwaysScrollableScrollPhysics(),
//           children: [
//             Stack(
//               children: [
//                 // Background atas
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   right: 0,
//                   child: CustomPaint(
//                     size: Size(MediaQuery.of(context).size.width, 200),
//                   ),
//                 ),

//                 // Background bawah
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Image.asset(
//                     'assets/image/bottom.png',
//                     width: MediaQuery.of(context).size.width,
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),

//                 // Konten utama
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Column(
//                     children: [
//                       // Logo + title
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Image.asset('assets/image/Logo.png', height: 40),
//                             const SizedBox(width: 10),
//                             const Text(
//                               'BukuTamu',
//                               style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'roboto',
//                                 color: Color(0xFF001E42),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       const Text(
//                         'Data Kunjungan',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'roboto',
//                           color: Color(0xFF001E42),
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Tab
//                       Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 20),
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: PrimaryColor().shadowGrey,
//                           borderRadius: BorderRadius.circular(25),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 6,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                                 child: _buildTabBtn(
//                                     "Alumni", "alumni", controller)),
//                             const SizedBox(width: 10),
//                             Expanded(
//                                 child: _buildTabBtn(
//                                     "Perusahaan", "company", controller)),
//                             const SizedBox(width: 10),
//                             Expanded(
//                                 child: _buildTabBtn(
//                                     "Kunjungan", "kunjungan", controller)),
//                             const SizedBox(width: 10),
//                             Expanded(
//                                 child: _buildTabBtn(
//                                     "Orang Tua", "parent", controller)),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 20),

//                       // Data List
//                       Obx(() {
//                         List<Map<String, dynamic>> data = [];
//                         switch (controller.selectedTab.value) {
//                           case "alumni":
//                             data = controller.alumni.reversed.toList();
//                             break;
//                           case "company":
//                             data = controller.company.reversed.toList();
//                             break;
//                           case "kunjungan":
//                             data = controller.kunjungan.reversed.toList();
//                             break;
//                           case "parent":
//                             data = controller.parent.reversed.toList();
//                             break;
//                         }

//                         if (data.isEmpty) {
//                           return Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 20),
//                             padding: const EdgeInsets.all(20),
//                             width: MediaQuery.of(context).size.width * 1,
//                             height: MediaQuery.of(context).size.height * 0.5,
//                             decoration: BoxDecoration(
//                               color: PrimaryColor().shadowGrey,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Center(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.bar_chart,
//                                       size: 64, color: PrimaryColor().blue),
//                                   const SizedBox(height: 10),
//                                   const Text(
//                                     "Tidak ada data kunjungan.",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   const Text(
//                                     "Silakan mencoba refresh halaman atau Login kembali.",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }

//                         return Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 20),
//                           padding: const EdgeInsets.all(20),
//                           width: MediaQuery.of(context).size.width * 1,
//                           decoration: BoxDecoration(
//                             color: PrimaryColor().shadowGrey,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               TextField(
//                                 onChanged: (value) =>
//                                     controller.searchQuery.value = value,
//                                 decoration: InputDecoration(
//                                   hintText:
//                                       "Cari berdasarkan nama atau telepon...",
//                                   prefixIcon: const Icon(
//                                     Icons.search,
//                                     color: Color(0xFF001E42),
//                                   ),
//                                   suffixIcon: Obx(() =>
//                                       controller.searchQuery.value.isNotEmpty
//                                           ? IconButton(
//                                               icon: const Icon(Icons.clear),
//                                               onPressed: () {
//                                                 controller.searchQuery.value =
//                                                     "";
//                                               },
//                                             )
//                                           : const SizedBox.shrink()),
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 0, horizontal: 16),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 20),

//                               // ambil hanya sesuai limit + filter
//                               Obx(() {
//                                 var filteredData = data.where((item) {
//                                   final query = controller.searchQuery.value
//                                       .toLowerCase();
//                                   final name = (item['name'] ?? "")
//                                       .toString()
//                                       .toLowerCase();
//                                   final phone = (item['phone'] ?? "")
//                                       .toString()
//                                       .toLowerCase();
//                                   return query.isEmpty ||
//                                       name.contains(query) ||
//                                       phone.contains(query);
//                                 }).toList();

//                                 if (filteredData.isEmpty) {
//                                   return const Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.all(20),
//                                       child: Text(
//                                         "Data tidak ditemukan.",
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   );
//                                 }

//                                 return Column(
//                                   children: [
//                                     ...filteredData
//                                         .take(controller.visibleItemCount.value)
//                                         .map((item) {
//                                       return Container(
//                                         margin:
//                                             const EdgeInsets.only(bottom: 15),
//                                         padding: const EdgeInsets.all(16),
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 1,
//                                         decoration: BoxDecoration(
//                                           color: PrimaryColor().white,
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Colors.black
//                                                   .withOpacity(0.05),
//                                               blurRadius: 4,
//                                               offset: const Offset(0, 2),
//                                             ),
//                                           ],
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             _buildInfoRow(
//                                                 "Tanggal",
//                                                 formatDateHour(
//                                                     item['created_at'])),
//                                             _buildInfoRow("Nama", item['name']),
//                                             _buildInfoRow(
//                                                 "Telepon", item['phone']),
//                                             if (controller.selectedTab.value ==
//                                                 "alumni") ...[
//                                               _buildInfoRow(
//                                                   "Jurusan", item['major']),
//                                               _buildInfoRow("Tahun Lulus",
//                                                   item['graduation_year']),
//                                             ],
//                                             if (controller.selectedTab.value ==
//                                                 "company") ...[
//                                               _buildInfoRow("Perusahaan",
//                                                   item['company_name']),
//                                             ],
//                                             if (controller.selectedTab.value ==
//                                                 "kunjungan") ...[
//                                               _buildInfoRow("Institusi",
//                                                   item['institution']),
//                                             ],
//                                             if (controller.selectedTab.value ==
//                                                 "parent") ...[
//                                               _buildInfoRow("Nama Siswa",
//                                                   item['student_name']),
//                                             ],
//                                             _buildInfoRow("Kunjungan",
//                                                 item['purposes']?['purpose']),
//                                           ],
//                                         ),
//                                       );
//                                     }),

//                                     // Tombol load more jika masih ada data
//                                     if (filteredData.length >
//                                         controller.visibleItemCount.value)
//                                       Center(
//                                         child: TextButton(
//                                           onPressed: () {
//                                             controller.visibleItemCount.value +=
//                                                 5; // tambah 5 data
//                                           },
//                                           child: const Text(
//                                             "Munculkan Data Lain",
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'roboto',
//                                               color: Color(0xFF001E42),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                   ],
//                                 );
//                               }),
//                             ],
//                           ),
//                         );
//                       }),

//                       const SizedBox(height: 40),

//                       // Tombol Next
//                       Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 15),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Get.toNamed(Routes.MAINMENUP);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFE2E8F0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             minimumSize: const Size(double.infinity, 50),
//                           ),
//                           child: const Text(
//                             'Kembali',
//                             style: TextStyle(
//                               color: Color(0xFF001E42),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 80),
//                     ],
//                   ),
//                 ),

//                 // Copyright
//                 Positioned(
//                   bottom: 30,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: Text(
//                       '© 2025 PPLG XII - 3 | GEN - 21 All rights reserved.',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white.withOpacity(0.7),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, dynamic value) {
//     if (value == null || value.toString().isEmpty) {
//       return const SizedBox.shrink();
//     }
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 5),
//       child: Text("$label: $value"),
//     );
//   }

//   Widget _buildTabBtn(String label, String key, HistoryController controller) {
//     return Obx(() {
//       bool isActive = controller.selectedTab.value == key;
//       return GestureDetector(
//         onTap: () => controller.selectedTab.value = key,
//         child: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           decoration: BoxDecoration(
//             color: isActive ? PrimaryColor().blue : PrimaryColor().grey,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: isActive
//                 ? [
//                     BoxShadow(
//                       color: PrimaryColor().shadowBlue.withOpacity(0.5),
//                       blurRadius: 6,
//                       offset: const Offset(0, 3),
//                     ),
//                   ]
//                 : [],
//           ),
//           child: FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: isActive ? Colors.white : Colors.black87,
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   String formatDateHour(String dateString) {
//     final date = DateTime.parse(dateString);
//     final formatter = DateFormat('dd MMMM yyyy HH:mm', 'id_ID');
//     return formatter.format(date);
//   }
// }
