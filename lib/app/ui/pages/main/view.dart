import 'package:skeleton_mobileapps/app/infrastructure/app_component.dart';
import 'package:skeleton_mobileapps/app/ui/common/size_utils.dart';
import 'package:skeleton_mobileapps/app/ui/common/themecustom.dart';
import 'package:skeleton_mobileapps/app/ui/pages/kabarudang/view.dart';
import 'package:skeleton_mobileapps/app/ui/pages/hargaudang/view.dart';
import 'package:skeleton_mobileapps/app/ui/pages/main/controller.dart';
import 'package:skeleton_mobileapps/app/ui/pages/penyakit/view.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as Viewcar;
import 'package:flutter/material.dart';
import 'package:skeleton_mobileapps/app/ui/widget/app_bar/appbar_subtitle.dart';
import 'package:skeleton_mobileapps/app/ui/widget/app_bar/custom_app_bar.dart';

class MainPage extends Viewcar.View {
  MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _MainPageState(AppComponent.getInjector().get<MainController>());
}

class _MainPageState extends Viewcar.ViewState<MainPage, MainController>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  MainController _controller;
  _MainPageState(this._controller) : super(_controller);
  late TabController tabviewController;
  AppLifecycleState? _state;

  List<Widget> pages = [
    HargaUdangPage(),
    KabarUdang(),
    Penyakit(),
  ];

  @override
  initState() {
    super.initState();
    tabviewController = TabController(length: pages.length, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    tabviewController.dispose();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget get view => Viewcar.ControlledWidgetBuilder<MainController>(
        builder: (context, controller) => Scaffold(
          key: globalKey,
          body: pages[controller.tabIndex ?? 0],
          appBar: AppBar(
            title: _buildAppBar(context),
            bottom: TabBar(
              labelColor: theme.colorScheme.primary,
              labelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              ),
              //unselectedLabelColor: appTheme.gray600,
              unselectedLabelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              ),
              indicatorColor: theme.colorScheme.primary,
              controller: tabviewController,
              tabs: const [
                Tab(
                  text: 'Harga Udang',
                ),
                Tab(
                  text: 'Kabar Udang',
                ),
                Tab(
                  text: 'Penyakit',
                ),
              ],
              onTap: (index) {
                controller.changeTab(index);
              },
            ),
          ),
        ),
      );

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: 
      IconButton(
        icon: const Icon(Icons.arrow_back),
        color: theme.colorScheme.onPrimary,
        onPressed: () {
          onTapArrowleftone(context);
        },
      ),
      title: AppbarSubtitle(
        text: "Jala Media",
        margin: EdgeInsets.only(left: 12.h),
      ),
      styleType: Style.bgFill,
    );
  }

   /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
