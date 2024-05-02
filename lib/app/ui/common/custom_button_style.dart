import 'package:flutter/material.dart';
import 'package:skeleton_mobileapps/app/ui/common/size_utils.dart';
import 'package:skeleton_mobileapps/app/ui/common/themecustom.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillOnPrimaryContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
              22.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillPrimaryLR22 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(
              22.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillYellow => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellow50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
      );
// text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
