import 'package:flutter/material.dart';

class VSpacer extends StatelessWidget {
  final double height;
  const VSpacer({Key? key, this.height = 15.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HSpacer extends StatelessWidget {
  final double width;
  const HSpacer({Key? key, this.width = 15.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
