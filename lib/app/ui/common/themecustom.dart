import 'package:flutter/material.dart';
import 'package:skeleton_mobileapps/app/ui/common/size_utils.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeCustom().themeColor();
ThemeData get theme => ThemeCustom().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

class ThemeCustom {
  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray500,
          fontSize: 16.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.indigo300,
          fontSize: 12.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 9.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 22.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w900,
        ),
        titleMedium: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 18.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF1B77DF),
    secondaryContainer: Color(0XFF454546),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF004492),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => const Color(0XFF000000);
// Blacka
  Color get black9000a => const Color(0X0A000000);
// Blue
  Color get blue300 => const Color(0XFF72B7F6);
  Color get blue400 => const Color(0XFF489AE8);
  Color get blue50 => const Color(0XFFE7F4FF);
// BlueGray
  Color get blueGray400 => const Color(0XFF888888);
  Color get blueGray50 => const Color(0XFFEAEFF5);
// Gray
  Color get gray100 => const Color(0XFFF6F6F6);
  Color get gray10001 => const Color(0XFFF4F5F6);
  Color get gray10002 => const Color(0XFFF1F4F8);
  Color get gray300 => const Color(0XFFE5E5E5);
  Color get gray50 => const Color(0XFFF7FBFF);
  Color get gray500 => const Color(0XFFA09E9E);
  Color get gray600 => const Color(0XFF727272);
// Indigo
  Color get indigo300 => const Color(0XFF849ED1);
// Red
  Color get red800 => const Color(0XFFDB1021);
// Yellow
  Color get yellow50 => const Color(0XFFFFF8E7);
  Color get yellow600 => const Color(0XFFFFD232);
  Color get yellow800 => const Color(0XFFF6A52C);
}
