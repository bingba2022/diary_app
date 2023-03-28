import 'package:diary_app/constants.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  final int monthIndex;

  const Calendar({
    Key? key,
    required this.monthIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int daysInMonth = months[monthIndex]!.values.toList()[0];
    String cMonth = monthIndex < 10 ? '0$monthIndex' : '$monthIndex';
    int firstDayIndex = DateTime.parse('2023-$cMonth-01').weekday - 1;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            '$monthIndex',
            textScaleFactor: 2.5,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            months[monthIndex]!.keys.toList()[0],
            textScaleFactor: 2.0,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          //dates
          Expanded(
            child: GridView.builder(
              itemCount: daysInMonth + firstDayIndex,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: ((_, index) {
                if (index < firstDayIndex) {
                  return const Text('');
                } else {
                  int day = index - firstDayIndex + 1;
                  String cDay = day < 10 ? '0$day' : '$day';
                  DateTime date = DateTime.parse('2023-$cMonth-$cDay');

                  return Text(
                    textAlign: TextAlign.center,
                    '$day',
                    style: TextStyle(
                      // date의 weekday(mon-sun)을 가져옴
                      color: date.weekday == DateTime.sunday
                          ? Colors.red
                          : date.weekday == DateTime.saturday
                              ? Colors.blue
                              : Colors.black,
                    ),
                  );
                }
              }),
            ),
          ),
          const Text(
            'Select a date to write',
            textScaleFactor: 0.8,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
