import 'package:storeapp/helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories =
        // ignore: missing_required_param
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return categories;
  }
}
