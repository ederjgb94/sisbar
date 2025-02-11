import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CartFloatingButtonsWidget extends StatelessWidget {
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
                SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.teal[500],
                    onPressed: () {},
                    child: Icon(
                      Symbols.remove,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.teal[500],
                    onPressed: () {},
                    child: Icon(
                      Symbols.add,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.indigo[400],
                    onPressed: () {},
                    child: Icon(
                      Symbols.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.indigo[400],
                    onPressed: () {},
                    child: Icon(
                      Symbols.camera_alt,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
