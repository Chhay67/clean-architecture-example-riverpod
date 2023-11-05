import 'package:get_storage/get_storage.dart';
import '../core.dart';

class LocalStorage{
  static final _getStorage = GetStorage();

   static Future<void> delete({required String key}) async {
    printMe("Deleted key: $key");
    return await _getStorage.remove(key);
  }

  static Future<String?> read({required String key}) async {
    return _getStorage.read(key);
  }

  static Future<void> save({required String key, String? value}) async {
    await _getStorage.write(key, value);
  }

  Future<void> deleteAllData() async{
    printMe('Clear all data');
    await _getStorage.erase();
  }
}