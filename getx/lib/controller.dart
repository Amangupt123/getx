// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/productmodel.dart';

class ProductController extends GetxController {
  List<Product> productData = [];

  List<Product> cartItem = List<Product>.empty().obs;

  addtoCart(Product item) {
    debugPrint("calling addToCart");
    cartItem.add(item);
  }

  removetocart(Product item) {
    debugPrint("calling removeToCart");
    cartItem.remove(item);
  }

  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;

  @override
  void onInit() {
    super.onInit();
    fatchProductData();
  }

  fatchProductData() async {
    await Future.delayed(Duration(seconds: 5));

    List<Product> serverResponse = [
      Product(
        id: 1,
        price: 349,
        productImage: 'assets/images/yellow.jpg',
        productName: 'T-Shirt',
      ),
      Product(
          id: 2,
          price: 799,
          productImage: 'assets/images/cake.jpg',
          productName: 'Cake'),
      Product(
        id: 3,
        price: 2499,
        productImage: 'assets/images/lahgachunni.png',
        productName: 'Lahanga',
      ),
    ];

    productData.assignAll(serverResponse);
    print(productData);
    update();
  }
}
