import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/services/get_all_products.dart';
import 'package:e_commerce/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: 
      AppBar(backgroundColor: Colors.white,elevation: 0,title:const Text("Trendee",style: TextStyle(color: Colors.black,fontSize: 16,),),centerTitle: true,actions: [IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart,color: Colors.black,) )],),
      body: FutureBuilder<List<ProductsModel>>(
        future: AllProductsService().GetAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductsModel>products = snapshot.data!;
  return Padding(
          padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
          child: GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 70
  ),
  itemCount: products.length,
  clipBehavior: Clip.none,
  itemBuilder: (BuildContext context, int index) {
    return CustomCard(products: products[index],) ;
  },
          ),
        );
}else {
  return const Center(child: CircularProgressIndicator());
}
        },)
    ); 
  }
}