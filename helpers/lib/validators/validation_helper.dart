import 'package:flutter/material.dart';
import 'package:helpers/language/language_helper.dart';
import 'package:helpers/validators/reg_exp.dart';

/// A utility class for performing various validation tasks.
abstract class ValidationHelper {
  /// Validates a link based on specific criteria.
  ///
  /// Checks if the link is empty or doesn't start with 'http://' or 'https://://'.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? validateLink(BuildContext context, String value) {
    if (value.isEmpty) {
      return LanguageHelper.tr(context).this_field_required;
    } else {
      if (!RegExperissions.url.hasMatch(value)) {
        return LanguageHelper.tr(context).invalid_link;
      }
    }
    return null; // Return null if the link is valid
  }

  /// Validates an email address based on a regular expression.
  ///
  /// Checks if the email is empty or has an invalid format.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? validateEmail(String? value, BuildContext context) {
    var tr = LanguageHelper.tr(context);
    if (value == null || value.isEmpty) {
      return tr.email_is_required;
    } else if (!RegExperissions.email.hasMatch(value)) {
      return tr.invalid_email_format;
    }
    return null;
  }

  /// Validates a username.
  ///
  /// Checks if the username is empty or contains spaces.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? validateUsername(String? value, BuildContext context) {
    var tr = LanguageHelper.tr(context);
    if (value == null || value.isEmpty) {
      return tr.username_required;
    } else if (value.contains(' ')) {
      return tr.username_not_contain_space;
    }
    return null;
  }

  /// Validates a password based on specific criteria.
  ///
  /// Checks if the password is empty, less than 8 characters,
  /// lacks a capital letter, lowercase letter, number, or special character.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? validatePassword(String? value, BuildContext context) {
    var tr = LanguageHelper.tr(context);
    if (value == null || value.isEmpty) {
      return tr.password_required;
    } else if (value.length < 8) {
      return tr.password_mustbe_8;
    } else if (!RegExperissions.captialCharacter.hasMatch(value)) {
      return tr.password_mustbe_capital;
    } else if (!RegExperissions.lowwerCharacter.hasMatch(value)) {
      return tr.password_mustbe_lower;
    } else if (!RegExperissions.number.hasMatch(value)) {
      return tr.password_mustbe_number;
    } else if (!RegExperissions.specialCharacter.hasMatch(value)) {
      return tr.password_mustbe_special_char;
    }
    return null;
  }

  /// Validates a phone number based on specific criteria.
  ///
  /// Checks if the phone number contains invalid characters or exceeds the maximum length.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? validatePhoneNumber(String phoneNumber, BuildContext context) {
    if (!RegExperissions.number.hasMatch(phoneNumber)) {
      return LanguageHelper.tr(context).invalid_phone;
    } else if (phoneNumber.length > 16) {
      return LanguageHelper.tr(context).phone_max_16;
    }
    return null;
  }

  /// Validates a string for containing only English characters.
  ///
  /// Checks if the string contains characters other than English alphabets and spaces.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? validateEnglish(String name, BuildContext context) {
    if (RegExperissions.englishCharacters.hasMatch(name)) {
      return null;
    } else {
      return LanguageHelper.tr(context).invalid_english_char;
    }
  }

  /// Validates a string for containing only Arabic characters.
  ///
  /// Checks if the string contains characters other than Arabic alphabets and spaces.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? validateArabic(String name, BuildContext context) {
    if (RegExperissions.arabicCharatcters.hasMatch(name)) {
      return null;
    } else {
      return LanguageHelper.tr(context).invalid_arabic_char;
    }
  }

  /// Validates if a value is not empty or contains only whitespaces.
  ///
  /// Checks if the value is not null and not an empty or whitespace-only string.
  /// Returns an error message if validation fails; otherwise, returns null.
  static String? hasValue(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return LanguageHelper.tr(context).this_field_required;
    }
    return null;
  }
}
