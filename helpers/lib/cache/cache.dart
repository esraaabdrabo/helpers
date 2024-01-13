import 'package:shared_preferences/shared_preferences.dart';

/// A utility class for handling caching operations using Shared Preferences.
abstract class CacheHelper {
  
  /// Initializes and returns an instance of SharedPreferences.
  ///
  /// Returns:
  ///   - `Future<SharedPreferences>`: A future that completes with the initialized SharedPreferences instance.
  ///
  static Future<SharedPreferences> initSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  /// Retrieves data from SharedPreferences using the provided key.
  ///
  /// Parameters:
  ///   - `key` (String): The key to identify the stored data.
  ///
  /// Returns:
  ///   - `Future<dynamic>`: A future that completes with the retrieved data, or null if the key is not found.
  ///
  static Future<dynamic> getData({required String key}) async {
    var sharedPref = await initSharedPref();
    return sharedPref.get(key);
  }

  /// Checks if SharedPreferences contains a value associated with the provided key.
  ///
  /// Parameters:
  ///   - `key` (String): The key to check for existence.
  ///
  /// Returns:
  ///   - `Future<bool>`: A future that completes with a boolean indicating whether the key exists.
  ///
  static Future<bool> isHas(String key) async {
    var sharedPref = await initSharedPref();
    return sharedPref.containsKey(key);
  }

  /// Sets data in SharedPreferences with the provided key and data.
  ///
  /// Parameters:
  ///   - `key` (String): The key to identify the stored data.
  ///   - `data` (dynamic): The data to be stored.
  ///
  /// Returns:
  ///   - `Future<bool>`: A future that completes with a boolean indicating whether the operation was successful.
  ///
  static Future<bool> setData({required String key, required dynamic data}) async {
    var sharedPref = await initSharedPref();
    if (data is String) {
      return await sharedPref.setString(key, data);
    } else {
      return await sharedPref.setBool(key, data);
    }
  }

  /// Removes data from SharedPreferences using the provided key.
  ///
  /// Parameters:
  ///   - `key` (String): The key to identify the data to be removed.
  ///
  /// Returns:
  ///   - `Future<bool>`: A future that completes with a boolean indicating whether the removal was successful.
  ///
  static Future<bool> removeData({required String key}) async {
    var sharedPref = await initSharedPref();
    return await sharedPref.remove(key);
  }
}


