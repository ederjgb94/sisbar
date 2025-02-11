import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mycart_controller.dart';

class CartBottomBarWidget extends GetView<MycartController> {
  final double total;

  const CartBottomBarWidget({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(80),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                  elevation: 0,
                  padding: const EdgeInsets.all(15),
                ),
                child: Icon(
                  Icons.close,
                  size: 32,
                  color: Colors.grey[100],
                ),
              ),
              Column(
                children: [
                  Text(
                    '\$${controller.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'TOTAL',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[600],
                  elevation: 0,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.attach_money_outlined,
                  color: Colors.grey[900],
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
