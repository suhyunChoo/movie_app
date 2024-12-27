import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/presentation/pages/detail_page/detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/home_page/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await dotenv.load(fileName: ".env"); 
  runApp(ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
