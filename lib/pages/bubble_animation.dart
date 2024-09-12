import 'dart:math' as math;

import 'package:jaspr/jaspr.dart';

class Bubble {
  static const speedMultiplier = 2;
  static final List<Color> colors = const [
    Color.rgba(255, 232, 116, 53),
    Color.value(0xFF061556),
    Color.value(0xFF0073BB),
    Colors.blue,
    Colors.skyBlue,
    Color.value(0xFF2B6FC0),
    Color.value(0xFF131C49),
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
  final fps = 60;

  @override
  void initState() {
    for (int i = 0; i < 10; ++i) {
      double height = math.Random().nextDouble() * (150 - 20) + 20;
      Color color = Bubble.colors[math.Random().nextInt(Bubble.colors.length)];
      double x = math.Random().nextDouble() * 1000;
      double y = math.Random().nextDouble() * 1000;
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
            height: Unit.pixels(1000),
            width: Unit.pixels(1000),
            position: Position.relative(),
            overflow: Overflow.hidden,
          ),
          Styles.background(
            color: Colors.black,
          )
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

      double innerWidth = 1000;
      double innerHeight = 1000;

      left += bubble.dx * timeStampDiff / 16.6667;
      top += bubble.dy * timeStampDiff / 16.6667;

      if (left < 0 - width) left = innerWidth;
      if (left > innerWidth) left = 0 - width;
      if (top < 0 - height) top = innerHeight;
      if (top > innerHeight) top = 0 - height;

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
