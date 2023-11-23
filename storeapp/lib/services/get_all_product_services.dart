import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getallproduct() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productlist;
  }
}
