import 'package:skeleton_mobileapps/app/infrastructure/app_component.dart';
import 'package:skeleton_mobileapps/app/ui/pages/penyakit/controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ViewCA;
import 'package:flutter/material.dart';

class Penyakit extends ViewCA.View {
  Penyakit({Key? key}) : super(key: key);

  @override
  _PenyakitState createState() =>
      new _PenyakitState(AppComponent.getInjector().get<ProfileController>());
}

class _PenyakitState extends ViewCA.ViewState<Penyakit, ProfileController>
    with WidgetsBindingObserver {
  _PenyakitState(ProfileController controller) : super(controller);

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
  Widget get view => ViewCA.ControlledWidgetBuilder<ProfileController>(
        builder: (context, controller) => Scaffold(
          key: globalKey,
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Penyakit")
            ],
          )
        ),
      );
}
