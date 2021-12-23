part of 'shopping_cart_cubit.dart';

class ShoppingCartState extends Equatable {
  final List<ShopItem> cartItems;

  const ShoppingCartState({required this.cartItems});

  ShoppingCartState copyWith({
    List<ShopItem>? cartItems,
  }) {
    return ShoppingCartState(cartItems: cartItems ?? this.cartItems);
  }

  @override
  List<Object> get props => <Object>[cartItems];
}
