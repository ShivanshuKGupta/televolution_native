import 'package:jaspr/jaspr.dart';

class LiveTv extends StatefulComponent {
  const LiveTv({super.key});
  @override
  State<StatefulComponent> createState() => LiveTvState();
}

class LiveTvState extends State<LiveTv> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      h1([text('Live TV')], classes: 'text-3xl font-bold text-white'),
    ], classes: 'w-full h-full flex items-center justify-center');
  }
}
