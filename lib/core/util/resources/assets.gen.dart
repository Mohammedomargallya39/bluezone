/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:bluezone/core/util/resources/translation_manager.dart';
import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/antonio-Regular.ttf
  String get antonioRegular => 'assets/fonts/antonio-Regular.ttf';

  /// File path: assets/fonts/nunito-Medium.ttf
  String get nunitoMedium => 'assets/fonts/nunito-Medium.ttf';

  /// File path: assets/fonts/poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/poppins-Light.ttf';

  /// File path: assets/fonts/tajawal-Regular.ttf
  String get tajawalRegular => 'assets/fonts/tajawal-Regular.ttf';

  /// List of all assets
  List<String> get values =>
      [antonioRegular, nunitoMedium, poppinsLight, tajawalRegular];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesFatGen get fat => const $AssetsImagesFatGen();
  $AssetsImagesLottiGen get lotti => const $AssetsImagesLottiGen();
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// List of all assets
  List<String> get values => [];
}

class $AssetsImagesFatGen {
  const $AssetsImagesFatGen();

  /// List of all assets
  List<String> get values => [];
}

class $AssetsImagesLottiGen {
  const $AssetsImagesLottiGen();


  /// List of all assets
  List<String> get values => [];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();


  /// File path: assets/images/png/cover.png
  String get stepCover => 'assets/images/png/step_cover.png';

  /// File path: assets/images/png/logo.png
  String get logo => 'assets/images/png/logo.png';

  /// File path: assets/images/png/camera.png
  String get camera => 'assets/images/png/camera.png';

  /// List of all assets
  List<AssetGenImage> get values => [];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();




  /// File path: assets/images/svg/logo.svg
  String get logo => 'assets/images/svg/logo.svg';

  /// File path: assets/images/svg/arrowBack.svg
  String get arrowBack => 'assets/images/svg/arrow_back.svg';

  /// File path: assets/images/svg/camera.svg
  String get camera => 'assets/images/svg/camera.svg';

  /// File path: assets/images/svg/facebook.svg
  String get facebook => 'assets/images/svg/facebook.svg';

  /// File path: assets/images/svg/google.svg
  String get google => 'assets/images/svg/google.svg';

  /// List of all assets
  List<String> get values => [
    logo,
    arrowBack,
    camera
  ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}


class LanguageManager{
  static  String lang = 'ar';
  static late TranslationModel translationModel;
}