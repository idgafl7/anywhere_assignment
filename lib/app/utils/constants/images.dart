import 'package:anywhere_realestate_assignment/enviroment_config.dart';

//class to hold all the image strings used in the app
class Images {
  //use different place holder based on the app flavor
  static final String placeholder = EnvironmentConfig.isSimpsons
      ? 'assets/images/simpsons_logo.png'
      : 'assets/images/wire_logo.png';
}
