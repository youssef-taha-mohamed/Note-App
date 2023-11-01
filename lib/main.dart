import 'package:flutter/material.dart';
import 'package:notes/model/myprovider.dart';
import 'package:notes/screens/add_note.dart';
import 'package:notes/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MyProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          primaryColor: Colors.blue,
          //cardColor: Colors.blue,
          colorScheme: const ColorScheme.dark(
            //primaryContainer: Colors.black,
            primary: Colors.black,
            //tertiary: Colors.blue,
            //scrim: Colors.white
          )),
      home: HomeTwo(),
      routes: {
        'addNotes': (ctx) => AddNotes(),
      },
    );
  }
}
