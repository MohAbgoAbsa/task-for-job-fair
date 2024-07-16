import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class SerchFild extends StatelessWidget {
  const SerchFild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'What do you serch for ?',
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          prefixIcon: Icon(Icons.search,color: Color(0xff0a4b8a),size: 45,),
border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(width: 2,color:Color(0xff0a4b8a) )),
enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(width: 2,color:Color(0xff0a4b8a) ))

      ),
    );
  }
}
