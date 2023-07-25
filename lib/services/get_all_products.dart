import 'package:e_commerce/API/api.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:http/http.dart';

class AllProductsService{
  Future <List<ProductsModel>> GetAllProducts ()async{
    List<dynamic> data = await API().getData(url: 'https://fakestoreapi.com/products');
    List<ProductsModel> productList =[];
    for(int i=0; i<data.length; i++){
      productList.add(ProductsModel.fromJson(data[i]));
    }
    return productList;
  }
  
}