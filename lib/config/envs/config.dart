import 'package:clean_architecture/config/envs/env_config.dart';
import 'package:clean_architecture/config/envs/environment.dart';

class Config {
  static late EnvConfig _envConfig;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.development:
        _envConfig = DevConfig();
        break;
      case Environment.staging:
        _envConfig = StagingConfig();
        break;
      case Environment.production:
        _envConfig = ProdConfig();
        break;
    }
  }

  static EnvConfig get envConfig => _envConfig;
}
