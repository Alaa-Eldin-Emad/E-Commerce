import 'package:e_commerce/API/api.dart';

class AllCategoriesService{

  Future <List<dynamic>> getAllCategories() async
  {  
    List<dynamic> data =await API().getData(url:'https://fakestoreapi.com/products/categories');
    return data;
}
}