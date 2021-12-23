import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/models/shop_item.dart';
import 'package:shopping_cart/repositories/shop_repository.dart';

import '../../services.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(const ShopSuccessState(shopItems: []));

  final _shopRepository = services<ShopRepository>();

  Future<void> initializeShop() async {
    emit(ShopLoadingState());

    final _shopItems = await _shopRepository.getShopItems();

    emit(ShopSuccessState(shopItems: _shopItems));
  }
}
