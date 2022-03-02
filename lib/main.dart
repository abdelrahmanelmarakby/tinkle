import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tinkle/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tinkle/app/data/models/user_settings_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  UserSettings.init();

  // Initialize the flutter firebase app
  await Firebase.initializeApp();
  // 2. Instantiate Firebase Messaging
  FirebaseMessaging _messaging = FirebaseMessaging.instance;

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
