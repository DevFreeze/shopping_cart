import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/cubits/shop/shop_cubit.dart';
import 'package:shopping_cart/models/shop_item.dart';
import 'package:shopping_cart/ui/widgets/shop_item_list_tile.dart';
import 'package:shopping_cart/ui/widgets/shopping_cart_icon.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, shopState) {
        if (shopState is ShopLoadingState) {
          return const _LoadingScreen();
        } else if (shopState is ShopSuccessState) {
          return _ShopScreen(shopItems: shopState.shopItems);
        }

        return const _ErrorScreen();
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ShopScreen extends StatelessWidget {
  final List<ShopItem> shopItems;

  const _ShopScreen({
    Key? key,
    required this.shopItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('electronicShop'),
          style: const TextStyle(color: Colors.black),
        ),
        actions: const [
          ShoppingCartIcon(),
        ],
      ),
      body: ListView(
        children: [
          ...shopItems.map(
            (item) => ShopItemListTile(
              item: item,
            ),
          )
        ],
      ),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(tr('errorMessage')),
      ),
    );
  }
}
