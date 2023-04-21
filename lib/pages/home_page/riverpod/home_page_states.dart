import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app_test/pages/login_page/riverpod/login_page_states.dart';
import 'package:market_app_test/services/dio_service.dart';

import '../../../data/models/models.dart';

part './home_page_events.dart';
part './home_page_model.dart';

final homePageProvider = StateNotifierProvider<HomePageEvents, HomePageModel>((ref) => HomePageEvents(ref));
