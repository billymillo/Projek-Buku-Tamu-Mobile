import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/MenuController.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';

class MainMenuP extends StatelessWidget {
  MainMenuP({super.key});
  final controller = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon/bukuTamu.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "BukuTamu",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: PrimaryColor().blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        AboutUsDialog.show(context);
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: PrimaryColor().shadowGrey,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            Icons.info_outline,
                            color: PrimaryColor().blue,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGINPAGE);
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: PrimaryColor().shadowGrey,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            Icons.logout,
                            color: PrimaryColor().blue,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/clippath1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView.builder(
                          controller: controller.pageController,
                          itemCount: controller.sliderImages.length,
                          onPageChanged: (index) =>
                              controller.currentPage.value = index,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                      controller.sliderImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          child: Obx(() {
                            return Row(
                              children: List.generate(
                                controller.sliderImages.length,
                                (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  width: controller.currentPage.value == index
                                      ? 12
                                      : 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: controller.currentPage.value == index
                                        ? PrimaryColor().blue
                                        : PrimaryColor().blue.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.PARENTFORMPAGE),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.23,
                            decoration: BoxDecoration(
                                color: PrimaryColor().shadowGrey,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icon/orangtua.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Orang Tua",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: PrimaryColor().blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.KUNJUNGANFORMP),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.23,
                            decoration: BoxDecoration(
                                color: PrimaryColor().shadowGrey,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icon/kunjungan.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Kunjungan",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: PrimaryColor().blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.ALUMNIFORMPAGE),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.23,
                            decoration: BoxDecoration(
                                color: PrimaryColor().shadowGrey,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/icon/alumni.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Alumni",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: PrimaryColor().blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.PERUSAHAANFORMP),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.23,
                            decoration: BoxDecoration(
                                color: PrimaryColor().shadowGrey,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icon/perusahaan.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Perusahaan",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: PrimaryColor().blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LOCKPINP);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: PrimaryColor().shadowGrey,
                          borderRadius: BorderRadius.circular(32)),
                      child: Align(
                        child: Text(
                          'Data Kunjungan',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: PrimaryColor().blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class TeamMember {
  final String name;
  final String role;
  final String image;
  final String classInfo;

  TeamMember({
    required this.name,
    required this.role,
    required this.image,
    required this.classInfo,
  });
}

final List<TeamMember> teamMembers = [
  TeamMember(
    name: 'Ibrahim Satria Harimurti',
    role: 'Login Page',
    image: 'assets/dev/acep.jpg',
    classInfo: 'PPLG XII-3 | Tajur 5 | 12309677',
  ),
  TeamMember(
    name: 'Muhammad Rizal Mutakin',
    role: 'Dashboard & History Page',
    image: 'assets/dev/jarkasih.jpg',
    classInfo: 'PPLG XII-3 | Cicurug 8 | 12309805 ',
  ),
  TeamMember(
    name: 'M. Brilliant Hijriadhily Adl',
    role: 'Animation & Main Menu Page',
    image: 'assets/dev/uben.jpg',
    classInfo: 'PPLG XII-3 | Cisarua 7 | 12309841',
  ),
  TeamMember(
    name: 'Irghi Maulaya Kurniawan',
    role: 'Orang Tua Page & Alumni Page',
    image: 'assets/dev/wawan.jpg',
    classInfo: 'PPLG XII-3 | Cibedug 3 | 12309685',
  ),
  TeamMember(
    name: 'Muhammad Zidan',
    role: 'Kunjungan Page & Perusahaan Page',
    image: 'assets/dev/suparman.jpg',
    classInfo: 'PPLG XII-3 | Wikrama 2 | 12309816',
  ),
];

class AboutUsDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: _buildProfileCards(context),
        );
      },
    );
  }

  static Widget _buildProfileCards(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.95;
    final height = MediaQuery.of(context).size.height * 0.8;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1B1B2F),
            Color(0xFF162447),
            Color(0xFF1F4068),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ───── TITLE ─────
            const Text(
              'Mobile Team Members',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              'This BukuTamu app is designed with ❤️ and passion by our amazing mobile team.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),

            // ───── GRID ─────
            Expanded(
              child: GridView.builder(
                itemCount: teamMembers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  final member = teamMembers[index];
                  return _buildProfileCard(member);
                },
              ),
            ),

            // ───── FOOTER CREDIT ─────
            const SizedBox(height: 16),
            const Text(
              'Version 1.0.0 © 2025',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'GEN - 21 PPLG',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'SMKS WIKRAMA BOGOR',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildProfileCard(TeamMember member) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // FOTO
            Image.asset(
              member.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),

            // GRADIENT OVERLAY
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          member.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.verified, color: Colors.blue, size: 14),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    member.role,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bookAtlas,
                        color: Colors.white70,
                        size: 12,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          member.classInfo,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Extra text
                  Text(
                    'Special Project for Wikrama Bogor ✨',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
