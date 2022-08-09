import 'package:flutter/material.dart';
import 'package:undebunkable/ui/home_page_admin.dart';
import 'package:undebunkable/ui/widgets/add_task_bar.dart';
import 'package:undebunkable/ui/widgets/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(0, 180, 189, 235),
        
      ),
      
      home: InitInput(),
    );
  }
}

  