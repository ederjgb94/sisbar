//crea un dialogo para cambiar el precio de un producto

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Future<double> editPriceDialog({
  required String name,
  required double price,
}) async {
  TextEditingController priceController = TextEditingController(
    text: price.toString(),
  );

  submitPrice() => Get.back(
        result: double.parse(
          priceController.text.replaceAll(',', ''),
        ),
      );

  return await Get.dialog(
    UnconstrainedBox(
      child: SizedBox(
        width: 400,
        child: AlertDialog(
          title: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                autofocus: true,
                controller: priceController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isEmpty) {
                    priceController.text = '0.00';
                  }
                },
                onSubmitted: (value) {
                  submitPrice();
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _CurrencyInputFormatter(),
                ],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.delete, size: 32),
                    onPressed: () {
                      priceController.text = '0.00';
                    },
                  ),
                  helperText: 'Ingrese monto',
                  prefixText: '\$ ',
                  label: const Text('Precio Unitario'),
                  prefixStyle: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[300],
              ),
              onPressed: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 32,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[600],
              ),
              onPressed: () {
                submitPrice();
              },
              child: Icon(
                Icons.attach_money,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Convierte el texto a un número (en centavos)
    final value = int.parse(newValue.text);
    // Convierte a formato decimal
    final actualValue = value / 100;

    // Formatea el número con dos decimales
    final formatter = NumberFormat("#,##0.00", "en_US");
    final newText = formatter.format(actualValue);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
