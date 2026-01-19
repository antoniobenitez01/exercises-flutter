import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff67558e),
      surfaceTint: Color(0xff67558e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffeaddff),
      onPrimaryContainer: Color(0xff4e3d75),
      secondary: Color(0xff864b70),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffd8ec),
      onSecondaryContainer: Color(0xff6a3457),
      tertiary: Color(0xff31628d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcfe5ff),
      onTertiaryContainer: Color(0xff124a73),
      error: Color(0xff7e570f),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffddb0),
      onErrorContainer: Color(0xff614000),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1b20),
      onSurfaceVariant: Color(0xff49454e),
      outline: Color(0xff7a757f),
      outlineVariant: Color(0xffcbc4cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd1bcfd),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff220f46),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff4e3d75),
      secondaryFixed: Color(0xffffd8ec),
      onSecondaryFixed: Color(0xff37072a),
      secondaryFixedDim: Color(0xfff9b1db),
      onSecondaryFixedVariant: Color(0xff6a3457),
      tertiaryFixed: Color(0xffcfe5ff),
      onTertiaryFixed: Color(0xff001d34),
      tertiaryFixedDim: Color(0xff9dcbfb),
      onTertiaryFixedVariant: Color(0xff124a73),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xfff2ecf4),
      surfaceContainerHigh: Color(0xffece6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3d2c63),
      surfaceTint: Color(0xff67558e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff76639e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff572346),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff965a7f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00395e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff41719c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4b3100),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8f651e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff121016),
      onSurfaceVariant: Color(0xff38353d),
      outline: Color(0xff55515a),
      outlineVariant: Color(0xff706b75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd1bcfd),
      primaryFixed: Color(0xff76639e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5d4b84),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff965a7f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7b4266),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff41719c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff265882),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcac5cc),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xffece6ee),
      surfaceContainerHigh: Color(0xffe1dbe3),
      surfaceContainerHighest: Color(0xffd5d0d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff332258),
      surfaceTint: Color(0xff67558e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff513f77),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4b193b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6d365a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002e4e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff164c76),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff3e2800),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff644200),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2e2b33),
      outlineVariant: Color(0xff4b4851),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd1bcfd),
      primaryFixed: Color(0xff513f77),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3a285f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6d365a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff532042),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff164c76),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003558),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbcb7bf),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5eff7),
      surfaceContainer: Color(0xffe7e0e8),
      surfaceContainerHigh: Color(0xffd8d2da),
      surfaceContainerHighest: Color(0xffcac5cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd1bcfd),
      surfaceTint: Color(0xffd1bcfd),
      onPrimary: Color(0xff37265c),
      primaryContainer: Color(0xff4e3d75),
      onPrimaryContainer: Color(0xffeaddff),
      secondary: Color(0xfff9b1db),
      onSecondary: Color(0xff501e40),
      secondaryContainer: Color(0xff6a3457),
      onSecondaryContainer: Color(0xffffd8ec),
      tertiary: Color(0xff9dcbfb),
      onTertiary: Color(0xff003355),
      tertiaryContainer: Color(0xff124a73),
      onTertiaryContainer: Color(0xffcfe5ff),
      error: Color(0xfff2be6e),
      onError: Color(0xff442c00),
      errorContainer: Color(0xff614000),
      onErrorContainer: Color(0xffffddb0),
      surface: Color(0xff141218),
      onSurface: Color(0xffe7e0e8),
      onSurfaceVariant: Color(0xffcbc4cf),
      outline: Color(0xff948f99),
      outlineVariant: Color(0xff49454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff67558e),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff220f46),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff4e3d75),
      secondaryFixed: Color(0xffffd8ec),
      onSecondaryFixed: Color(0xff37072a),
      secondaryFixedDim: Color(0xfff9b1db),
      onSecondaryFixedVariant: Color(0xff6a3457),
      tertiaryFixed: Color(0xffcfe5ff),
      onTertiaryFixed: Color(0xff001d34),
      tertiaryFixedDim: Color(0xff9dcbfb),
      onTertiaryFixedVariant: Color(0xff124a73),
      surfaceDim: Color(0xff141218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d13),
      surfaceContainerLow: Color(0xff1d1b20),
      surfaceContainer: Color(0xff211f24),
      surfaceContainerHigh: Color(0xff2b292f),
      surfaceContainerHighest: Color(0xff36343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe4d6ff),
      surfaceTint: Color(0xffd1bcfd),
      onPrimary: Color(0xff2c1b51),
      primaryContainer: Color(0xff9a87c4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffcfe8),
      onSecondary: Color(0xff431234),
      secondaryContainer: Color(0xffbe7ca4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc4dfff),
      onTertiary: Color(0xff002844),
      tertiaryContainer: Color(0xff6795c2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd69c),
      onError: Color(0xff362200),
      errorContainer: Color(0xffb7883e),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141218),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe1dae5),
      outline: Color(0xffb6b0ba),
      outlineVariant: Color(0xff948e99),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff503e76),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff17033c),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff3d2c63),
      secondaryFixed: Color(0xffffd8ec),
      onSecondaryFixed: Color(0xff29001e),
      secondaryFixedDim: Color(0xfff9b1db),
      onSecondaryFixedVariant: Color(0xff572346),
      tertiaryFixed: Color(0xffcfe5ff),
      onTertiaryFixed: Color(0xff001223),
      tertiaryFixedDim: Color(0xff9dcbfb),
      onTertiaryFixedVariant: Color(0xff00395e),
      surfaceDim: Color(0xff141218),
      surfaceBright: Color(0xff46434a),
      surfaceContainerLowest: Color(0xff08070b),
      surfaceContainerLow: Color(0xff1f1d22),
      surfaceContainer: Color(0xff29272d),
      surfaceContainerHigh: Color(0xff343138),
      surfaceContainerHighest: Color(0xff3f3c43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff6ecff),
      surfaceTint: Color(0xffd1bcfd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffcdb8f9),
      onPrimaryContainer: Color(0xff100031),
      secondary: Color(0xffffebf3),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfff5add7),
      onSecondaryContainer: Color(0xff1e0016),
      tertiary: Color(0xffe7f1ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff99c7f7),
      onTertiaryContainer: Color(0xff000c1a),
      error: Color(0xffffedd9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffeeba6a),
      onErrorContainer: Color(0xff130900),
      surface: Color(0xff141218),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff5edf9),
      outlineVariant: Color(0xffc7c0cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff503e76),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff17033c),
      secondaryFixed: Color(0xffffd8ec),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfff9b1db),
      onSecondaryFixedVariant: Color(0xff29001e),
      tertiaryFixed: Color(0xffcfe5ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff9dcbfb),
      onTertiaryFixedVariant: Color(0xff001223),
      surfaceDim: Color(0xff141218),
      surfaceBright: Color(0xff524f55),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff211f24),
      surfaceContainer: Color(0xff322f35),
      surfaceContainerHigh: Color(0xff3d3a40),
      surfaceContainerHighest: Color(0xff49454c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
