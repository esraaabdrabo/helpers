class BaseTranslatedModel {
  late String nameEn, nameAr, id;
  bool? isActive;
  BaseTranslatedModel(
      {required this.id,
      this.isActive,
      required this.nameAr,
      required this.nameEn});
}
