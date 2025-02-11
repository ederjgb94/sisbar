import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        titleSpacing: 10,
        scrolledUnderElevation: 0,
        title: const CartHeaderWidget(),
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade50,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade50,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        //cambia las fisicas del scroll
        // physics: ClampingScrollPhysics(),

        child: Obx(() => Column(
              children: [
                for (var item in items)
                  ProductWidget(
                    cartItem: item,
                  ),
                SizedBox(height: 255),
              ],
            )),
      ),
      bottomNavigationBar: Obx(
        () => CartBottomBarWidget(
          total: controller.total.value,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CartFloatingButtonsWidget(),
    );
  }
}
