import 'package:flutter/material.dart';
import 'package:skeleton_mobileapps/app/ui/common/custom_text_style.dart';
import 'package:skeleton_mobileapps/app/ui/common/themecustom.dart';


// ignore_for_file: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({Key? key, required this.text, this.margin, this.onTap})
      : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleMediumOnPrimary_1.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
