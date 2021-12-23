import 'package:shopping_cart/models/shop_item.dart';

class ShopRepository {
  Future<List<ShopItem>> getShopItems() async {
    return Future.value(
      [
        ShopItem(id: 1, name: 'phone', price: 99),
        ShopItem(id: 2, name: 'tv', price: 299),
        ShopItem(id: 3, name: 'hairdryer', price: 25),
      ],
    );
  }
}
