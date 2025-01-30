import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/product.dart';

class MycartController extends GetxController {
  List<Product> products = <Product>[].obs;

  void testProduct() {
    products.add(
      Product(
        code: '1',
        name: 'Aceite Capilla 400ml',
        price: 20.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '2',
        name: 'Cola Cola 600ml',
        price: 21.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Sabritas Bolzaza 68g',
        price: 25.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Pepsi 600ml',
        price: 16.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Pepsi 1.5l',
        price: 22.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );

    products.add(
      Product(
        code: '3',
        name: 'Pepsi 2.5l',
        price: 32.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Coca Cola 3l',
        price: 50.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Heladito',
        price: 16.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Queso 1/4',
        price: 19.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Queso 1/2',
        price: 31.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
    products.add(
      Product(
        code: '3',
        name: 'Queso Entero',
        price: 70.0,
        codeType: CodeType.UPC,
        imageUrl: '',
        category: '',
      ),
    );
  }

  obtenerTotal() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

  @override
  void onInit() {
    testProduct();
    super.onInit();
  }
}
