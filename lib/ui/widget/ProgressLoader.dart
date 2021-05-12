import 'package:flutter/material.dart';

class ProgressLoader extends StatefulWidget {
  @override
  _ProgressLoaderState createState() => _ProgressLoaderState();
}

class _ProgressLoaderState extends State<ProgressLoader>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: controller.value,
        semanticsLabel: 'In Progress',
      ),
    );
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
