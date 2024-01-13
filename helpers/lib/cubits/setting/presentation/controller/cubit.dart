import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/cache/cache.dart';
import 'package:helpers/cache/keys.dart';
import 'package:helpers/cubits/setting/presentation/controller/states.dart';
///any setting of the application will be here like language
///the application supports english & arabic languages
///the cubit will be parent of the material app to controll on all the app
class SettingCubit extends Cubit<SettingState> {
  ///the default language is english so the super constructor will
  /// take 'SettingENLanguageState' as it's init state
  SettingCubit() : super(SettingInitState()) {
    getCachedLanguage();
  }

  String currentLanguage = 'en';
  void changeLanguage(String newLanguage) {
    if (newLanguage != currentLanguage) {
      currentLanguage = newLanguage;
      if (newLanguage == 'en') {
        emit(SettingENLanguageState());
      } else {
        emit(SettingArLanguageState());
      }
      cacheCurrentLanguage(newLanguage);
    }
  }

// Function to get the cached language and update the currentLanguage accordingly.
  void getCachedLanguage() async {
    var oldLanguage = await CacheHelper.getData(key: CacheHelperKeys.lang);
    if (oldLanguage == null) {
      // If no cached language found, cache the currentLanguage.
      cacheCurrentLanguage(currentLanguage);
    } else {
      // If a cached language is found, update the currentLanguage and notify listeners.
      currentLanguage = oldLanguage;
    }
    emit(SettingCachedLangLoadedState());
  }

  ///with help of 'CacheHelper' class we will cache the language code (en-ar)
  ///to use in checking if the current language is arabic or english
  void cacheCurrentLanguage(String lang) =>
      CacheHelper.setData(key: CacheHelperKeys.lang, data: lang);

  ///in the side menu when the user select neww screen the index will be save here to make the selected primary
  ///color and in any other screen that is using drawer we will be able to navigate to any other screen
  int selectedDrawerScreen = 0;
  void selectNewDrawerScreen(int index) {
    if (index != selectedDrawerScreen) {
      selectedDrawerScreen = index;
      emit(SettingSelectNewScreenState());
    }
  }


}
