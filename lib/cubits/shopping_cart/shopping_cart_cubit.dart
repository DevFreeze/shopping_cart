import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/models/shop_item.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(const ShoppingCartState(cartItems: []));

  void addItemToCart(ShopItem item) {
    final _cartItems = <ShopItem>[...state.cartItems, item];
    emit(state.copyWith(cartItems: _cartItems));
  }
}
