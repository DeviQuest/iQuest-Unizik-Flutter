import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iquest_unizik/data/local/shared_pref_util.dart';
import 'package:iquest_unizik/screens/create_profile_screen.dart';
import 'package:iquest_unizik/screens/home_screen.dart';
import 'package:iquest_unizik/screens/onboarding/onboarding_screen.dart';
import 'package:iquest_unizik/utils/constants.dart';
import './utils/utils.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtil.init();
  await Firebase.initializeApp();
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
