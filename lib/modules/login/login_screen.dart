//import 'dart:html';

import 'package:build_planner/base/custom_button.dart';
import 'package:build_planner/base/custom_text_field.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:build_planner/utils/router/route_constants.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
//  bool? passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildLoginCard(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.6,
//      decoration: BoxDecoration(
//        color: Theme.of(context).backgroundColor,
//        borderRadius: BorderRadius.circular(8),
//        shape: BoxShape.rectangle,
//      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).backgroundColor,
        elevation: 4,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: StyleConstants.commonBorder8,
        ),
        child: Padding(
          padding: CustomPadding.commonPadding20,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                StringConstants.cardHead,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                hintText: StringConstants.usernameHintText,
                textEditingController: textController1,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: StringConstants.passwordHintText,
                textEditingController: textController2,
              ),
              Divider(
                height: 40,
                color: Theme.of(context).backgroundColor,
              ),
              Padding(
                padding: CustomPadding.paddingBottom20,
                child: CustomButton(
//                  icon: Icon(Icons.add),
                  text: StringConstants.buttonSignInText,
                  onPressed: () => Get.toNamed(RouteConstants.bottomTabs),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Text(StringConstants.orHead),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: CustomPadding.paddingBottom20,
                child: CustomButton(
//                  icon: Icon(Icons.add),
                  text: StringConstants.buttonSignInWithGoogle,
                  onPressed: () => Get.toNamed(RouteConstants.bottomTabs),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          key: scaffoldKey,
//        backgroundColor: Theme.of(context).primaryColor,
          body: !ResponsiveWidget.isLargeScreen(context)
              ? Column(
//            mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: Get.width,
                      child: Card(
                        elevation: 8,
                        color: Theme.of(context).primaryColorDark,
//                alignment: Alignment(0, 0),
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(0),
//                    bottomRight: Radius.circular(20),
//                    topLeft: Radius.circular(0),
//                    topRight: Radius.circular(0),
//                  ),
//                ),
                        shape: RoundedRectangleBorder(
                          borderRadius: StyleConstants.bottomRightBorder140,
                        ),
                        child: Center(
                          child: Text(
                            StringConstants.loginHeadText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 44,
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: _buildLoginCard(context),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * 0.4,
                      child: Padding(
                        padding: CustomPadding.commonPadding20,
                        child: Center(
                          child: _buildLoginCard(context),
                        ),
                      ),
                    ),
                    Container(
                      color: Theme.of(context).primaryColorDark,
                      height: Get.height,
                      width: Get.width * 0.6,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/image_bg.png'),
                      ), //Image.asset('assets/image_bg.png'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
