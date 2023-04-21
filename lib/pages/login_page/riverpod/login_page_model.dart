part of './login_page_states.dart';

class LoginPageModel {
  UserModel? user;

  LoginPageModel({
    this.user,
  });

  LoginPageModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    return data;
  }
}
