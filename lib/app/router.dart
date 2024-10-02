import 'package:jaspr_router/jaspr_router.dart';

import '../presentation/screens/home/home.dart';
import '../presentation/screens/splash/splash.dart';
import '../presentation/screens/vod/hls_video_player.dart';
import '../presentation/screens/vod/video_on_demand.dart';
import 'routes.dart';

final appRoutes = [
  Route(
    path: AppRoutes.screenSaver,
    title: 'Screensaver',
    builder: (context, state) => const SplashScreen(),
  ),
  Route(
    path: AppRoutes.home,
    title: 'Home',
    builder: (context, state) => const HomeScreen(),
  ),
  Route(
    path: AppRoutes.vod,
    title: 'Video On Demand',
    builder: (context, state) => const VideoOnDemand(),
  ),
  Route(
    path: AppRoutes.hls,
    title: 'HLS',
    builder: (context, state) {
      final streamUrl = state.extra as String;
      return HLSVideoComponent(streamUrl: streamUrl);
    },
  ),
];
