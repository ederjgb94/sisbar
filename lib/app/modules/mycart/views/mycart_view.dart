import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mycart_controller.dart';
import '../widgets/cart_bottom_bar_widget.dart';
import '../widgets/cart_floating_buttons_widget.dart';
import '../widgets/cart_header_widget.dart';
import '../widgets/product_widget.dart';

class MycartView extends GetView<MycartController> {
  const MycartView({super.key});

  @override
  Widget build(BuildContext context) {
    var products = controller.products;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        titleSpacing: 10,
        title: const CartHeaderWidget(),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            for (var product in products)
              ProductWidget(
                code: product.code,
                name: product.name,
                price: product.price,
                quantity: Random().nextInt(3) + 1,
              ),
            SizedBox(height: 200),
          ],
        ),
      ),
      bottomNavigationBar:
          CartBottomBarWidget(total: controller.obtenerTotal()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CartFloatingButtonsWidget(),
    );
  }
}
