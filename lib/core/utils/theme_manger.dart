import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinkle/core/utils/values_manger.dart';
import 'color_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of the app
    scaffoldBackgroundColor: Color(0xff045681),
    primaryColor: ColorsManger.primary,
    primaryColorLight: ColorsManger.primary.withOpacity(.7),
    primaryColorDark: ColorsManger.primaryDark,
    disabledColor: ColorsManger.grey1,
    //card theme for the cards
    cardTheme: CardTheme(
      color: ColorsManger.white,
      shadowColor: ColorsManger.grey,
      elevation: AppSize.size4,
      margin: const EdgeInsets.all(AppMargin.margin8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    textTheme: TextTheme(
      headline1: GoogleFonts.tajawal(
        fontSize: AppSize.size12 * 2,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white,
      ),
      bodyText1: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white,
      ),
      bodyText2: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.normal,
        color: ColorsManger.white,
      ),
      headline2: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      headline3: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      headline4: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      headline5: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      headline6: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      subtitle1: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
      subtitle2: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
    ),
  );
}
