import 'package:jaspr_router/jaspr_router.dart';

import '../pages/home.dart';
import '../presentation/screens/splash/splash.dart';
import 'routes.dart';

final appRoutes = [
  Route(
    path: AppRoutes.screenSaver,
    title: 'Screensaver',
    builder: (context, state) => const ScreensaverScreen(),
  ),
  Route(
    path: AppRoutes.home,
    title: 'Home',
    builder: (context, state) => const HomeScreen(),
  ),
];
