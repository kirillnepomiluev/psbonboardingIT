import 'package:flutter/material.dart';

import 'colors.dart';

enum MyThemeKeys {LIGHTFC, DARKFC}

class MyThemes {


  static final ThemeData lightThemeFcNnFonts = ThemeData(
    //Цвет фона для основных частей приложения (панели инструментов, панели вкладок и т. Д.)
    primaryColor: Colors.white,
    //Более темная версия primaryColor .
    primaryColorDark: Colors.white,
    //Цвет, который контрастирует с primaryColor , например, используется в качестве оставшейся части индикатора выполнения.
    backgroundColor: Colors.white,
    //не понятно пока
    accentColor: Colors.white,
    //основной задний цвет
    scaffoldBackgroundColor: Colors.white,
    //цвет фона диалоговых окон
    dialogBackgroundColor: Colors.white,
    //яркость темы
    brightness: Brightness.light,
    //цвет контейнеров и основных боксов
    cardColor: Colors.white,
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 16,fontFamily: 'Gilroy',fontWeight: FontWeight.w400,color: blueTextPSB))),

    appBarTheme: const AppBarTheme(
        elevation: 0,
        textTheme: TextTheme(
          //Используется для основного текста на панелях приложений и в диалоговых окнах (например, AppBar.title и AlertDialog.title ).
          headline6: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: "Gilroy",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
          ),
        ),

        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.white)

    ),
    textTheme: const TextTheme(
      // Самый маленький стиль
      overline: TextStyle(color: Color(0xFF818C99), fontFamily: "Gilroy",fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),

      //Используется для кнопок .
      button: TextStyle(color: Colors.white, fontFamily: "Gilroy",fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),

      //Используется для вспомогательного текста, связанного с изображениями.
      caption: TextStyle(color: Colors.black, fontFamily: "Gilroy",fontSize: 16 ),

      //Используется для основного текста в списках (например, ListTile.title )(цифра рейтинга в сообщениях)
      subtitle1: TextStyle(color: Colors.black, fontSize: 12,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500, fontFamily: "v",),

      //Для среднего выделения текста, который немного меньше, чем subtitle1()(текст выделенный чуть больше чем основное например в плашке вопроса"answrs")
      subtitle2: TextStyle(color: Colors.black, fontFamily: "Gilroy",fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),

      //Используется для выделения текста, который иначе был бы bodyText2(для выделенного текста напиример имя в плашке вопроса)
      bodyText1: TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Gilroy", fontWeight: FontWeight.w500, fontStyle: FontStyle.normal
      ),

      //Стиль текста по умолчанию для материала(для основного текста)
      bodyText2: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Gilroy", fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,letterSpacing: -0.24
      ),

      //Чрезвычайно большой текст()
      headline1: TextStyle(
        fontSize: 32,
        fontFamily: "Gilroy",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),

      //Очень и очень большой текст(синий текст 2D)
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Gilroy",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),

      //Очень большой текст.(Cветло серый текст , например сообщения)
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: "Gilroy",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),

      //Большой текст.(черный текст)
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontFamily: "Gilroy",
      ),

      //Используется для большого текста в диалоговых окнах (например, месяц и год
      // в диалоговом окне, отображаемом showDatePicker )
      headline5: TextStyle(
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontFamily: "Gilroy",
          color: Colors.black,
          letterSpacing: -0.41
      ),

      //Используется для основного текста на панелях приложений и в диалоговых окнах (например, AppBar.title и AlertDialog.title ).
      headline6: TextStyle(
        fontSize: 21,
        fontFamily: "Gilroy",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
    ),

    primaryIconTheme: const IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: "Gilroy",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color(0xFF99A2AD),
      ),
      unselectedItemColor: Color(0xFF99A2AD),
      selectedItemColor: Color(0xFF00A0D8),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: "Gilroy",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: blueTextPSB,
      ),
    ),




    tabBarTheme: TabBarTheme(
        unselectedLabelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Roboto",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xFF818C99),
        ),
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Roboto",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
        labelColor: Color(0xFF000000),
        unselectedLabelColor: Color(0xFF818C99)),
  );


  static final ThemeData darkThemeFcNnFonts = ThemeData(
    //Цвет фона для основных частей приложения (панели инструментов, панели вкладок и т. Д.)
    primaryColor: Colors.white,
    //Более темная версия primaryColor .
    primaryColorDark: Colors.white,
    //Цвет, который контрастирует с primaryColor , например, используется в качестве оставшейся части индикатора выполнения.
    backgroundColor: Colors.white,
    //не понятно пока
    accentColor: Colors.white,
    //основной задний цвет
    scaffoldBackgroundColor: Colors.white,
    //цвет фона диалоговых окон
    dialogBackgroundColor: Colors.white,
    //яркость темы
    brightness: Brightness.light,
    //цвет контейнеров и основных боксов
    cardColor: Colors.white,
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 16,fontFamily: 'Gilroy',fontWeight: FontWeight.w400,color: blueTextPSB))),

    appBarTheme: AppBarTheme(
        elevation: 0,
        textTheme: TextTheme(
          //Используется для основного текста на панелях приложений и в диалоговых окнах (например, AppBar.title и AlertDialog.title ).
          headline6: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: "Montserrat",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
          ),
        ),

        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.white)

    ),
    textTheme: TextTheme(
      // Самый маленький стиль
      overline: TextStyle(color: Color(0xFF818C99), fontFamily: "Calibri",fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),

      //Используется для кнопок .
      button: TextStyle(color: Colors.white, fontFamily: "Roboto",fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),

      //Используется для вспомогательного текста, связанного с изображениями.
      caption: TextStyle(color: Colors.black, fontFamily: "Montserrat",fontSize: 16 ),

      //Используется для основного текста в списках (например, ListTile.title )(цифра рейтинга в сообщениях)
      subtitle1: TextStyle(color: Colors.black, fontSize: 12,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500, fontFamily: "Roboto",),

      //Для среднего выделения текста, который немного меньше, чем subtitle1()(текст выделенный чуть больше чем основное например в плашке вопроса"answrs")
      subtitle2: TextStyle(color: Colors.black, fontFamily: "Roboto",fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),

      //Используется для выделения текста, который иначе был бы bodyText2(для выделенного текста напиример имя в плашке вопроса)
      bodyText1: TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w500, fontStyle: FontStyle.normal
      ),

      //Стиль текста по умолчанию для материала(для основного текста)
      bodyText2: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,letterSpacing: -0.24
      ),

      //Чрезвычайно большой текст()
      headline1: TextStyle(
        fontSize: 32,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),

      //Очень и очень большой текст(синий текст 2D)
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),

      //Очень большой текст.(Cветло серый текст , например сообщения)
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),

      //Большой текст.(черный текст)
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontFamily: "Roboto",
      ),

      //Используется для большого текста в диалоговых окнах (например, месяц и год
      // в диалоговом окне, отображаемом showDatePicker )
      headline5: TextStyle(
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          color: Colors.black,
          letterSpacing: -0.41
      ),

      //Используется для основного текста на панелях приложений и в диалоговых окнах (например, AppBar.title и AlertDialog.title ).
      headline6: TextStyle(
        fontSize: 21,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
    ),

    primaryIconTheme: IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color(0xFF99A2AD),
      ),
      unselectedItemColor: Color(0xFF99A2AD),
      selectedItemColor: Color(0xFF00A0D8),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color(0xFF00A0D8),
      ),
    ),




    tabBarTheme: TabBarTheme(
        unselectedLabelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Roboto",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xFF818C99),
        ),
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Roboto",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
        labelColor: Color(0xFF000000),
        unselectedLabelColor: Color(0xFF818C99)),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHTFC:
        return lightThemeFcNnFonts;
      case MyThemeKeys.DARKFC:
        return darkThemeFcNnFonts;
      default:
        return lightThemeFcNnFonts;
    }
  }
}

