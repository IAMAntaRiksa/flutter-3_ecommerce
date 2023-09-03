import 'package:ecommerce/ui/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
  initialLocation: HomeScreen.routeName,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    // GoRoute(
    //   path: "${DetailProdcutScreen.routeName}/:productId",
    //   builder: (context, state) => DetailProdcutScreen(
    //     id: int.parse(state.pathParameters['productId']!),
    //   ),
    // ),
    // GoRoute(
    //   path: CartScreen.routeName,
    //   builder: (context, state) => const CartScreen(),
    // ),
    // GoRoute(
    //   path: CheckOutScreen.routeName,
    //   builder: (context, state) => const CheckOutScreen(),
    //   redirect: (context, state) async {
    //     final isLogin = await setToken.isLogin();
    //     if (isLogin) {
    //       return null;
    //     } else {
    //       return AuthScreen.routeName;
    //     }
    //   },
    // ),
    // GoRoute(
    //   path: AccountScreen.routeName,
    //   builder: (context, state) => const AccountScreen(),
    //   redirect: (context, state) async {
    //     final isLogin = await setToken.isLogin();
    //     if (isLogin) {
    //       return null;
    //     } else {
    //       return AuthScreen.routeName;
    //     }
    //   },
    // ),
  ],
);
