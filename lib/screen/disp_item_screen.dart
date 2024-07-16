import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:task_job_f/widget/disp_item.dart';
import 'package:task_job_f/widget/serch_fild.dart';

class DispItemScreen extends StatefulWidget {
  static const String routeName='dispItemScreen';


  @override
  State<DispItemScreen> createState() => _DispItemScreenState();


}

class _DispItemScreenState extends State<DispItemScreen> {
List products=[];

@override
  void initState() {

    super.initState();

    ftchItem();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image(image: AssetImage('assets/images/route.png')),
              SizedBox(height: 5,),
                Row(
                    children: [
                  Expanded(child: SerchFild()),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,
                        size: 35,color: Color(0xff0a4b8a),))
                ]),
SizedBox(height: 10,),
Expanded(
  child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
  childAspectRatio: 3/4,  crossAxisSpacing: 5,  mainAxisSpacing: 5),
  itemBuilder: (context, index)
  { final product= products[index] as Map;

    return DispItem(imagePath: (product['images'].toString().substring(1,product['images'].toString().length-1)).toString(),//'assets/images/shose1.png',
    itemTitle: product['title'].toString().substring(0,product['title'].toString().length>20?20:product['title'].toString().length),
    itemDescr: product['description'].toString().substring(0,product['description'].toString().length>22?22:product['description'].toString().length),
    netPrice:'EGP ${product['price']}',
    price: '${product['price'] * (1+product['discountPercentage']/100)}'.toString().substring(0,4),
    review: product['rating'].toString(),
       );},
    itemCount:products.length,
  ),
)
//
            ],
          ),
        ),
      ),

    );
  }

  Future<void>ftchItem()async{
     final  url='https://dummyjson.com/products';
    final uri=Uri.parse(url);
    final response= await http.get(uri);


    if (response.statusCode==200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['products'] as List;
       products = result;

      setState(() {

      });
    }

  }


}
