import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tinkle/app/modules/Settings/views/settings_view.dart';
import 'package:tinkle/app/modules/home/views/home_view.dart';

class ControlView extends StatefulWidget {
  ControlView({Key? key}) : super(key: key);

  @override
  _ControlViewState createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  @override
  Widget build(BuildContext context) {
    if (GetStorage().read("islogged") == true)
      return HomeView();
    else
      return SettingsView();
  }
}
