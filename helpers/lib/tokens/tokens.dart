import 'dart:convert';
import 'package:helpers/cache/cache.dart';
import 'package:helpers/cache/keys.dart';
import 'package:helpers/tokens/model.dart';

abstract class TokensHelper {
  static String key = CacheHelperKeys.cachedTokensKey;
  static Future<bool> hasTokens() async {
    return await CacheHelper.isHas(key);
  }

  static Future<AuthTokensModel> get() async =>
      AuthTokensModel.fromJson(jsonDecode(await CacheHelper.getData(key: key)));
}
