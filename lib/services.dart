import 'package:get_it/get_it.dart';
import 'package:shopping_cart/repositories/shop_repository.dart';

final services = GetIt.instance;

void setupServices() {
  services.registerLazySingleton<ShopRepository>(() => ShopRepository());
}
