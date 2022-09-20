import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTheme {
  HomeTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color darkBlue = Color(0xFF14212B);
  static const Color red = Color(0xffc62828);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}

const Color redColor = Color(0xffc62828);
const Color orangeColor = Color(0xFFff744c);
const Color greyColor = Color(0xFF9A9FAE);
const Color yellowColor = Color(0xFFFFC529);
const Color greenColor = Color(0XFF31CD66);
const Color blueColor = Color(0xFF2633C5);
const Color toscaColor = Color(0xff339F9F);
const Color purpleColor = Color(0xff6a1b9a);
const Color softGreyColor = Color(0xFFEAE8E8);
const Color darkColor = Color(0xFF1A1D26);
const Color whiteColor = Color(0xFFFFFFFF);
const Color pinkColor = Color(0xFFFDEFEF);
const Color softTosca = Color(0xFF71A9A9);
const Color transparentColor = Colors.transparent;

TextStyle orangeTextStyle = GoogleFonts.poppins(color: orangeColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);
TextStyle greenTextStyle = GoogleFonts.poppins(color: greenColor);
TextStyle yellowTextStyle = GoogleFonts.poppins(color: yellowColor);
TextStyle darkTextStyle = GoogleFonts.poppins(color: darkColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);
TextStyle blueTextStyle = GoogleFonts.poppins(color: blueColor);
TextStyle purppleTextSytle = GoogleFonts.poppins(color: purpleColor);
TextStyle redTextSytle = GoogleFonts.poppins(color: redColor);
TextStyle toscaTextSytle = GoogleFonts.poppins(color: toscaColor);

FontWeight bold = FontWeight.bold;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
