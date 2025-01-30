import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
      onTap: () {
        final TextEditingController priceController =
            TextEditingController(text: '\$${price.toStringAsFixed(2)}');

        Get.defaultDialog(
          title: name,
          titleStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.normal,
          ),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: priceController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\$?\d*\.?\d{0,2}')),
                      ],
                      onChanged: (value) {
                        if (value.isEmpty) return;

                        // Remove existing dollar signs and spaces
                        String newValue =
                            value.replaceAll(RegExp(r'[\$\s]'), '');

                        // Format with dollar sign
                        if (!newValue.startsWith('\$')) {
                          priceController.value = TextEditingValue(
                            text: '\$$newValue',
                            selection: TextSelection.fromPosition(
                              TextPosition(offset: newValue.length + 1),
                            ),
                          );
                        }
                      },
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.edit),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[300],
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(
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
              '\$${(price * quantity).toStringAsFixed(2)}',
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
