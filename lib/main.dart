import 'package:clean_architecture_riverpod/core/local_storage/share_preferences.dart';
import 'package:clean_architecture_riverpod/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import 'core/network/dio_http_client.dart';

void main() async {
  await GetStorage.init();
  await SharedPref.init();
  BaseHttpClient.init();
  runApp(const ProviderScope(child: MyApp()));
}




