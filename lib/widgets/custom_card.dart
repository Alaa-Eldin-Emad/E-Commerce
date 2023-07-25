import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/modules/products_info.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.products,
    super.key});
  ProductsModel products;
  final ValueNotifier favorite = ValueNotifier(0);
  Color favoriteColor =Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(
                                          builder: (context) => ProductInfo(id: products.id,category: products.category,price: products.price,image: products.image,title: products.title,description: products.description,rating:products.rating.rate,count: products.rating.count,)),);
          },
          child: Card(elevation: 5,clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Text(products.title.substring(0,18),style: const TextStyle( color: Colors.grey,fontSize: 16
              ),),
              Row(
                children: [
                Text(r"$" '${products.price}'),
                const Spacer(),
                ValueListenableBuilder(
                  valueListenable: favorite,
                  builder: (context, snapshot, child) {
                    return
                IconButton(icon: Icon(Icons.favorite,color: favoriteColor,),onPressed: (){if (favorite.value==0) {favorite.value=1;favoriteColor =Colors.red;}else {favorite.value=0; favoriteColor =Colors.grey;}
                  });
                  }
                ),
                ]
              ,)
                    ]),
            ),),
        ),

          Positioned(left: 90, top: -60,bottom: 80, child: Image(image: NetworkImage(products.image),height: 150,width: 70,),),
      ],
      
    );
  }
}