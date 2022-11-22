import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function()? onIconPressed;

  CustomChip({required this.text, this.icon, this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: StyleConstants.commonBorder12,
      ),
      child: Padding(
        padding: CustomPadding.paddingHorizontal12Vertical4,
        child: icon != null
            ? FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
//                      Spacer(),
                    IconButton(
                      onPressed: onIconPressed,
                      icon: Icon(
                        this.icon,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
