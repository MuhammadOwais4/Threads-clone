import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:threads_clone/utils/storage_key.dart';

class StorageService extends GetxService {
 static final Session = GetStorage();



 static dynamic usersession=Session.read(StorageKey.usersession);
}