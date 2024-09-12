import 'dart:async';

import 'package:jaspr/jaspr.dart';

class ClockComponent extends StatefulComponent {
  final Component Function(BuildContext context, DateTime time) builder;
  final bool updatePerSec;
  const ClockComponent(
      {super.key, required this.builder, this.updatePerSec = false});

  @override
  State<ClockComponent> createState() => _ClockComponentState();
}

class _ClockComponentState extends State<ClockComponent> {
  bool disposed = false;

  @override
  void initState() {
    super.initState();
    unawaited(_updateTime());
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  Future<void> _updateTime() async {
    final millisecTillNextMinute = component.updatePerSec
        ? 1000 - DateTime.now().millisecond
        : 60 * 1000 - DateTime.now().millisecond;
    await Future.delayed(Duration(milliseconds: millisecTillNextMinute));
    if (!disposed) {
      setState(() {});
      _updateTime();
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      component.builder(context, DateTime.now()),
    ]);
  }
}
