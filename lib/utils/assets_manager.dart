class CustomAssetsManager {
  static CustomAssetsManager? _instance;
  CustomAssetsManager._();
  factory CustomAssetsManager() => _instance ??= CustomAssetsManager._();

  String get cartEmptyIcon => "assets/icons/cart_empty.svg";
  String get cartFilledIcon => "assets/icons/cart_filled.svg";
  String get nikeLogo => "assets/icons/nike_logo.svg";
  String get shoeLogo => "assets/image/1.png";
  String get filterIcon => "assets/icons/filter_icon.svg";
}
