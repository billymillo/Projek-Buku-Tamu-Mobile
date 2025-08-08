import 'package:get/get.dart';
import 'package:mobile/pages/mainMenuP.dart';
import 'package:mobile/screens/login_page.dart';
part 'appRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAINMENUP;

  static final routes = [
    GetPage(
      name: _Paths.MAINMENUP,
      page: () => MainMenuP(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => LoginPage(),
    ),
  ];
}
