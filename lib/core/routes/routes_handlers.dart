part of './router.dart';

Widget _homePageBuilder(BuildContext context, GoRouterState state) {
  return const HomePage();
}

Widget _loginPage(BuildContext context, GoRouterState state) {
  return const LoginPage();
}

Widget _detailPage(BuildContext context, GoRouterState state) {
  final data = state.extra as Map<String, dynamic>;
  return DetailPage(
    index: data['index'],
    product: data['product'],
  );
}

Widget _errorBuilder(BuildContext context, GoRouterState state) {
  return Container();
}
