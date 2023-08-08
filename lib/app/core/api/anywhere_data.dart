import 'package:anywhere_realestate_assignment/app/core/api/anywhere_api.dart';
import 'package:anywhere_realestate_assignment/app/core/api/rest_client.dart';
import 'package:anywhere_realestate_assignment/enviroment_config.dart';

import 'mock_api.dart';

//class to provide data sources to the app
abstract class AnywhereData {
  AnywhereApi get anywhereApi;
  AnywhereApi get mockAnywhereApi;
  // cache helper or any other data sources could be added here
}

class AnywhereDataImpl implements AnywhereData {
  AnywhereDataImpl._internal() {
    _anywhereApi =
        AnywhereApiImpl(client: AnywhereRestClient(EnvironmentConfig.baseUrl));
    _mockAnywhereApi = MockAnywhereApi();
  }

  static final AnywhereDataImpl _singleton = AnywhereDataImpl._internal();
  static AnywhereDataImpl get instance => _singleton;
  late AnywhereApi _anywhereApi;
  late AnywhereApi _mockAnywhereApi;

  @override
  AnywhereApi get anywhereApi => _anywhereApi;
  @override
  AnywhereApi get mockAnywhereApi => _mockAnywhereApi;
}
