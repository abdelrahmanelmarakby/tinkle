import 'package:ease/ease.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tinkle/app/data/api/Settings_Apis.dart';
import 'package:tinkle/app/modules/home/views/home_view.dart';
import 'package:tinkle/core/const.dart';
import 'package:tinkle/core/utils/values_manger.dart';

import '../controllers/settings_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SettingsView extends GetView<SettingsController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //scaffold key
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView(
          // physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            ChooseLangPage(),
            PhoneNumberPage(
              formKey: formKey,
            ),
            VerifyCodePage(),
            CityAreaPage(),
          ],
        ),
      ),
    );
  }
}

class ChooseLangPage extends StatelessWidget {
  ChooseLangPage({Key? key}) : super(key: key);
  final List<String> langs = ['English', 'العربية'];
  final List<String> langCodes = ['en-US', 'ar-EG'];
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: AppSize.size20),
            Image.asset(logo),
            const SizedBox(height: AppSize.size20 * 2),
            const Center(
                child: EaseTxt(
              "Choose your language",
              size: AppSize.size12 * 2,
            )),
            Obx(
              () => CheckboxListTile(
                value: settingsController.langCheckBox.value == "en-US",
                activeColor: Colors.white,
                checkColor: Colors.blue,
                selectedTileColor: Colors.blue,
                onChanged: (value) {
                  if (value == true) {
                    settingsController.langCheckBox.value = "en-US";

                    Get.updateLocale(Locale('en', 'US'));
                  } else {
                    settingsController.langCheckBox.value = "ar-EG";

                    Get.updateLocale(Locale('ar', 'EG'));
                  }
                },
                title: EaseTxt(
                  "English",
                  size: AppSize.size20,
                  color: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Obx(
              () => CheckboxListTile(
                activeColor: Colors.white,
                checkColor: Colors.blue,
                selectedTileColor: Colors.blue,
                value: settingsController.langCheckBox.value != "en-US",
                onChanged: (value) {
                  if (value == true) {
                    settingsController.langCheckBox.value = "ar-EG";

                    Get.updateLocale(Locale('ar', 'EG'));
                  } else {
                    settingsController.langCheckBox.value = "en-US";

                    Get.updateLocale(Locale('en', 'US'));
                  }
                },
                title: EaseTxt(
                  "العربية",
                  size: AppSize.size20,
                  color: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: AppSize.size20 * 3),
            Padding(
              padding: const EdgeInsets.all(AppPadding.padding18),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () => settingsController.pageController
                        .animateToPage(1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInOut),
                    child: EaseTxt(
                      "Next",
                      color: Colors.blue,
                      size: 18,
                      weight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneNumberPage extends StatelessWidget {
  PhoneNumberPage({Key? key, required this.formKey}) : super(key: key);
  //form key
  final GlobalKey<FormState> formKey;
  final SettingsController settingsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      Container(
                        child: Image.asset(logo),
                        width: MediaQuery.of(context).size.width * .5,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      Form(
                          child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              autofillHints: [
                                AutofillHints.telephoneNumberAreaCode
                              ],
                              autovalidateMode: AutovalidateMode.always,
                              controller: settingsController.phone,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                String pattern = r'^01[0-2,5]{1}[0-9]{8}$';
                                RegExp regExp = RegExp(pattern);
                                if (value!.length == 0) {
                                  return 'Please enter mobile number';
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please enter valid mobile number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Phone number".tr,
                                  focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  fillColor:
                                      Colors.grey.shade50.withOpacity(.5),
                                  filled: true,
                                  border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 40, bottom: 5),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.size8)),
                                        backgroundColor: Colors.white,
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width,
                                            64)),
                                    onPressed: () async {
                                      SettingsAPI.sendOtp(
                                              phoneNumber:
                                                  settingsController.phone.text)
                                          .then((value) {
                                        settingsController.pageController
                                            .animateToPage(
                                                settingsController
                                                        .pageController.page!
                                                        .toInt() +
                                                    1,
                                                duration:
                                                    Duration(milliseconds: 250),
                                                curve: Curves.easeInOut);
                                      });
                                      await SmsAutoFill().listenForCode;
                                    },
                                    child: EaseTxt(
                                      "Send verification code",
                                      color: Colors.blue,
                                      size: 16,
                                      weight: FontWeight.bold,
                                    ),
                                  ))),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class VerifyCodePage extends StatelessWidget {
  VerifyCodePage({Key? key}) : super(key: key);
  final SettingsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Phone Number Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: RichText(
                text: TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                      TextSpan(
                          text: controller.phone.text,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ],
                    style: TextStyle(color: Colors.black54, fontSize: 15)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                //key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinFieldAutoFill(
                      controller: controller.otp,
                      autoFocus: true,
                      enableInteractiveSelection: true,
                      codeLength: 6,
                      decoration: UnderlineDecoration(
                          errorText: "Invalid code",
                          bgColorBuilder: FixedColorBuilder(Colors.white30),
                          colorBuilder: FixedColorBuilder(Colors.white),
                          textStyle: GoogleFonts.tajawal(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ))),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
              child: ButtonTheme(
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    SettingsAPI.verifyOtp(
                        phoneNumber: controller.phone.text,
                        otpCode: controller.otp.text);
                  },
                  child: Center(
                      child: Text(
                    "VERIFY".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: Offset(1, -2),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: Offset(-1, 2),
                        blurRadius: 5)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CityAreaPage extends StatelessWidget {
  CityAreaPage({Key? key}) : super(key: key);
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    settingsController.city.value = settingsController.cities[0].toString();
    settingsController.country.value =
        settingsController.countries[0].toString();
    return SafeArea(
      child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(children: [
                const SizedBox(height: AppSize.size20),
                Image.asset(logo),
                const SizedBox(height: AppSize.size20 * 2),
                const Center(
                  child: EaseTxt(
                    "Get offers from",
                    size: AppSize.size12 * 2,
                  ),
                ),
                //Drop Down menu for city
                Obx(
                  () => DropdownButton<String>(
                    value: settingsController.city.value,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: GoogleFonts.tajawal(
                        color: Colors.red, fontWeight: FontWeight.w600),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    items: settingsController.cities.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      settingsController.city.value = newValue!;
                    },
                  ),
                ),
                SizedBox(height: AppSize.size20),
                //Drop Down menu for countries
                Obx(
                  () => DropdownButton<String>(
                    value: settingsController.country.value,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.red),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    items: settingsController.countries.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      settingsController.country.value = newValue!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.padding18),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () => settingsController.pageController
                            .animateToPage(2,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOut),
                        child: EaseTxt(
                          "Next",
                          color: Colors.blue,
                          size: 18,
                          weight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        )),
                  ),
                ),
              ]));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: settingsController.getData()),
    );
  }
}
