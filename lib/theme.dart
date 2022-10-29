import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeBuilder extends StatefulWidget {
  const ThemeBuilder(
      {Key? key,
      required this.builder,
      required this.defaultBrightness,
      required this.defaultBool})
      : super(key: key);

  final Widget Function(BuildContext context, Brightness brightness, bool _bool)
      builder;

  final Brightness defaultBrightness;
  final bool defaultBool;

  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();

  static _ThemeBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ThemeBuilderState>();
  }
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  late Brightness _brightness;
  late bool _bool;
  @override
  void initState() {
    super.initState();
    _brightness = widget.defaultBrightness;
    _bool = widget.defaultBool;

    if (mounted) {
      setState(() {});
    }
  }

  void theme() {
    setState(() {
      _brightness =
          _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
      _bool = _brightness == Brightness.dark ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _brightness, _bool);
  }
}
