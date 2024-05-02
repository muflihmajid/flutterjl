import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeleton_mobileapps/app/infrastructure/app_component.dart';
import 'package:skeleton_mobileapps/app/ui/common/custom_button_style.dart';
import 'package:skeleton_mobileapps/app/ui/common/custom_text_style.dart';
import 'package:skeleton_mobileapps/app/ui/common/size_utils.dart';
import 'package:skeleton_mobileapps/app/ui/common/themecustom.dart';
import 'package:skeleton_mobileapps/app/ui/pages/hargaudang/controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as Viewcar;
import 'package:skeleton_mobileapps/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_mobileapps/app/ui/widget/app_decoration.dart';
import 'package:skeleton_mobileapps/app/ui/widget/custom_elevated_button.dart';
import 'package:skeleton_mobileapps/app/ui/widget/custom_image_view.dart';

class HargaUdangPage extends Viewcar.View {
  HargaUdangPage({Key? key}) : super(key: key);

  @override
  _HargaUdangState createState() =>
      _HargaUdangState(AppComponent.getInjector().get<HargaUdangController>());
}

class _HargaUdangState
    extends Viewcar.ViewState<HargaUdangPage, HargaUdangController>
    with WidgetsBindingObserver {
  _HargaUdangState(HargaUdangController controller) : super(controller);

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
  Widget get view => Viewcar.ControlledWidgetBuilder<HargaUdangController>(
        builder: (context, controller) => Scaffold(
          key: globalKey,
          backgroundColor: appTheme.blueGray50,
          body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 6.v),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.h,
                          ),
                          _buildSection01(context, controller)
                        ],
                      ),
                      SizedBox(height: 1.v),
                      _buildSection02(context, controller)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildSection01(
      BuildContext context, HargaUdangController controller) {
    return SizedBox(
      height: 172.v,
      width: 320.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 16.v,
              ),
              decoration: AppDecoration.fillOnPrimary,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Text(
                      "Coba Fitur Lainnya",
                      style: CustomTextStyles.titleMedium16,
                    ),
                  ),
                  carauselslide(context, controller), // Carausel
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection02(
      BuildContext context, HargaUdangController controller) {
    return SizedBox(
      width: 320.h,
      child: Container(
        decoration: AppDecoration.fillOnPrimary,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 4.v,
            );
          },
          itemCount: controller.hargaudangs.length,
          itemBuilder: (context, index) {
            return UserProfileItemWidget(controller, index);
          },
        ),
      ),
    );
  }

  Widget UserProfileItemWidget(HargaUdangController controller, int index) {
    return Container(
      padding: EdgeInsets.all(9.h),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder3,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 32.adaptSize,
                        width: 32.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16.h,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              "lib/app/ui/assets/images/img_ellipse.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller
                                      .hargaudangs[index].creator?.occupation ??
                                  "No Type",
                              style: theme.textTheme.bodySmall,
                            ),
                            SizedBox(height: 1.v),
                            Text(
                              controller.hargaudangs[index].creator?.name ??
                                  "No Type",
                              style: theme.textTheme.bodyMedium,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                _buildDynamicproperty(context)
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              controller.formatDate(
                  controller.hargaudangs[index].creator!.createdAt.toString()),
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              controller.hargaudangs[index].region?.provinceName ??
                  "No Province",
              style: CustomTextStyles.bodySmallSecondaryContainer_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              controller.hargaudangs[index].region?.regencyName ?? "No Type",
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "size 100",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 1.v),
                    Text(
                      "IDR 56.500",
                      style: theme.textTheme.titleLarge,
                    )
                  ],
                ),
                _buildDynamicproperty1(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDynamicproperty(BuildContext context) {
    return CustomElevatedButton(
      height: 22.v,
      width: 95.h,
      text: "Terverifikasi",
      margin: EdgeInsets.only(bottom: 13.v),
      leftIcon: Container(
        padding: EdgeInsets.all(2.h),
        margin: EdgeInsets.only(right: 3.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.h,
          ),
          gradient: LinearGradient(
            begin: const Alignment(0.5, 0),
            end: const Alignment(0.5, 1),
            colors: [appTheme.yellow600, appTheme.yellow800],
          ),
        ),
        child: CustomImageView(
          imagePath: 'lib/app/ui/assets/icons/img_signal.svg',
          height: 12.adaptSize,
          width: 12.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillYellow,
      buttonTextStyle: CustomTextStyles.bodySmallSecondaryContainer,
    );
  }

  /// Section Widget
  Widget _buildDynamicproperty1(BuildContext context) {
    return CustomElevatedButton(
      height: 32.v,
      width: 128.h,
      text: "LIHAT DETAIL",
      margin: EdgeInsets.only(
        top: 4.v,
        bottom: 6.v,
      ),
      buttonTextStyle: theme.textTheme.titleSmall!,
    );
  }

  Widget carauselslide(BuildContext context, HargaUdangController controller) {
    return CarouselSlider(
      options: CarouselOptions(height: 100.v),
      items: controller.imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                imagePath,
                width: 320.h,
                height: 200.v,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  
}
