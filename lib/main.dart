import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tinkle/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tinkle/core/services/notification_settings.dart';

Future<void> main() async {
  //////

  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'tinkle_group',
          channelKey: 'tinkle_channel',
          channelName: 'tinkle notifications',
          channelDescription: 'Notification channel for tinkle app',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          enableVibration: true,
          channelShowBadge: true,
          playSound: true,
          importance: NotificationImportance.High,
          enableLights: true,
        ),
      ],
      debug: true);

  ///////
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  print("Is USER LOGGED IN : " + GetStorage().read("islogged").toString());
  // Initialize the flutter firebase app
  await Firebase.initializeApp();
  // 2. Instantiate Firebase Messaging
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FCM().setNotifications();

  /// Initialize Sentry to capture errors and exceptions in your app. You can also use [SentryClient] to send events to Sentry. [SentryClient] is a wrapper around [Sentry] that provides a more friendly API.
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://db808c0f51964f05b2f785fa63c9c3ac@o511972.ingest.sentry.io/6214737';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.

      options.tracesSampleRate = 1.0;
      options.autoSessionTrackingInterval = Duration(seconds: 600);
      options.enableAutoSessionTracking = true;
      options.enableNativeCrashHandling = true;
      options.anrEnabled = true;
      options.enableAppLifecycleBreadcrumbs = true;
      options.enableOutOfMemoryTracking = true;
      options.tracesSampler = (samplingContext) {
        // If this is the continuation of a trace, just use that decision (rate controlled by the caller).
        final parentSampled = samplingContext.transactionContext.parentSampled;
        if (parentSampled != null) {
          return parentSampled ? 1.0 : 0.0;
        }

        return 1;
      };
    },
    appRunner: () => runApp(MyApp()),
  );
}

class ToggleIconBtnsFb1 extends StatefulWidget {
  final List<Icon> icons;
  final Function(int) selected;
  final Color selectedColor;
  final bool multipleSelectionsAllowed;
  final bool stateContained;
  final bool canUnToggle;
  ToggleIconBtnsFb1(
      {required this.icons,
      required this.selected,
      this.selectedColor = const Color(0xFF6200EE),
      this.stateContained = true,
      this.canUnToggle = false,
      this.multipleSelectionsAllowed = false,
      Key? key});

  @override
  _ToggleIconBtnsFb1State createState() => _ToggleIconBtnsFb1State();
}

class _ToggleIconBtnsFb1State extends State<ToggleIconBtnsFb1> {
  late List<bool> isSelected = [];
  @override
  void initState() {
    widget.icons.forEach((e) => isSelected.add(false));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButtons(
            color: Colors.black.withOpacity(0.60),
            selectedColor: widget.selectedColor,
            selectedBorderColor: widget.selectedColor,
            fillColor: widget.selectedColor.withOpacity(0.08),
            splashColor: widget.selectedColor.withOpacity(0.12),
            hoverColor: widget.selectedColor.withOpacity(0.04),
            borderRadius: BorderRadius.circular(4.0),
            isSelected: isSelected,
            highlightColor: Colors.transparent,
            onPressed: (index) {
              // send callback
              widget.selected(index);
              // if you wish to have state:
              if (widget.stateContained) {
                if (!widget.multipleSelectionsAllowed) {
                  final selectedIndex = isSelected[index];
                  isSelected = isSelected.map((e) => e = false).toList();
                  if (widget.canUnToggle) {
                    isSelected[index] = selectedIndex;
                  }
                }
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              }
            },
            children: widget.icons,
          ),
        ],
      ),
    );
  }
}
