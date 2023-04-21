part of './home_page_states.dart';

class HomePageEvents extends StateNotifier<HomePageModel> {
  HomePageEvents(this.ref) : super(HomePageModel.fromJson({}));

  final Ref ref;

  Future<dynamic> getAllProducts() async {
    state = HomePageModel.fromJson(state.toJson());
    String auth = ref.watch(loginPageProvider).user!.token!;
    try {
      final response = await dioService.getData(
        url: 'https://dummyjson.com/auth/products',
        auth: auth,
      );
      state.productsList = List<ProductModel>.from(response['products'].map((json) => ProductModel.fromJson(json)));
      state = HomePageModel.fromJson(state.toJson());
    } catch (e) {
      debugPrint('An error has occurred while bringing the information');
      rethrow;
    }
  }

  void changeSearch({
    required String text,
  }) {
    state = HomePageModel.fromJson(state.toJson());
    state.productSearchList = [];
    for (var element in state.productsList!) {
      if (element.title!.contains(text)) {
        state.productSearchList!.add(element);
      }
    }
    state = HomePageModel.fromJson(state.toJson());
  }
}
