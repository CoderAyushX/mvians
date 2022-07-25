import 'package:flutter/material.dart';
import 'package:mvians/widgets/pages_widgets/explore_page_widgets/timer_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [TimerWidget()],
          ),
        ),
      )),
    );
  }
}
