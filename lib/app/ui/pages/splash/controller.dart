import 'dart:async';
import 'package:skeleton_mobileapps/app/infrastructure/contract/base_controller.dart';
import 'package:skeleton_mobileapps/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class SplashController extends BaseController {

  SplashController() : super() {
    _navigate();
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  _navigate() {
    var duration = const Duration(seconds: 1);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(getContext(), Pages.main);
    });
  }
}
