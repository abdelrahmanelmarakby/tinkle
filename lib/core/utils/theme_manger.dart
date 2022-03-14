import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinkle/core/utils/values_manger.dart';
import 'color_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of the app
    scaffoldBackgroundColor: Colors.white,
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
        color: ColorsManger.primary,
      ),
      bodyText1: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.normal,
        color: ColorsManger.primary,
      ),
      bodyText2: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.normal,
        color: ColorsManger.primary,
      ),
      headline2: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.primary,
      ),
      headline3: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.primary,
      ),
      headline4: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.primary,
      ),
      headline5: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.primary,
      ),
      headline6: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.primary,
      ),
      subtitle1: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.primary,
      ),
      subtitle2: GoogleFonts.tajawal(
        fontSize: AppSize.size16,
        fontWeight: FontWeight.bold,
        color: ColorsManger.primary,
      ),
    ),
  );
}
