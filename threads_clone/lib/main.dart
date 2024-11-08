import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:threads_clone/Theme/theme.dart';
import 'package:threads_clone/routes/routes.dart';
import 'package:threads_clone/routes/routes_names.dart';
import 'package:threads_clone/services/storage_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: "../env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Threads",
      theme: theme,
      getPages: Routes.pages,
      initialRoute:StorageService.usersession != null   ?RoutesNames.home  :RoutesNames.login,
    );
  }
}
