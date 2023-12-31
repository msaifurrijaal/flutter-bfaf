import 'package:flutter/material.dart';

const Color orangeColor = Color(0xFFFF9209);
const Color darkOrangeColor = Color(0xFFFF6C22);
const Color lightOrangeColor = Color(0xFFFFD099);
const Color softOrangeColor = Color(0xFFf9ead8);
const Color yellowColor = Color(0xFFFFCD4B);
const Color blackColor = Color(0xFF000000);
const Color whiteColor = Color(0xffFFFFFF);
const Color greyColor = Color(0xff98A2B3);
const Color darkGreyColor = Color(0xFF667085);
const Color softGreyColor = Color(0xFFCCCCCC);
const Color greyLightColor = Color(0xFFebebeb);
Color transparentColor = const Color(0xffFFFFFF).withOpacity(0.0);
const Color bgEditTextColor = Color(0xFFf9fbff);

ThemeData lightTheme = ThemeData(
  fontFamily: 'Satoshi',
  brightness: Brightness.light,
  textTheme: const TextTheme(
    displayLarge:
        TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: blackColor),
    displayMedium:
        TextStyle(fontSize: 60, fontWeight: FontWeight.w300, color: blackColor),
    displaySmall:
        TextStyle(fontSize: 48, fontWeight: FontWeight.w300, color: blackColor),
    headlineMedium:
        TextStyle(fontSize: 34, fontWeight: FontWeight.w300, color: blackColor),
    headlineSmall:
        TextStyle(fontSize: 24, fontWeight: FontWeight.w300, color: blackColor),
    titleLarge:
        TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: blackColor),
    bodyLarge:
        TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: blackColor),
    bodyMedium:
        TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackColor),
    bodySmall:
        TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: blackColor),
    labelLarge:
        TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(darkOrangeColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  ),
);
