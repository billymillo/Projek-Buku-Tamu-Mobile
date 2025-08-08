import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';

class MainMenuP extends StatelessWidget {
  const MainMenuP({super.key});

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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: PrimaryColor().shadowGrey,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          3), // sesuaikan agar image lebih kecil
                      child: Icon(
                        Icons.logout,
                        color: PrimaryColor().blue,
                        size: 20,
                      ),
                    ),
                  ),
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
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage('assets/image/slider1.jpg'),
                          fit: BoxFit.cover),
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.23,
                          decoration: BoxDecoration(
                              color: PrimaryColor().shadowGrey,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/icon/kunjungan.png'),
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.23,
                          decoration: BoxDecoration(
                              color: PrimaryColor().shadowGrey,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: PrimaryColor().shadowGrey,
                        borderRadius: BorderRadius.circular(32)),
                    child: Align(
                      child: GestureDetector(
                          child: Text(
                        'Kunjungan Sebelumnya',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: PrimaryColor().blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
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
