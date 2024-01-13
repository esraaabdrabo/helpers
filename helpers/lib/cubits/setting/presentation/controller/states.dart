abstract class SettingState {}

class SettingInitState extends SettingState {}

class SettingCachedLangLoadedState extends SettingState {}

class SettingArLanguageState extends SettingState {
  final String currentLanguage = 'ar';
}

class SettingENLanguageState extends SettingState {
  final String currentLanguage = 'en';
}

class SettingSelectNewScreenState extends SettingState {}
