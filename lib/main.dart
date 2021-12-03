import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/custom_theme.dart';
import 'package:flutter_app_digital_finals/themes/themes.dart';
import 'package:provider/provider.dart';
import 'auth/model/psb_employee.dart';
import 'router.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences? prefs;
Map<String, dynamic>? curUser;
// FirebaseFirestore store = FirebaseFirestore.instance;
// User? currentUser = FirebaseAuth.instance.currentUser;
bool isDarkTheme = false;
bool isAuth = false;
DateTime? dateTime;
Timer? globalTimer;
TextEditingController taskPageTextController = TextEditingController(text: "ok");
FirebaseFirestore store = FirebaseFirestore.instance;
User? user = FirebaseAuth.instance.currentUser;
FirebaseApp? app;


// запуск
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp();

  //загрузка Firebase
  // await Firebase.initializeApp();

  //проверка настроек SharedPreferences темная или светлая тема
  await SharedPreferences.getInstance().then((value) {
    prefs = value;
    if (prefs != null) {
      if (prefs!.get("isDarkTeme") != null) {
        isDarkTheme = true;
      }


    }

  });

  isDarkTheme = isDarkTheme == null ? false : isDarkTheme;
  runApp(
    CustomTheme(
      initialThemeKey:
      isDarkTheme ? MyThemeKeys.DARKFC : MyThemeKeys.LIGHTFC,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // на какой экран попадаем при запуске приложения
  String initialRout = router.RouteNames.home;

  @override
  void initState() {
    isAuth = FirebaseAuth.instance.currentUser !=null;
    if (isAuth) {

    }
    initialRout ==  isAuth ? router.RouteNames.home : router.RouteNames.loginScreen;
    FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider<PsbEmployeeModelView>(create: (context) => PsbEmployeeModelView()),                   //данные для авторизованного
        ChangeNotifierProvider<AuthModelView>(create: (context) => initeAuth()),                   //данные для авторизованного
      //данные настроек
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRout,
      onGenerateRoute: router.Router.generateRoute,
      title: 'ПСБ - старт то work',
      theme: CustomTheme.of(context),
    ));
  }
}