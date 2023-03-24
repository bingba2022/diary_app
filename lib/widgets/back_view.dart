// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diary_app/constants.dart';
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
        child: Padding(
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
                  itemCount: months[monthIndex]!.values.toList()[0],
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: ((_, index) {
                    int day = index + 1;
                    // 날짜 & 달이 한 자리 수 일 때 앞에 0 붙여서 날짜 형식 포맷
                    String cDay = day < 10 ? '0$day' : '$day';
                    String cMonth =
                        monthIndex < 10 ? '0$monthIndex' : '$monthIndex';
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
        ),
      ),
    );
  }
}
