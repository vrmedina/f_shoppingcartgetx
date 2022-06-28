import 'package:f_shopping_app/domain/product.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final _lista = RxList(
      <Product>[Product(0, "Toy Carro", 10), Product(1, "Toy House", 20)]).obs;

  RxList<Product> get getList => _lista.value;

  RxInt getTotal() {
    var total = 0.obs;
    var lst = _lista.value;
    for (var i = 0; i < lst.length; i++) {
      total = total + (lst[i].price.toInt() * lst[i].quantity.toInt());
    }
    return total;
  }

  void increment(Product product) {
    var lst = _lista.value;
    lst[product.id].quantity = product.quantity + 1;
    lst.refresh();
    getTotal();
  }

  void decrement(Product product) {
    var lst = _lista.value;
    if (lst[product.id].quantity > 0) {
      lst[product.id].quantity = product.quantity - 1;
    }
    lst.refresh();
    getTotal();
  }
}
