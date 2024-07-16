import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  IconData icons;
  Color bkicon;
  Color clicon;

  Buttons({required this.icons,required this.bkicon,required this.clicon});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(3),
        decoration:  BoxDecoration( borderRadius:BorderRadius.circular(20),color: bkicon),
        child: InkWell(onTap: (){}, child: Icon(icons,size: 30,color: clicon,)));

  }
}
