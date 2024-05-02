import 'package:skeleton_mobileapps/app/infrastructure/app_component.dart';
import 'package:skeleton_mobileapps/app/ui/pages/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ViewCA;

class SplashPage extends ViewCA.View {
  SplashPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>
      SplashPageState(AppComponent.getInjector().get<SplashController>());
}

class SplashPageState extends ViewCA.ViewState<SplashPage, SplashController> {
  SplashPageState(this._controller) : super(_controller);
  final SplashController _controller;

  late Image splashImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    splashImage = Image.asset(
      'lib/app/ui/assets/images/jala.png',
      width: 400,
      height: 400,
    );
    //_controller.checkDevice();
    precacheImage(splashImage.image, context);
  }

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                child: splashImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
