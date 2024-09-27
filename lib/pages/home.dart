import 'dart:js_interop';

import 'package:jaspr/jaspr.dart';
import 'package:web/web.dart';

import '../appwrite/appwrite.dart';
import '../appwrite/model_stream.dart';
import '../core/utils/focus_component.dart';
import '../data/models/modules_activation.dart';
import '../material_icons/icon.dart';
import '../material_icons/icons.dart';

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

    yield div(
      [
        text('Home Screen'),
        StreamBuilder(
          stream: modelStream.stream,
          builder: (context, snapshot) sync* {
            if (snapshot.hasData) {
              final List<ModulesActivationModel> data = snapshot.data!;
              yield div(
                [
                  for (final item in data)
                    FocusComponent(
                      children: [
                        const Icon(Icons.add),
                        text(item.title),
                      ],
                      borderRadius: const BorderRadius.circular(
                        Unit.pixels(100),
                      ),
                      onTap: () {
                        console.log('Tapped on ${item.title}'.toJS);
                      },
                      classes: 'p-1 pt-4 pb-4 flex flex-col items-center',
                    ),
                ],
                classes:
                    'grid grid-cols-5 gap-2 p-2 bg-black bg-opacity-50 text-white rounded-full',
              );
              return;
            } else if (snapshot.hasError) {
              yield text('Error: ${snapshot.error}');
              return;
            }
            yield text('Loading...');
            return;
          },
        ),
      ],
      classes: 'flex flex-col justify-between h-screen',
    );
  }
}
