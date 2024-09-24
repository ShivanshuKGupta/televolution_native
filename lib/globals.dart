import 'appwrite/appwrite.dart';
import 'appwrite/mustache.dart';
import 'appwrite/realtime_stream.dart';
import 'data/models/app_strings_model.dart';
import 'data/models/passenger_model.dart';

bool verbose = true;
const bool localDevelopment = bool.fromEnvironment('USE_CLOUD');

// final navigatorKey = GlobalKey<NavigatorState>();
// BuildContext get appContext {
//   if (navigatorKey.currentContext == null) {
//     throw 'Navigator key is not initialized';
//   }
//   return navigatorKey.currentContext!;
// }

// double get height => MediaQuery.of(appContext).size.height;
// double get width => MediaQuery.of(appContext).size.width;

// ColorScheme get colorScheme => Theme.of(appContext).colorScheme;
// TextTheme get textTheme => Theme.of(appContext).textTheme;

Passenger currentPassenger = Passenger(
  $id: '',
  fName: 'ERROR',
  lName: 'Byron',
  cabinNumber: 0,
);

AppStringsModel appStrings = AppStringsModel(data: {});

Map<String, Mustache> get globalData => {
      'user': currentPassenger,
      'app_strings': appStrings,
    };

final ModelStream<AppStringsModel> _appStringsStreamSubscription =
    ModelStream<AppStringsModel>(
  databaseId: AppwriteClient.dbId,
  collectionId: AppwriteClient.appStrings,
  convert: (json) => AppStringsModel.fromJson(json),
)..stream.listen((data) {
        for (final element in data) {
          final id = element.data['id'] ?? '';
          final value = element.data['value'] ?? '';
          appStrings.data[id] = value;
        }
      });

Stream<List<AppStringsModel>> get appStringsStream =>
    _appStringsStreamSubscription.stream;
