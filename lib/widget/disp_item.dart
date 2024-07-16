import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:task_job_f/widget/buttons.dart';



class DispItem extends StatefulWidget {

  String imagePath;
  String itemTitle;
  String itemDescr;
  String netPrice;
  String price;
  String review;

   DispItem({
  required this.imagePath,
  required this.itemTitle,
  required this.itemDescr,
  required this.netPrice,
  required this.price,
  required this.review
  });

  @override
  State<DispItem> createState() => _DispItemState();


}

class _DispItemState extends State<DispItem> {
//List products=[];


  @override
  Widget build(BuildContext context) {


      return Container(

        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Color(0xff0a4b8a)),
        ),
        child: Column(
          children: [
            //display Image of item and favor button
            Container(clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),),
              child: Stack(alignment: Alignment.topRight,
                children: [
                       Image.network(widget.imagePath,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                    child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,),
                    );
                    },
                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                                    child: Text('Error loading image',style: TextStyle(color: Color(0xffff0000),
                                        fontSize:16 ),),
                                  );
                                },


                    width: 200,
                    height: 125,
                    fit: BoxFit.fill,),

                  Buttons(icons: Icons.heart_broken_outlined,
                    bkicon: Colors.white,
                    clicon: Color(0xff0a4b8a),),

                ],),),

            // end of image ==============================================================================

            //display Image of item and favor button
            Container(padding: EdgeInsets.only(left: 3),
              child: Column(
                children: [
                  //first row for name
                  Row(children: [
              Text(widget.itemTitle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ],),
              Row(children: [
                  Text(widget.itemDescr,
                        style: TextStyle(fontSize: 15,),),
                ],),


                  //==================================================================
                  SizedBox(height: 8,),
                  //=========================================
                  //second row for price
                  Row(children: [
                    Text(widget.netPrice,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight
                          .bold),),
                    SizedBox(width: 8,),
                    Text('${widget.price} EGP',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight
                          .bold, color: Color(0xff0a4b8a),
                          decoration: TextDecoration.lineThrough,decorationThickness: 3.5,decorationColor: Color(0xff0a4b8a)),),
                  ],),
                  //==================================================================
                  SizedBox(height: 3,),

                  //first row for name
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text('Review (${widget.review}) ', style: TextStyle(fontSize: 14,),),
                        SizedBox(width: 2,),
                        Icon(Icons.star_outlined, color: Color(0xffffd412),)
                      ],),
                      //add button
                      Buttons(icons: Icons.add,
                        bkicon: Color(0xff0a4b8a),
                        clicon: Colors.white,),
                    ],),
                  //==================================================================


                ],),),
            // end of image ==============================================================================
          ],
        ),
      );

  }

}
