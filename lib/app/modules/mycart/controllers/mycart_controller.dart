import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sisbar/app/data/factories/product_factory.dart';
import 'package:sisbar/app/data/models/product.dart';
import 'package:sisbar/app/widgets/confirm_dialog.dart';

import '../../../data/services/camera_service.dart';
import '../../../data/services/product_service.dart';

class MycartController extends GetxController {
  var cameraService = Get.find<CameraService>();
  var productService = Get.find<ProductService>();
  var selectedCartItem = Rx<CartItem?>(null);
  var cartItems = <CartItem>[].obs;
  var totalAmount = 0.0.obs;
  var isCameraActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      ProductFactory(addItem: addProduct).addProducts(10);
    }
  }

  void updatePrice(double newPrice, CartItem item) {
    item.product.price = newPrice;
    cartItems.refresh();
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
      cartItems.add(newItem);
      totalAmount.value += product.price;
    }
  }

  CartItem? findProductInCart(Product product) => cartItems.firstWhereOrNull(
        (element) => element.product.code == product.code,
      );

  void checkout() {
    totalAmount.value = 0.0;
    Get.snackbar('Compra realizada', 'Gracias por su compra');
  }

  void startRemoveSelectedItem() {
    confirmDialog(
      content: selectedCartItem.value!.product.name,
      title: '¿Quitamos este producto?',
      confirmAction: removeSelectedItem,
    );
  }

  void startClearCart() {
    confirmDialog(
      title: 'Cancelamos la venta',
      content: '¿Está seguro?',
      confirmAction: clearCart,
    );
  }

  void clearCart() {
    cartItems.clear();
    totalAmount.value = 0.0;
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity.value == 1) return;
    item.quantity -= 1;
    if (item.quantity.value == 0) {
      cartItems.remove(item);
      selectedCartItem.value = null;
    }
    totalAmount.value -= item.product.price;
    totalAmount.value = totalAmount.value.abs();
  }

  void incrementQuantity(CartItem item) {
    item.quantity += 1;
    if (item.quantity.value == 1) {
      cartItems.add(item);
    } else {
      totalAmount.value += item.product.price;
    }
  }

  void selectCartItem(CartItem item) {
    selectedCartItem.value = item;
  }

  void removeSelectedItem() {
    if (selectedCartItem.value != null) {
      cartItems.remove(selectedCartItem.value);
      totalAmount.value -= selectedCartItem.value!.product.price *
          selectedCartItem.value!.quantity.value;

      totalAmount.value = totalAmount.value.abs();
      selectedCartItem.value = null;
    }
  }

  void getProductByCamera() async {
    var code = await cameraService.scan();
    var product = productService.readProductByCode(code);
    print('mycode: $code');
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
