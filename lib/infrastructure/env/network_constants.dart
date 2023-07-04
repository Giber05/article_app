import 'package:article_app/infrastructure/env/env.dart';

class NetworkConstants {
  static String apiBaseUrl = "${ENV.current.baseURL}/api/v1";
}
