import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sisbar/app/data/factories/product_factory.dart';
import 'package:sisbar/app/data/models/product.dart';

class MycartController extends GetxController {
  var total = 0.0.obs;
  var items = <CartItem>[].obs;
  Rx<CartItem?> selectedCartItem = Rx<CartItem?>(null);

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      ProductFactory(addItem: addProduct).addProducts(10);
    }
  }

  void updatePrice(double newPrice, CartItem item) {
    item.product.price = newPrice;
    items.refresh();
  }

  void selectedCarItemIncrement() {
    if (selectedCartItem.value != null) {
      incrementQuantity(selectedCartItem.value!);
    }
  }

  void selectedCarItemDecrement() {
    if (selectedCartItem.value != null) {
      decrementQuantity(selectedCartItem.value!);
    }
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
    if (item.quantity.value == 1) return;
    item.quantity -= 1;
    if (item.quantity.value == 0) {
      items.remove(item);
      selectedCartItem.value = null;
    }
    total.value -= item.product.price;
    total.value = total.value.abs();
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

  void removeSelectedItem() {
    if (selectedCartItem.value != null) {
      items.remove(selectedCartItem.value);
      total.value -= selectedCartItem.value!.product.price *
          selectedCartItem.value!.quantity.value;

      total.value = total.value.abs();
      selectedCartItem.value = null;
    }
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
