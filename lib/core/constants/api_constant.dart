import 'package:clean_architecture/config/envs/config.dart';

class ApiConstants {
  static String get baseUrl => Config.envConfig.baseUrl;
  static String get apiKey => Config.envConfig.apiKey;
}
