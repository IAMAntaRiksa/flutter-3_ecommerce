import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/viewmodels/bloc_observer.dart';
import 'package:ecommerce/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';

Future<void> main() async {
  /// Setup injector
  setupLocator();

  /// Initialize screenutil
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());

  Bloc.observer = AppBlocObserver();
}
