import 'dart:js' as js;

import 'package:daily_setlang_issue_example/dailyco_web.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily issue demo',
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    js.context.callMethod('setDailyLanguage', ['da']);
                  },
                  child: const Text("Change to \"da\"")),
            ),
            const Expanded(
              child: DailyCoCallWidget(roomUrl: 'https://issueexample.daily.co/cPeVDnQeDQ6pp2XtGLpp'),
            ),
          ],
        ),
      ),
    );
  }
}
