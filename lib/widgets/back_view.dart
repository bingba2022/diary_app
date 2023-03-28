// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diary_app/calendar.dart';
import 'package:flutter/material.dart';

class BackView extends StatelessWidget {
  final int monthIndex;

  const BackView({
    Key? key,
    required this.monthIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
            )
          ],
        ),
        child: Calendar(monthIndex: monthIndex),
      ),
    );
  }
}
