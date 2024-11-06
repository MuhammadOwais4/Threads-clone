

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone/routes/routes_names.dart';
import 'package:threads_clone/services/storage_service.dart';
import 'package:threads_clone/services/supabase_service.dart';
import 'package:threads_clone/utils/helpers.dart';

class AuthController extends GetxController {
  
  var registerLoading =false.obs;
 Future <void> register (String name, String password, String email, )async{ try{
    registerLoading.value = true;
  final AuthResponse response = await SupabaseService.client.auth.signUp(password: password, email: email, data:{
    'name': name,
  });
  if (response.user != null){
    StorageService.Session.write("usersession", response.user!.toJson());
  }
  Get.offAllNamed(RoutesNames.home);
  registerLoading.value = false;
 }on AuthApiException catch(e) {
  registerLoading.value = false;
 showCustomsnackBar("Error", e.message);
  registerLoading.value = false;

 }
 }


  void login() {}
}
