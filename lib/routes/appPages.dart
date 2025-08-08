import 'package:get/get.dart';
import 'package:mobile/pages/AlumniFormPage.dart';
import 'package:mobile/pages/ParentFormPage.dart';
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
  ];
}
