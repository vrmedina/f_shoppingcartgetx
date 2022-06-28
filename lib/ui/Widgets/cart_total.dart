import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/controller.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Expanded(
        child: Center(
      child: Obx(
        (() => Text('${c.getTotal()}',
            style: const TextStyle(
                fontSize: 25.0,
                color: Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400))),
      ),
    ));
  }
}
