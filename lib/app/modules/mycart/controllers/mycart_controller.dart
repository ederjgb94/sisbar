import 'package:get/get.dart';
import 'package:sisbar/app/data/models/product.dart';

class MycartController extends GetxController {
  var total = 0.0.obs;
  var items = <CartItem>[].obs;
  Rx<CartItem?> selectedCartItem = Rx<CartItem?>(null);

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
    CartItem? existingItem = findProductInCart(product);

    if (existingItem != null) {
      incrementQuantity(existingItem);
    } else {
      var newItem = CartItem(product);
      items.add(newItem);
      total.value += product.price;
    }
  }

  CartItem? findProductInCart(Product product) => items.firstWhereOrNull(
        (element) => element.product.code == product.code,
      );

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

  void selectCartItem(CartItem item) {
    selectedCartItem.value = item;
  }
}

class CartItem {
  Product product;
  var quantity = 1.obs;
  var isSelected = false.obs;

  CartItem(
    this.product,
  );
}
