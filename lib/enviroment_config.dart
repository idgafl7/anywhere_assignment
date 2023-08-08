import 'package:anywhere_realestate_assignment/app/utils/constants/strings.dart';

//environment config to grab environment variables set from our launch file
//or flutter run --dart-define={key}={value}
class EnvironmentConfig {
  static const environment = String.fromEnvironment(EnvStrings.environment);
  static const baseUrl = String.fromEnvironment(EnvStrings.baseURL);

  static const bool isSimpsons = environment == EnvStrings.simpsonsEnv;
  static const bool isTheWire = environment == EnvStrings.theWireEnv;
}
