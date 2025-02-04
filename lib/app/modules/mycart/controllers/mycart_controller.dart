import 'package:get/get.dart';
import 'package:sisbar/app/data/models/product.dart';

class MycartController extends GetxController {
  var total = 0.0.obs;
  var items = <CartItem>[].obs;

  void findProductByCode(String code) {}

  void addTestProduct() {
    var product = Product.factory().create();
    addProduct(
      product.code,
      product.name,
      product.price,
      product.imageUrl,
      product.category,
      product.codeType,
    );
  }

  void addProduct(
    String code,
    String name,
    double price,
    String imageUrl,
    String category,
    CodeType codeType,
  ) {
    var product = Product(
      code: code,
      name: name,
      price: price,
      imageUrl: imageUrl,
      category: category,
      codeType: codeType,
    );

    // Buscar si el producto ya existe en el carrito
    CartItem? existingItem = items.firstWhereOrNull(
      (element) => element.product.code == product.code,
    );

    if (existingItem != null) {
      incrementQuantity(existingItem);
    } else {
      var newItem = CartItem(product);
      items.add(newItem);
      total.value += product.price;
    }
  }

  void checkout() {
    total.value = 0.0;
    Get.snackbar('Compra realizada', 'Gracias por su compra');
  }

  void clearCart() {
    items.clear();
    total.value = 0.0;
  }

  void decrementQuantity(CartItem item) {
    item.quantity -= 1;
    if (item.quantity.value == 0) {
      items.remove(item);
    } else {
      total.value -= item.product.price;
    }
  }

  void incrementQuantity(CartItem item) {
    item.quantity += 1;
    if (item.quantity.value == 1) {
      items.add(item);
    } else {
      total.value += item.product.price;
    }
  }
}

class CartItem {
  Product product;
  var quantity = 1.obs;

  CartItem(
    this.product,
  );
}
