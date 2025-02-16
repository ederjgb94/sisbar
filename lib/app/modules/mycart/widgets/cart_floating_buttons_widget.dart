import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/mycart_controller.dart';
import 'price_change_dialog.dart';

class CartFloatingButtonsWidget extends GetView<MycartController> {
  const CartFloatingButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 10,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                CartFloatingButton(
                  icon: Icons.delete,
                  color: Colors.grey[600],
                  onPressed: () {
                    controller.removeSelectedItem();
                  },
                ),
                CartFloatingButton(
                  icon: Icons.remove,
                  color: Colors.teal[500],
                  onPressed: () {
                    controller.selectedCarItemDecrement();
                  },
                ),
                CartFloatingButton(
                  icon: Icons.add,
                  color: Colors.teal[500],
                  onPressed: () {
                    controller.selectedCarItemIncrement();
                  },
                ),
                CartFloatingButton(
                  icon: Icons.edit,
                  color: Colors.teal[500],
                  onPressed: () async {
                    if (controller.selectedCartItem.value != null) {
                      var item = controller.selectedCartItem.value!;
                      var price = await editPriceDialog(
                        name: item.product.name,
                        price: item.product.price,
                      );
                      controller.updatePrice(price, item);
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                CartFloatingButton(
                  icon: Icons.search,
                  color: Colors.indigo[400],
                  onPressed: () {},
                ),
                CartFloatingButton(
                  icon: Icons.camera_alt,
                  color: Colors.indigo[400],
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartFloatingButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Function onPressed;

  const CartFloatingButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: color,
        onPressed: () {
          onPressed();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
