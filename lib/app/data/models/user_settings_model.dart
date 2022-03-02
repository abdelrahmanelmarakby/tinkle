import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserSettings {
  bool isLogged;
  Locale? language;
  String? countryCode;
  String? city;
  String? area;
  String? gender;
  String? phoneNumber;
  DateTime? birthDate;
  static GetStorage _user = GetStorage("user");

  get getIsLogged {
    return _user.read("islogged");
  }

  set setIsLogged(isLogged) {
    _user.write("islogged", this.isLogged).then((value) {
      return value;
    });
  }

  get getLanguage {
    return _user.read("language");
  }

  set setLanguage(language) {
    _user.write("language", this.language).then((value) {
      return value;
    });
  }

  get getCountryCode {
    return _user.read("countrycode");
  }

  set setCountryCode(countryCode) {
    _user.write("countrycode", this.countryCode).then((value) {
      return value;
    });
  }

  get getCity {
    return _user.read("city");
  }

  set setCity(city) {
    _user.write("city", this.city).then((value) {
      return value;
    });
  }

  get getArea {
    return _user.read("area");
  }

  set setArea(Area) {
    _user.write("area", this.area).then((value) {
      return value;
    });
  }

  get getGender {
    return _user.read("gender");
  }

  set setGender(Gender) {
    _user.write("gender", this.gender).then((value) {
      return value;
    });
  }

  get getPhoneNumber {
    return _user.read("phonenumber");
  }

  set setPhoneNumber(phoneNumber) {
    _user.write("phonenumber", this.phoneNumber).then((value) {
      return value;
    });
  }

  get getBirthDate {
    return _user.read("birthdate");
  }

  set setBirthDate(BirthDate) {
    _user.write("birthdate", this.birthDate).then((value) {
      return value;
    });
  }

  static void init() async {
    _user = GetStorage("user");
  }

  UserSettings(
      {this.isLogged = false,
      this.language = const Locale("en", "US"),
      this.countryCode = "20",
      this.area = "mansoura",
      this.city = "mansoura",
      this.birthDate,
      this.gender = "male",
      this.phoneNumber = ""});
}
