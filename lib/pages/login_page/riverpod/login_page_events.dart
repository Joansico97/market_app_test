part of './login_page_states.dart';

class LoginPageEvents extends StateNotifier<LoginPageModel> {
  LoginPageEvents(this.ref) : super(LoginPageModel.fromJson({}));

  final Ref ref;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioService.postDataLogin(
        url: 'https://dummyjson.com/auth/login',
        userName: email,
        password: password,
      );
      state.user = UserModel.fromJson(response);
      debugPrint('${state.user!.token}');
    } catch (e) {
      debugPrint('An error has occurred while bringing the information');
      rethrow;
    }
  }
}
