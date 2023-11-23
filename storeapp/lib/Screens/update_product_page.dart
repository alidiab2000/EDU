import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widegts/custom_button.dart';
import 'package:storeapp/widegts/custom_text_field.dart';

// ignore: must_be_immutable
class UptadeProductPage extends StatefulWidget {
  const UptadeProductPage({super.key});
  static String id = "updateproduct";

  @override
  State<UptadeProductPage> createState() => _UptadeProductPageState();
}

class _UptadeProductPageState extends State<UptadeProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hintText: "product name",
                  onchanged: (value) {
                    productName = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Price",
                  inputType: TextInputType.number,
                  onchanged: (value) {
                    price = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Image",
                  onchanged: (value) {
                    image = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Description",
                  onchanged: (value) {
                    desc = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonName: "Update ",
                  ontab: () async {
                    isLoading = true;
                   
                    try {
                      await updateproduct(product);
                      // ignore: avoid_print
                      print("Code Done....");
                    } on Exception catch (e) {
                      // ignore: avoid_print
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateproduct(ProductModel product) async {
    await UpdateProduct().updateproduct(
        title: productName != null ? productName! : product.title,
        price: price != null ? price! : product.price.toString(),
        image: image != null ? image! : product.image,
        description: desc != null ? desc! : product.descripion,
        id: product.id,
        category: product.category);
  }
}
