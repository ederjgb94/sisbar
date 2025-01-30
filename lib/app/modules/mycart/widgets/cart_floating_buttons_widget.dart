import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CartFloatingButtonsWidget extends StatelessWidget {
  const CartFloatingButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.blueGrey[400],
          onPressed: () {},
          child: Icon(Symbols.search, color: Colors.white, size: 40),
        ),
        SizedBox(width: 40),
        FloatingActionButton(
          backgroundColor: Colors.blueGrey[400],
          onPressed: () {},
          child: Icon(Symbols.camera_alt, size: 40, color: Colors.white),
        ),
      ],
    );
  }
}
