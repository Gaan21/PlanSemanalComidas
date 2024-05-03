import 'package:app_comidas_semanales/helpers/helpers.dart';
import 'package:hive/hive.dart';

class HiveService {
  Future<T?> read<T>(String boxKey, String key) async {
    T? value;
    try {
      Box<T> box = await Hive.openBox<T>(boxKey);
      if (box.containsKey(key)) {
        value = box.get(key);
      }
      await box.close();
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
    }
    return value;
  }

  Future write<T>(String boxKey, String key, T value) async {
    try {
      Box<T> box = await Hive.openBox<T>(boxKey);
      await box.put(key, value);
      await box.close();
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
    }
  }

  Future delete(String boxKey, String key) async {
    try {
      Box<dynamic> box = await Hive.openBox(boxKey);
      if (box.containsKey(key)) {
        await box.delete(key);
      }
      await box.close();
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
    }
  }

  Future<Map<String, T>> readAll<T>(String boxKey) async {
    Map<String, T> data = {};
    try {
      Box<T> box = await Hive.openBox<T>(boxKey);
      data = box.toMap().cast<String, T>();
      await box.close();
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
    }
    return data;
  }
}
