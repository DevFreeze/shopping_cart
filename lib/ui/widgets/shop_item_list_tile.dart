import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/cubits/shopping_cart/shopping_cart_cubit.dart';
import 'package:shopping_cart/models/shop_item.dart';

class ShopItemListTile extends StatelessWidget {
  final ShopItem item;

  const ShopItemListTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${item.name} - ${item.price}\$'),
      subtitle: Text(
        tr('addToCart'),
      ),
      onTap: () {
        BlocProvider.of<ShoppingCartCubit>(context).addItemToCart(item);
      },
    );
  }
}
