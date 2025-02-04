import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/mycart_controller.dart';

class ProductWidget extends GetView<MycartController> {
  final CartItem cartItem;

  const ProductWidget({
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.defaultDialog(
          title: cartItem.product.name,
          titleStyle:
              const TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
          content: Obx(
            () => Column(
              children: [
                Text(
                  'Precio',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: TextEditingController(
                            text: '\$${cartItem.product.price}'),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\$?\d*\.?\d{0,2}')),
                        ],
                        onChanged: (value) {
                          if (value.isEmpty) return;
                          String newValue =
                              value.replaceAll(RegExp(r'[\$\s]'), '');
                          if (!newValue.startsWith('\$')) {
                            newValue = '\$$newValue';
                          }
                          cartItem.product.price = double.parse(newValue);
                        },
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.edit),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${(cartItem.product.price * cartItem.quantity.value).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                      onPressed: () => controller.decrementQuantity(cartItem),
                      icon: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '${cartItem.quantity}',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20),
                    IconButton.filled(
                      onPressed: () => controller.incrementQuantity(cartItem),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[300],
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      title: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: Text(
                '${cartItem.quantity}',
                style: const TextStyle(fontSize: 23),
              ),
            ),
            Expanded(
              child: Text(
                cartItem.product.name,
                style: const TextStyle(fontSize: 23),
              ),
            ),
            SizedBox(
              width: 100,
              child: Text(
                '\$${(cartItem.product.price * cartItem.quantity.value).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 23),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Text(
          '\$${cartItem.product.price}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
