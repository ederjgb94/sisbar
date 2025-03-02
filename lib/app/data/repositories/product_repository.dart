import 'package:sisbar/app/data/factories/product_factory.dart';

import '../models/product.dart';

class ProductRepository {
  Product getProduct(String code) {
    return ProductFactory().create();
  }
}
