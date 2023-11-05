library network;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_api_service.dart';

export 'base_api_service.dart';
export 'dio_http_client.dart';
export 'http_method.dart';

final baseApiServiceProvider = Provider<BaseApiService>((ref) {
  return BaseApiService();
});