import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:flutter/material.dart';

class CustomTileDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  final String? key2;

  CustomTileDrawer({
    required this.icon,
    required this.title,
    required this.onTap,
    this.key2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.commonPadding4,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          key: key2 != null ? Key(key2!) : UniqueKey(),
          leading: Icon(
            icon,
            color: ColorConstants.textColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: ColorConstants.textColor,
            ),
//                            style: FlutterFlowTheme.title3.override(
//                              fontFamily: 'Poppins',
//                            ),
          ),
          tileColor: ColorConstants.tileColorDrawer,
          dense: false,
        ),
      ),
    );
  }
}
