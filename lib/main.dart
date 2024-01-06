// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:true_citizen_app/ui/home.dart';

final ThemeData _appTheme = _buildtheme();
ThemeData _buildtheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    hintColor: Colors.amber,
    scaffoldBackgroundColor: Colors.transparent,
    backgroundColor: Colors.amber,
    textTheme: TextTheme(
        headline1: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 17, fontFamily: "Lobster")),
  );
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appTheme,
// void main() => runApp(MaterialApp(
//     theme: ThemeData(
//       brightness: Brightness.dark,
//       primaryColor: Colors.lightBlue[800],
//       textTheme: TextTheme(
//         headline1: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
//         bodyText2: TextStyle(
//           fontSize: 17,
//         ),
//       ),
      //   ),
      home: QuizApp(),
    ));
TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w400,
        ),
        headline6: base.headline6!
            .copyWith(fontSize: 18.0, fontStyle: FontStyle.italic),
        caption:
            base.caption!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
        button: base.button!.copyWith(),
        // bodyText1: base.bodyText1!.copyWith(
        //   fontSize: 17,
        //   fontFamily: "Lobster",
        //   color: Colors.white,
        // )
      )
      .apply(
        fontFamily: "Lobster",
        displayColor: Colors.amber,
        //bodyColor: Colors.red
      );
}
