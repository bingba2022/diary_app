// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diary_app/constants.dart';
import 'package:flutter/material.dart';

class FrontView extends StatelessWidget {
  final int monthIndex;
  const FrontView({
    Key? key,
    required this.monthIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // month numbers
            Text(
              '$monthIndex',
              textScaleFactor: 3.5,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              months[monthIndex]!.keys.toList()[0],
              textScaleFactor: 2.5,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                // progress bar
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '5/31',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Container(
                        width: double.infinity, // 부모 위젯의 가로 길이와 같아짐
                        height: 3.0,
                        color: Colors.white30,
                        child: FractionallySizedBox(
                          //부모 위젯의 사이즈와 같아짐
                          alignment: Alignment.centerLeft,
                          widthFactor: 5 / 31,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                // option button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
