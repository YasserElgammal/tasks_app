import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/data/moor_database.dart';
import 'package:tasks_app/ui/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) =>AppDatabase(),
          child: MaterialApp(
        title: 'Material App',
        home: HomePage()
      
      ),
    );
  }
}