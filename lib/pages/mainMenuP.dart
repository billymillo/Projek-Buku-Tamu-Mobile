import 'package:flutter/material.dart';
import 'package:mobile/models/colorpalette.dart';

class MainMenuP extends StatelessWidget {
  const MainMenuP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
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
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon/orangtua.png'),
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
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon/kunjungan.png'),
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
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon/alumni.png'),
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
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon/perusahaan.png'),
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
      ),
    );
  }
}
