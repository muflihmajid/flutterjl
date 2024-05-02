import 'package:skeleton_mobileapps/app/infrastructure/app_component.dart';
import 'package:skeleton_mobileapps/app/ui/pages/kabarudang/controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as Viewcar;
import 'package:flutter/material.dart';

class KabarUdang extends Viewcar.View {
  KabarUdang({Key? key}) : super(key: key);

  @override
  _KabarUdangState createState() =>
      new _KabarUdangState(AppComponent.getInjector().get<MidController>());
}

class _KabarUdangState extends Viewcar.ViewState<KabarUdang, MidController>
    with WidgetsBindingObserver {
  _KabarUdangState(MidController controller) : super(controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget get view => Viewcar.ControlledWidgetBuilder<MidController>(
        builder: (context, controller) => Scaffold(
            key: globalKey,
            body: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Text("Kabar Udang")],
            )),
      );
}
