import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserSettings {
  late bool isLogged;
  Locale? language;
  String? countryCode;
  String? city;
  String? area;
  String? gender;
  String? phoneNumber;
  DateTime? birthDate;
  get getIsLogged {
    return GetStorage().read("islogged") ?? false;
  }

  set setIsLogged(isLogged) {
    if (isLogged == null) print("CAN't ACCEPT NULL VALUE FROM IS LOGGED");
    GetStorage().write("islogged", this.isLogged).then((value) {
      return value;
    });
  }

  get getLanguage {
    return GetStorage().read("language") ?? Locale("en", "US");
  }

  set setLanguage(language) {
    GetStorage().write("language", this.language).then((value) {
      return value;
    });
  }

  get getCountryCode {
    return GetStorage().read("countrycode");
  }

  set setCountryCode(countryCode) {
    GetStorage().write("countrycode", this.countryCode).then((value) {
      return value;
    });
  }

  get getCity {
    return GetStorage().read("city");
  }

  set setCity(city) {
    GetStorage().write("city", this.city).then((value) {
      return value;
    });
  }

  get getArea {
    return GetStorage().read("area");
  }

  set setArea(Area) {
    GetStorage().write("area", this.area).then((value) {
      return value;
    });
  }

  get getGender {
    return GetStorage().read("gender");
  }

  set setGender(Gender) {
    GetStorage().write("gender", this.gender).then((value) {
      return value;
    });
  }

  get getPhoneNumber {
    return GetStorage().read("phonenumber");
  }

  set setPhoneNumber(phoneNumber) {
    GetStorage().write("phonenumber", this.phoneNumber).then((value) {
      return value;
    });
  }

  get getBirthDate {
    return GetStorage().read("birthdate");
  }

  set setBirthDate(BirthDate) {
    GetStorage().write("birthdate", this.birthDate).then((value) {
      return value;
    });
  }
}
