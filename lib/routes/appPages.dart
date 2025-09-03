import 'package:get/get.dart';
import 'package:mobile/pages/AlumniFormPage.dart';
import 'package:mobile/pages/HistoryPage.dart';
import 'package:mobile/pages/KunjunganFormP.dart';
import 'package:mobile/pages/LockPinPage.dart';
import 'package:mobile/pages/ParentFormPage.dart';
import 'package:mobile/pages/PerusahaanFormP.dart';
import 'package:mobile/pages/login_page.dart';
import 'package:mobile/pages/mainMenuP.dart';
import 'package:mobile/pages/validationP.dart';
part 'appRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.VALIDATIONP;

  static final routes = [
    GetPage(
      name: _Paths.VALIDATIONP,
      page: () => ValidationP(),
    ),
    GetPage(
      name: _Paths.MAINMENUP,
      page: () => MainMenuP(),
    ),
    GetPage(
      name: _Paths.PARENTFORMPAGE,
      page: () => ParentFormPage(),
    ),
    GetPage(
      name: _Paths.ALUMNIFORMPAGE,
      page: () => AlumniFormPage(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.HISTORYPAGE,
      page: () => Historypage(),
    ),
    GetPage(
      name: _Paths.KUNJUNGANFORMP,
      page: () => KunjunganFormPage(),
    ),
    GetPage(
      name: _Paths.PERUSAHAANFORMP,
      page: () => PerusahaanFormPage(),
    ),
    GetPage(
      name: _Paths.LOCKPINP,
      page: () => LockPinPage(),
    ),
  ];
}
