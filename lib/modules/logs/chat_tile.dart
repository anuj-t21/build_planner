import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String username;
  final String imageUrl;
  final String text;
  final bool textByCurrentUser;

  ChatTile({
    required this.username,
    required this.text,
    required this.imageUrl,
    required this.textByCurrentUser,
  });

  Widget _buildImageAvatar() {
    return Container(
      width: 30,
      height: 30,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.network(
        imageUrl,
      ),
    );
  }

  Widget _buildMessageBox(BuildContext context) {
    return Padding(
      padding: textByCurrentUser
          ? CustomPadding.paddingRight8Left8
          : CustomPadding.paddingLeft8,
      child: Column(
        crossAxisAlignment: textByCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: CustomPadding.commonPadding4,
            child: Text(
              username,
              style: TextStyle(
                fontSize: 16,
                color: ColorConstants.textColor,
              ),
            ),
          ),
          Container(
//        width: MediaQuery.of(context).size.width * 0.45,
            padding: CustomPadding.commonPadding12,
//        height: 40,
            decoration: BoxDecoration(
              color: ColorConstants.cardColor,
              borderRadius: textByCurrentUser
                  ? StyleConstants.br0Border
                  : StyleConstants.bl0Border,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
//            Column(
//              crossAxisAlignment: textByCurrentUser
//                  ? CrossAxisAlignment.end
//                  : CrossAxisAlignment.start,
//              children: [
//
//                Text(text),
//              ],
//            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.commonPadding4,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            textByCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          textByCurrentUser ? _buildMessageBox(context) : _buildImageAvatar(),
          textByCurrentUser ? _buildImageAvatar() : _buildMessageBox(context),
        ],
      ),
    );
  }
}
