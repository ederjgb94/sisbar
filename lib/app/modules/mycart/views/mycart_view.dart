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
    var items = controller.items;
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
        child: Obx(() => Column(
              children: [
                for (var item in items)
                  ProductWidget(
                    cartItem: item,
                  ),
                SizedBox(height: 200),
              ],
            )),
      ),
      bottomNavigationBar: Obx(
        () => CartBottomBarWidget(
          total: controller.total.value,
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: const CartFloatingButtonsWidget(),
    );
  }
}
