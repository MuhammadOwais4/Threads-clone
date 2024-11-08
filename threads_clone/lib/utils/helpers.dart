 import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomsnackBar(String title, String message){
  Get.snackbar(title, message,
  snackPosition: SnackPosition.BOTTOM,
  colorText:Colors.white, 
  backgroundColor: const Color(0xff252526),
  padding:  const EdgeInsets.all(0.0)
  );
 }