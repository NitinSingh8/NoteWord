import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_word/files/dashboard_page.dart';
import 'package:note_word/files/add_new_word_page.dart';
import 'package:note_word/files/login_page.dart';
import 'package:note_word/files/see_all_words_page.dart';

import 'data/words_data.dart';

Future<void> main() async {


  await Hive.initFlutter();



  var box = await Hive.openBox('testBox');
  var wrodBox = await Hive.openBox("wordBox");



  // await box.put('dave', "fdsdf");

  // print(box.get('dave'));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Write words you learn everyday',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        backgroundColor: Colors.blue,
      ),
      home: DashBoardPage(),
      routes: {
        '/dashboard': (context) => DashBoardPage(),
        '/addNewWord': (context) => AddNewWordPage(),
        '/seeWords': (context) => AllWords(),
      },
    );
  }
}
