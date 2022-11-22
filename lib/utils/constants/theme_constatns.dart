import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

/// <h1>theme_constatns</h1>
///
/// <p>
///
/// @author Darshan Prajapati (darshanp@meditab.com) Meditab Software Inc.
/// @version 1.0
/// @since 3/10/19 2:45 PM
///

class ThemeConstants {
  static List<String> themeName = [
    'Default Theme',
    'Purple Theme',
    'Green Theme',
    'Violate Theme',
    'Red Violate Theme',
    'Red Theme',
    'Gold Theme',
    'Dark Theme'
  ];
  static List<ThemeData> themeList = [
    defaultTheme,
    purpleTheme,
    greenTheme,
    violateTheme,
    redViolateTheme,
    redTheme,
    goldTheme,
    darkTheme,
  ];

  static final ThemeData defaultTheme = ThemeData(
      fontFamily: GoogleFonts.nunito().fontFamily,
      primaryColor: Color(0xff52ab98),
      primaryColorDark: Color(0xff2b6777),
      backgroundColor: Color(0xffebf6fa), //Color(0xff2b6777).withOpacity(0.2),
      textTheme: TextTheme(
        headline4: TextStyle(color: Color(0xff2b6777)),
        headline3: TextStyle(color: Color(0xffffffff)),
        headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
        headline1: TextStyle(color: Color(0xffe4061b)),
      ),
      brightness: Brightness.light);

  static final ThemeData purpleTheme = ThemeData(
      primaryColor: Color(0xff9c27b0),
      primaryColorDark: Color(0xff4A148c),
      backgroundColor: Color(0xffeef2f5),
      textTheme: TextTheme(
          headline4: TextStyle(color: Color(0xff4A148c)),
          headline3: TextStyle(color: Color(0xff324251)),
          headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
          headline1: TextStyle(color: Color(0xffe4061b))),
      brightness: Brightness.light);

  static final ThemeData greenTheme = ThemeData(
      primaryColor: Color(0xff2f9e44),
      primaryColorDark: Color(0xff04891d),
      backgroundColor: Color(0xffeef2f5),
      textTheme: TextTheme(
          headline4: TextStyle(color: Color(0xff04891d)),
          headline3: TextStyle(color: Color(0xff324251)),
          headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
          headline1: TextStyle(color: Color(0xffe4061b))),
      brightness: Brightness.light);

  static final ThemeData violateTheme = ThemeData(
      primaryColor: Color(0xffb407df),
      primaryColorDark: Color(0xffa300cc),
      backgroundColor: Color(0xffeef2f5),
      textTheme: TextTheme(
          headline4: TextStyle(color: Color(0xffa300cc)),
          headline3: TextStyle(color: Color(0xff324251)),
          headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
          headline1: TextStyle(color: Color(0xffe4061b))),
      brightness: Brightness.light);

  static final ThemeData redViolateTheme = ThemeData(
      primaryColor: Color(0xffcc008f),
      primaryColorDark: Color(0xffcc005c),
      backgroundColor: Color(0xffeef2f5),
      textTheme: TextTheme(
          headline4: TextStyle(color: Color(0xffcc005c)),
          headline3: TextStyle(color: Color(0xff324251)),
          headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
          headline1: TextStyle(color: Color(0xffe4061b))),
      brightness: Brightness.light);

  static final ThemeData redTheme = ThemeData(
      primaryColor: Color(0xffcb1406),
      primaryColorDark: Color(0xffE74C3C), //Color(0xffdf5207),
      backgroundColor: Color(0xffeef2f5),
      textTheme: TextTheme(
          headline4: TextStyle(
              color: Color(0xffE74C3C)), //TextStyle(color: Color(0xffdf5207)),
          headline3: TextStyle(color: Color(0xff324251)),
          headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
          headline1: TextStyle(color: Color(0xffe4061b))),
      brightness: Brightness.light);

  static final ThemeData goldTheme = ThemeData(
      primaryColor: Color(0xffdf8807),
      primaryColorDark: Color(0xffdf5207),
      backgroundColor: Color(0xffeef2f5),
      textTheme: TextTheme(
          headline4: TextStyle(color: Color(0xffdf5207)),
          headline3: TextStyle(color: Color(0xff324251)),
          headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
          headline1: TextStyle(color: Color(0xffe4061b))),
      brightness: Brightness.light);

  static final ThemeData darkTheme = ThemeData(
      primaryColor: Color(0xff000000),
      primaryColorDark: Color(0xff000000),
      backgroundColor: Color(0xff212121),
      textTheme: TextTheme(
          headline4: TextStyle(color: Color(0xff000000)),
          headline3: TextStyle(color: Color(0xff324251)),
          headline2: TextStyle(color: Color(0xff324251).withOpacity(0.6)),
          headline1: TextStyle(color: Color(0xffe4061b))),
      brightness: Brightness.light);
}
