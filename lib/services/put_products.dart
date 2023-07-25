import 'package:e_commerce/API/api.dart';
import 'package:e_commerce/models/products_model.dart';

class UpdateSevices {
  final String title;
  var price;
  final String description;
  final String image;
  final String category;
  UpdateSevices({required this.title,required this.category,required this.description,required this.image,required this.price,});
  Future<ProductsModel> putProducts({required String id})async{
    Map<String,dynamic> data = await API().putProducts(url: 'https://fakestoreapi.com/products/$id',body: {
      'title' : title,
      'price' : price,
      'category' : category,
      'description' : description,
      'image' :image,
    },);
    return ProductsModel.fromJson(data);
  }
}