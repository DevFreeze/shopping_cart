part of 'shop_cubit.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => <Object>[];
}

class ShopLoadingState extends ShopState {}

class ShopSuccessState extends ShopState {
  final List<ShopItem> shopItems;

  const ShopSuccessState({required this.shopItems});

  @override
  List<Object> get props => [shopItems];
}

class ShopErrorState extends ShopState {}
