import 'package:flutter/material.dart';

import '../../../app/app.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.index, super.key});

  final int index;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "User ${widget.index}",
          style: TextStyleManager.label3,
        ),
      ),
    );
  }
}
