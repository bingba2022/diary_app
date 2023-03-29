// ignore_for_file: public_member_api_docs, sort_constructors_first
// need to fix

import 'package:flutter/material.dart';

class WeatherTile extends StatefulWidget {
  final IconData icon;
  final String title;

  const WeatherTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  State<WeatherTile> createState() => _WeatherTileState();
}

class _WeatherTileState extends State<WeatherTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.title),
      onTap: () {
        setState(() {});
      },
    );
  }
}
