import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/shop/shop_cubit.dart';
import 'cubits/shopping_cart/shopping_cart_cubit.dart';
import 'services.dart';
import 'ui/theme.dart';
import 'ui/screens/shop_screen.dart';
import 'utils/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupServices();
  await services.allReady();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      supportedLocales: [
        ...supportedLanguages.map((local) => Locale(local)),
      ],
      path: assetsPath,
      fallbackLocale: const Locale(fallbackLanguage),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()..initializeShop(),
        ),
        BlocProvider(
          create: (context) => ShoppingCartCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping cart',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: themeData,
        home: const ShopScreen(),
      ),
    );
  }
}
