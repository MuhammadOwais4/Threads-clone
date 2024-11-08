

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone/routes/routes_names.dart';
import 'package:threads_clone/services/storage_service.dart';
import 'package:threads_clone/services/supabase_service.dart';
import 'package:threads_clone/utils/helpers.dart';
import 'package:threads_clone/utils/storage_key.dart';

class AuthController extends GetxController {
  
  var registerLoading =false.obs;
  var loginLoading = false.obs;
 Future <void> register (String name, String password, String email, )async{ try{
    registerLoading.value = true;
  final AuthResponse response = await SupabaseService.client.auth.signUp(password: password, email: email, data:{
    'name': name,
  });
  if (response.user != null){
    StorageService.Session.write(StorageKey.usersession, response.user!.toJson());
  }
  Get.offAllNamed(RoutesNames.home);
 }on AuthApiException catch(e) {
 showCustomsnackBar("Error", e.message);
 }finally{
  registerLoading.value = false;

 }
 }


Future <void> login( String email , String password)  async{
  try{
    final AuthResponse response = await SupabaseService.client.auth.signInWithPassword(email: email, password: password);
    if (response.user != null){
      StorageService.Session.write(StorageKey.usersession, response.user!.toJson());
    }
    Get.offAllNamed(RoutesNames.home);
 }on AuthApiException catch(e) {
  showCustomsnackBar("Error", e.message);
} finally{
  loginLoading.value = false;
}
}
}