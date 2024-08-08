import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:hive/hive.dart';
import 'package:quizapp/models/userfunctions.dart';
import 'package:quizapp/root.dart';
import 'package:quizapp/utility/class.dart';

void main(List<String> args) async {

  // var box1=await Hive.openBox('mybox');
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDatabase();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => QuestionProvider(),)
    ],
    child: const MaterialApp(debugShowCheckedModeBanner: false,
      home: Root())));
}
