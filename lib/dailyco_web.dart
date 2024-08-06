import 'dart:js' as js;
import 'package:flutter/material.dart';

class DailyCoCallWidget extends StatefulWidget {
  const DailyCoCallWidget({super.key, required this.roomUrl});

  final String roomUrl;

  @override
  State<DailyCoCallWidget> createState() => _DailyCoCallWidgetState();
}

class _DailyCoCallWidgetState extends State<DailyCoCallWidget> {
  final _widgetKey = GlobalKey();

  bool initialized = false;

  @override
  void initState() {
    super.initState();

    js.context.callMethod('initializeDailyCo', [widget.roomUrl, "TODO: Username :)"]);

  }

  void _setWindowPositionAndSize(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;
        js.context
            .callMethod('setWindowPositionAndSize', [position.dx.toInt(), position.dy.toInt(), size.width.toInt(), size.height.toInt()]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      _setWindowPositionAndSize(context);
      _setDailyLanguage('da');
      initialized = true;
    }

    return SafeArea(
      child: NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (SizeChangedLayoutNotification notification) {
          _setWindowPositionAndSize(context);
          return true;
        },
        child: SizeChangedLayoutNotifier(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            key: _widgetKey,
            children: [Expanded(child: Container())],
          ),
        ),
      ),
    );
  }

  void _setDailyLanguage(String lang) {
    print('Setting daily language to $lang');
    js.context.callMethod('setDailyLanguage', [lang]);
  }
}
