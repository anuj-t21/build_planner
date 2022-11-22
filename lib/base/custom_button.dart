import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool circularBorder;
  final double? width;
  final Icon? icon;
  final String? key2;
  final Color? color;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.circularBorder = false,
    this.key2,
    this.width,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key2 != null ? Key(key2!) : UniqueKey(),
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? Theme.of(context).primaryColorDark,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: circularBorder
                ? StyleConstants.commonBorder28
                : StyleConstants.commonBorder4,
          ),
        ),
//            padding: MaterialStateProperty.all(0),
      ),
      child: Container(
        constraints: circularBorder
            ? null
            : BoxConstraints(
                maxWidth: width ?? 300.0,
                minHeight: 50.0,
              ),
        height: 50,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColorDark,
          borderRadius: circularBorder
              ? StyleConstants.commonBorder28
              : StyleConstants.commonBorder4,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: icon != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (icon != null) icon as Widget,
//            if (icon != null)
//              SizedBox(
//                width: 80,
//              ),
            Center(
              child: Padding(
                padding: CustomPadding.commonPadding4,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color != null
                        ? Colors.black
                        : Theme.of(context).backgroundColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
