import 'package:get/get.dart';
import 'package:threads_clone/View/Auth/login.dart';
import 'package:threads_clone/View/Auth/register.dart';
import 'package:threads_clone/View/Home.dart';
import 'package:threads_clone/routes/routes_names.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RoutesNames.home,
      page: () => const Home(),
    ),
    GetPage(
      name: RoutesNames.login,
      page: () => const Login(),
    ),
    GetPage(
      name: RoutesNames.register,
      page: () => const Register(),
    ),
  ];
}
