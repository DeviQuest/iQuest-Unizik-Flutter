import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iquest_unizik/data/local/shared_pref_util.dart';
import 'package:iquest_unizik/screens/create_profile_screen.dart';
import 'package:iquest_unizik/screens/home_screen.dart';
import 'package:iquest_unizik/screens/onboarding/onboarding_screen.dart';
import 'package:iquest_unizik/utils/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import './utils/utils.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtil.init();
  await Firebase.initializeApp();


  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId(Constants.ONESIGNAL_APP_ID);

 //The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt.
  // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
  });

  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in iOS)
  });

  OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
  });




  runApp(MyApp(appTheme: AppTheme()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appTheme}) : super(key: key);
  final AppTheme appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final bool hasSeenOnBoarding = SharedPrefUtil.getBoolFromPref(Constants.HAS_SEEN_ONBOARDING) == null ? false : true;

    return MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: hasSeenOnBoarding ? const CreateProfileScreen() : const OnBoardingScreen(),
    );
  }
}
