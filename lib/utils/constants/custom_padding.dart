import 'package:flutter/material.dart';

///
/// Meditab Software Inc. CONFIDENTIAL
/// __________________
///
///  [2018] Meditab Software Inc.
///  All Rights Reserved.
///
/// NOTICE:  All information contained herein is, and remains
/// the property of Meditab Software Inc. and its suppliers,
/// if any.  The intellectual and technical concepts contained
/// herein are proprietary to Meditab Software Incorporated
/// and its suppliers and may be covered by U.S. and Foreign Patents,
/// patents in process, and are protected by trade secret or copyright law.
/// Dissemination of this information or reproduction of this material
/// is strictly forbidden unless prior written permission is obtained
/// from Meditab Software Incorporated.

/// <h1>custom_padding</h1>
///
/// <p>
///
/// @author Darshan Prajapati (darshanp@meditab.com) Meditab Software Inc.
/// @version 1.0
/// @since 7/10/19 3:05 PM
///

class CustomPadding {
  static final EdgeInsets commonPadding4 = EdgeInsets.all(4.0);
  static final EdgeInsets commonPadding8 = EdgeInsets.all(8.0);
  static final EdgeInsets commonPadding12 = EdgeInsets.all(12.0);
  static final EdgeInsets commonPadding16 = EdgeInsets.all(16.0);
  static final EdgeInsets commonPadding20 = EdgeInsets.all(20.0);
  static final EdgeInsets commonPadding36 = EdgeInsets.all(36.0);

  static final EdgeInsets paddingLeft8 = EdgeInsets.only(left: 8);

  static final EdgeInsets paddingRight8 = EdgeInsets.only(right: 8);
  static final EdgeInsets paddingRight20 = EdgeInsets.only(right: 20);

  static final EdgeInsets paddingTop8 = EdgeInsets.only(top: 10);
  static final EdgeInsets paddingTop12 = EdgeInsets.only(top: 12);
  static final EdgeInsets paddingTop24 = EdgeInsets.only(top: 24);
  static final EdgeInsets paddingTop36 = EdgeInsets.only(top: 36);

  static final EdgeInsets paddingBottom36 = EdgeInsets.only(bottom: 36);
  static final EdgeInsets paddingBottom20 = EdgeInsets.only(bottom: 20);

  static final EdgeInsets paddingRight20Left20 =
      EdgeInsets.only(right: 20, left: 20);
  static final EdgeInsets paddingRight8Left8 =
      EdgeInsets.only(right: 8, left: 8);
  static final EdgeInsets paddingRight40Left20 =
      EdgeInsets.only(right: 40, left: 20);
  static final EdgeInsets paddingRight20Left40 =
      EdgeInsets.only(right: 20, left: 40);

  static final EdgeInsets paddingBottom8Right8 =
      EdgeInsets.only(bottom: 8, right: 8);

  static final EdgeInsets paddingHorizontal4Vertical8 =
      EdgeInsets.symmetric(horizontal: 4, vertical: 8);
  static final EdgeInsets paddingHorizontal4Vertical12 =
      EdgeInsets.symmetric(horizontal: 4, vertical: 12);
  static final EdgeInsets paddingHorizontal12Vertical4 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 4);
  static final EdgeInsets paddingHorizontal8Vertical4 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static final EdgeInsets paddingHorizontal20Vertical8 =
      EdgeInsets.symmetric(horizontal: 20, vertical: 8);

  static final EdgeInsets paddingVertical4 = EdgeInsets.symmetric(vertical: 4);
  static final EdgeInsets paddingVertical8 = EdgeInsets.symmetric(vertical: 8);
  static final EdgeInsets paddingVertical12 =
      EdgeInsets.symmetric(vertical: 12);
  static final EdgeInsets paddingVertical36 =
      EdgeInsets.symmetric(vertical: 36);

  static final EdgeInsets paddingHorizontal8 =
      EdgeInsets.symmetric(horizontal: 8);

  static final EdgeInsets paddingltb4 =
      EdgeInsets.only(left: 4, top: 4, bottom: 4);
  static final EdgeInsets paddingrtb8 =
      EdgeInsets.only(right: 8, top: 8, bottom: 8);
  static final EdgeInsets paddingrtb20 =
      EdgeInsets.only(right: 20, top: 20, bottom: 20);

  static final EdgeInsets textFieldContentPadding =
      EdgeInsets.only(left: 16, bottom: 12, top: 8);

  static final EdgeInsets textFieldPadding = EdgeInsets.only(bottom: 18);

  static final EdgeInsets welcomeScreenPadding =
      EdgeInsets.only(left: 24, right: 24, bottom: 42);

  static final EdgeInsets screenHeadingPadding =
      EdgeInsets.only(left: 24, right: 24, top: 36);

  static final EdgeInsets demographicPadding = EdgeInsets.only(top: 36);

  static final EdgeInsets editDemographicPadding =
      EdgeInsets.symmetric(horizontal: 16);

  static final EdgeInsets editDemographicPadding2 = EdgeInsets.only(right: 16);

  static final EdgeInsets richTextBoxPadding = EdgeInsets.only(top: 12);

  //Dialog flow
  static final EdgeInsets dialogFlowTextFieldPadding =
      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0);
  static final EdgeInsets chatBodyPadding = const EdgeInsets.all(16.0);
  static final EdgeInsets botMessageMargin = const EdgeInsets.only(right: 8.0);
  static final EdgeInsets userMessagePadding = const EdgeInsets.only(top: 16.0);
}
