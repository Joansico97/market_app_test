import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app_test/data/models/models.dart';
import 'package:market_app_test/services/dio_service.dart';

part './login_page_events.dart';
part './login_page_model.dart';

final loginPageProvider = StateNotifierProvider<LoginPageEvents, LoginPageModel>((ref) => LoginPageEvents(ref));
