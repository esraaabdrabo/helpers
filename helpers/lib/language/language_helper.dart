import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:helpers/cubits/setting/presentation/controller/cubit.dart';
import 'package:helpers/language/translated.dart';

// Abstract class for language-related helper functions
abstract class LanguageHelper {
  // Function to get the AppLocalizations instance based on the provided context
  static AppLocalizations tr(BuildContext context) =>
      AppLocalizations.of(context)!;

  // Function to check if the current language is Arabic based on the context
  static bool isAr(BuildContext context) =>
      BlocProvider.of<SettingCubit>(context).currentLanguage == 'ar';

  // Function to get the localized name from a BaseTranslatedModel
  // If the current language is Arabic, return the Arabic name; otherwise, return the English name
  static String getLocalize(BaseTranslatedModel model, BuildContext context) =>
      isAr(context) ? model.nameAr : model.nameEn;
}
