import 'package:e_commerce/modules/home_page.dart';
import 'package:e_commerce/services/put_products.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/widgets/toast.dart';
import 'package:flutter/material.dart';

class UpdatingForm extends StatelessWidget {
  UpdatingForm({required this.id,required this.price,required this.category,required this.title,required this.image,required this.description,super.key});
final int id;
var price;
final String title;
final String image;
final String description;
final String category;
  String? productName,descriptionText,imageURL; 
  var priceNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,appBar: AppBar(leading:BackButton(color: Colors.amber) ,backgroundColor: Colors.white,elevation: 0,title:const Text("Updating",style: TextStyle(color: Colors.amber,fontSize: 20,),),centerTitle: true,),
    body: ListView(
      children: [
        const SizedBox(height: 120,),
      CustomTextField(
        labelText: 'Product Name',
        onChanged: (data) {
          productName=data;
        },
      ),
      CustomTextField(
        inputType: TextInputType.phone,
        labelText: 'Price',
        onChanged: (data) {
          priceNo=data;
        },
      ),
      CustomTextField(
        labelText: 'Description',
        onChanged: (data) {
          descriptionText=data;
        },
      ),
      CustomTextField(
        labelText: 'Image URL',
        onChanged: (data) {
          imageURL=data;
        },
      ),
      const SizedBox(height: 20,),
      CustomButton(text: 'Update',onTap:(){
        try {
  UpdateSevices(title: productName==null? title:productName!, category: category, description: descriptionText==null? description :descriptionText!, image: imageURL==null? image : imageURL!, price: priceNo==null? price : priceNo!);
  Navigator.push(context,MaterialPageRoute(
                                    builder: (context) =>Home()));
                                    showToast("Updated successfully");
} catch (e) {
  print(e.toString());
}
} ,),
    ],),
    );
  }
}