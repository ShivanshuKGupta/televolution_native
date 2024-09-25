import 'dart:js_interop';

import 'package:jaspr/jaspr.dart';
import 'package:web/web.dart';

import '../appwrite/appwrite.dart';
import '../appwrite/model_stream.dart';
import '../core/utils/focus_component.dart';
import '../data/models/modules_activation.dart';

class HomeScreen extends StatefulComponent {
  const HomeScreen({super.key});

  @override
  State<StatefulComponent> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final modelStream = ModelStream(
      databaseId: AppwriteClient.dbId,
      collectionId: AppwriteClient.moduleActivation,
      convert: ModulesActivationModel.fromJson);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield video(
      [],
      controls: false,
      autoplay: true,
      loop: true,
      muted: true,
      src: 'videos/H264HD1080.mp4',
      // Make it as the background video
      styles: const Styles.combine(
        [
          Styles.box(
            width: Unit.percent(100),
            height: Unit.percent(100),
            position: Position.absolute(
              top: Unit.zero,
              left: Unit.zero,
            ),
          ),
          Styles.raw({
            'object-fit': 'cover',
            'z-index': '-9',
          })
        ],
      ),
    );

    yield div([
      StreamBuilder(
        stream: modelStream.stream,
        builder: (context, snapshot) sync* {
          if (snapshot.hasData) {
            final List<ModulesActivationModel> model = snapshot.data!;
            yield div([
              for (final item in model)
                FocusComponent(
                  child: text(item.title),
                  onTap: () {
                    console.log('Tapped on ${item.title}'.toJS);
                  },
                ),
            ]);
            return;
          } else if (snapshot.hasError) {
            yield text('Error: ${snapshot.error}');
            return;
          }
          yield text('Loading...');
          return;
        },
      ),
    ]);
  }
}
