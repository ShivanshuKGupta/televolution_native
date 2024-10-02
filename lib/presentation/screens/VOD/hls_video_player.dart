import 'dart:js_interop';

import 'package:jaspr/jaspr.dart';
import 'package:web/web.dart';

@JS('window.hlsPlayer.dispose')
external void disposeHlsPlayer();

class HLSVideoComponent extends StatefulComponent {
  final String streamUrl;
  const HLSVideoComponent({super.key, required this.streamUrl});

  @override
  State<HLSVideoComponent> createState() => _HLSVideoComponentState();
}

class _HLSVideoComponentState extends State<HLSVideoComponent> {
  @override
  void initState() {
    try {
      final element = document.body;
      element?.requestFullscreen();
    } catch (e) {
      console.error('Error going fullscreen: $e'.toJS);
    }
    super.initState();
  }

  @override
  void dispose() {
    try {
      print('Disposing player');
      disposeHlsPlayer();
    } catch (e) {
      console.error('Error stopping player: $e'.toJS);
    }
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      video(
        [
          source(
            src: component.streamUrl,
            type: 'application/x-mpegURL',
          )
        ],
        autoplay: true,
        id: 'hls-example',
        classes:
            'video-js vjs-default-skin position-absolute top-0 left-0 w-full h-full',
        controls: false,
      ),
      script([], src: 'https://cdn.jsdelivr.net/npm/hls.js@latest'),
      raw("""
      <script>
        window.hlsPlayer = videojs('hls-example');
        window.hlsPlayer.play();
      </script>
      """),
    ]);
  }
}
