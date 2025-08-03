import 'package:get/get.dart';
import 'package:mobile/pages/mainMenuP.dart';
part 'appRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAINMENUP;

  static final routes = [
    GetPage(
      name: _Paths.MAINMENUP,
      page: () => MainMenuP(),
    ),
  ];
}
