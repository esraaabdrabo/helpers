abstract class RegExperissions {
  static final RegExp url = RegExp(r'^(http:\/\/|https:\/\/)');
  static final email = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static final captialCharacter = RegExp(r'[A-Z]');
  static final lowwerCharacter = RegExp(r'[a-z]');
  static final number = RegExp(r'[0-9]');
  static final specialCharacter = RegExp(r'[!@#$%^&*]');
  static final englishCharacters = RegExp(r'^[a-zA-Z ]+$');
  static final arabicCharatcters = RegExp(r'^[؀-ۿ ]+$');
}
