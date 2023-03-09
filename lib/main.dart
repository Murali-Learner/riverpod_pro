import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pro/views/home/home_view.dart';
import 'package:riverpod_pro/views/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await getAccessToken();
  runApp(const ProviderScope(child: MyApp()));
}

bool isTokenExist = false;
getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var accessToken = prefs.getString("accessToken");
  log(accessToken.toString());

  if (accessToken != null) {
    isTokenExist = true;
  }
  log(isTokenExist.toString());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isTokenExist ? const HomeView() : const LoginView(),
    );
  }
}
