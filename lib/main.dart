import 'package:flutter/material.dart';
import 'package:task_job_f/screen/disp_item_screen.dart';


void main() {
  runApp(const FlutterTask());
}

class FlutterTask extends StatelessWidget {
  const FlutterTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute:DispItemScreen.routeName ,
      routes: {
        DispItemScreen.routeName:(context)=>DispItemScreen(),
      },
    );
  }
}