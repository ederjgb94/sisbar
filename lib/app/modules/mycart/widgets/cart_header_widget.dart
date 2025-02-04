import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../controllers/mycart_controller.dart';

class CartHeaderWidget extends GetView<MycartController> {
  const CartHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Nueva venta',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.black,
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: Container()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[400],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 0,
              ),
              onPressed: () {
                controller.addTestProduct();
              },
              child: Icon(Symbols.settings, color: Colors.white, size: 28),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: 60,
              child: const Text(
                'CA',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const Text(
              'PRODUCTO',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(child: Container()),
            SizedBox(
              width: 100,
              child: const Text(
                'PRECIO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
