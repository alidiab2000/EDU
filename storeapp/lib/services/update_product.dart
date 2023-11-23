// ignore_for_file: avoid_print

import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateproduct(
      {required String title,
      required String price,
      required String image,
      required String description,
      required String category,
      required int id}) async {
    print("Your id is $id");
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });
    print(data);
    return ProductModel.fromJson(data);
  }
}
