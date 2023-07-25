import 'package:e_commerce/modules/update_products.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductInfo extends StatelessWidget {
   ProductInfo({required this.price,required this.id,required this.category,required this.rating,required this.count,required this.title,required this.image,required this.description,super.key});
final int id;
var price;
final String title;
final String image;
final String description;
final String category;
var rating;
final int count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading:BackButton(color: Colors.black) ,backgroundColor: Colors.white,elevation: 0,title:const Text("Info",style: TextStyle(color: Colors.black,fontSize: 20,),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Image(image: NetworkImage(image),height: 300,width: 400,),
          const SizedBox(height: 25,),
          Center(child: Text(title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey),)),
          const SizedBox(height: 25,),
          Center(child: Text('EGP $price',style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          const SizedBox(height: 25,),
          Center(child: Text(description,style: const TextStyle(fontSize: 15),)),
          const SizedBox(height: 25,),
          Row(
            children: [
              RatingBar.builder(itemSize: 30,
   initialRating: rating,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) => Icon(
     Icons.star,
     color: Colors.amber,
   ),
   onRatingUpdate: (rating) {
   },
),
Spacer(),
    Text('$count' ' Verified ratings',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),)
            ],
          ),
          const SizedBox(height: 25,),
          CustomButton(text: 'Updating Product',onTap: () {
            Navigator.push(context,MaterialPageRoute(
                                          builder: (context) =>UpdatingForm(id: id, price: price, category: category, title: title, image: image, description: description)));
          },)
        ],),
      ),
    );
  }
}