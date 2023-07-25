import 'package:e_commerce/API/api.dart';
import 'package:e_commerce/models/products_model.dart';

class CategoryService {
  Future <List<ProductsModel>> getCategory({required String categoryName})async
  {
    List<dynamic>data = await API().getData(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductsModel> choosedCategory =[];
    for(int i=0; i<data.length;i++){
      choosedCategory.add(ProductsModel.fromJson(data[i]));
    }
    return choosedCategory;
  }
}