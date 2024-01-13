import 'package:helpers/cache/cache.dart';
import 'package:helpers/cache/keys.dart';

abstract class DioHeaders {
  static Map<String, dynamic> authorizationHeader(String token) =>
      {"Authorization": "Bearer $token"};
  static Future<Map<String, dynamic>> languageHeader() async =>
      {"Accept-Language": await CacheHelper.getData(key: CacheHelperKeys.lang)};
}
