import 'dart:html';
import 'dart:math' as math;

import 'package:jaspr/jaspr.dart';

class Bubble {
  static const speedMultiplier = 2;
  static final List<Color> colors = const [
    Colors.blue,
    Colors.blueViolet,
    Colors.darkBlue,
    Colors.skyBlue,
    Colors.orange,
  ];
  double x, y;
  Color color;
  double radius;
  double dx, dy;

  Bubble(this.x, this.y, this.color, this.radius, this.dx, this.dy);

  Component toComponent() {
    return div(
      [],
      styles: Styles.combine([
        Styles.background(
          color: color,
        ),
        Styles.raw({
          "filter": "blur(50px)",
        }),
        Styles.box(
          radius: BorderRadius.circular(Unit.pixels(radius)),
          height: Unit.pixels(radius * 2),
          width: Unit.pixels(radius * 2),
          position: Position.absolute(
            top: Unit.pixels(y - radius),
            left: Unit.pixels(x - radius),
          ),
        ),
      ]),
      classes: "bubble",
    );
  }
}

class BubbleAnimation extends StatefulComponent {
  const BubbleAnimation({super.key});

  @override
  State<BubbleAnimation> createState() => BubbleAnimationState();
}

class BubbleAnimationState extends State<BubbleAnimation> {
  int count = 0;
  final List<Bubble> bubbles = [];
  final fps = 15;

  @override
  void initState() {
    final windowHeight = window.innerHeight?.toDouble() ?? 100;
    final windowWidth = window.innerWidth?.toDouble() ?? 100;
    for (int i = 0; i < 40; ++i) {
      double height = math.Random().nextDouble() * (150 - 20) + 20;
      Color color = Bubble.colors[math.Random().nextInt(Bubble.colors.length)];
      double x = math.Random().nextDouble() * (windowWidth);
      double y = math.Random().nextDouble() * (windowHeight);
      double speedX =
          (math.Random().nextDouble() - 0.5) * 0.5 * Bubble.speedMultiplier;
      double speedY =
          (math.Random().nextDouble() - 0.5) * 0.5 * Bubble.speedMultiplier;

      bubbles.add(Bubble(x, y, color, height, speedX, speedY));
    }

    Future.delayed(
      Duration(milliseconds: 1000 ~/ fps),
      () => moveBubble(DateTime.now().millisecondsSinceEpoch),
    );
    super.initState();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'BubbleAnimation',
      [...(bubbles.map((e) => e.toComponent()))],
      styles: Styles.combine(
        [
          Styles.box(
            height: Unit.percent(100),
            width: Unit.percent(100),
            position: Position.relative(),
            overflow: Overflow.hidden,
          ),
          Styles.background(
            color: Colors.black,
          ),
          Styles.raw({"z-index": "0"}),
        ],
      ),
    );
  }

  DateTime previousTimeStamp = DateTime.now();

  void moveBubble(num timeStamp) {
    double timeStampDiff =
        timeStamp - previousTimeStamp.millisecondsSinceEpoch.toDouble();
    previousTimeStamp = DateTime.now();
    for (Bubble bubble in bubbles) {
      double left = bubble.x;
      double top = bubble.y;
      double width = bubble.radius;
      double height = bubble.radius;

      final windowHeight = window.innerHeight?.toDouble() ?? 100;
      final windowWidth = window.innerWidth?.toDouble() ?? 100;

      left += bubble.dx * timeStampDiff / 16.6667;
      top += bubble.dy * timeStampDiff / 16.6667;

      if (left < 0 - width) left = windowWidth;
      if (left > windowWidth) left = 0 - width;
      if (top < 0 - height) top = windowHeight;
      if (top > windowHeight) top = 0 - height;

      bubble.x = left;
      bubble.y = top;
    }

    setState(() {});

    // requestAnimationFrame(moveBubble);
    Future.delayed(
      Duration(milliseconds: 1000 ~/ fps),
      () => moveBubble(DateTime.now().millisecondsSinceEpoch),
    );
  }
}
