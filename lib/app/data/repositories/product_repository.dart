import 'package:sisbar/app/data/factories/product_factory.dart';

import '../models/product.dart';

class ProductRepository {
  Product getProduct(String code) {
    print('Reading product by code');
    return ProductFactory().create();
  }
}
