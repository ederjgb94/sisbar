import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String code;
  final String name;
  final double price;
  final int quantity;
  const ProductWidget({
    super.key,
    required this.code,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 5,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              '$quantity',
              style: const TextStyle(fontSize: 23),
            ),
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 23),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              (price * quantity).toStringAsFixed(2),
              style: const TextStyle(fontSize: 23),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Text(
          '\$$price',
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
