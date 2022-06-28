import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controller.dart';
import '../../domain/product.dart';
import '../Widgets/banner.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int counter = 0;

  List<Product> entries = <Product>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [CustomBanner(50), customAppBar()],
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: c.getList.length,
                  itemBuilder: (context, index) {
                    return _row(c.getList[index], index);
                  })),
            )
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    final Controller c = Get.find();
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text(product.price.toString()),
        Column(
          children: [
            IconButton(
                onPressed: () => c.increment(product),
                icon: const Icon(Icons.arrow_upward)),
            IconButton(
                onPressed: (() => c.decrement(product)),
                icon: const Icon(Icons.arrow_downward))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString()),
            ),
          ],
        )
      ]),
    );
  }
}
