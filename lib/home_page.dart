import 'package:diary_app/widgets/back_view.dart';
import 'package:diary_app/widgets/front_view.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isFrontView = true; // 디폴트를 front view로 설정

  late AnimationController controller;
  late DateTime now;
  late String day;
  late String month;

  switchView() {
    setState(() {
      if (isFrontView) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    now = DateTime.now();
    day = now.day < 10 ? '0${now.day}' : '${now.day}';
    month = DateFormat("MMM").format(DateTime.now()).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // os 인터페이스에 가려지지 않도록
      body: SafeArea(
        child: Column(
          children: [
            // search and menu
            Padding(
              // 찾기 아이콘이랑 메뉴 아이콘의 양쪽 화면 갭을 맞춰줌
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 30.0,
                    icon: const Icon(
                      Icons.search_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 30.0,
                    icon: const Icon(
                      Icons.short_text_rounded,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),

            // year selector
            DropdownButton(
              value: '2023',
              items: const [
                DropdownMenuItem(
                  value: '2023',
                  child: Text('2023'),
                )
              ],
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 30.0,
            ),

            // month cards
            Expanded(
              child: Container(
                // color: Colors.grey.shade300,
                // 회색 컨테이너와 파랑색 달력 카드 위아래 갭
                padding: const EdgeInsets.symmetric(vertical: 22.0),
                child: PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 0.78, // 좌우 여백에 이전이나 다음 페이지를 보이게 함
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 12, // 12 months
                  itemBuilder: (_, index) => AnimatedBuilder(
                      animation: controller,
                      builder: (_, child) {
                        if (controller.value >= 0.5) {
                          isFrontView = false;
                        } else {
                          isFrontView = true;
                        }
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(controller.value * pi),
                          alignment: Alignment.center,
                          child: isFrontView
                              ? FrontView(monthIndex: index + 1)
                              : Transform(
                                  transform: Matrix4.rotationY(pi),
                                  alignment: Alignment.center,
                                  child: BackView(monthIndex: index + 1)),
                        );
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),

            // action buttons
            Padding(
              // 버튼 있는 줄을 패딩으로 감싸서 양쪽 화면 갭의 비율을 맞춰줌
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  // Today chip
                  Container(
                    width: 155.0,
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        // sun icon
                        const Icon(Icons.wb_sunny_rounded),
                        const SizedBox(
                          width: 10.0,
                        ),

                        // today details (date, month)
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Today',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '$month $day/${now.year}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  const Spacer(), // 공간 만들어 줌
                  // edit button
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    // 펜 아이콘이랑 달력 아이콘 사이의 갭
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: (() => switchView()),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: isFrontView ? Colors.black87 : Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFrontView
                            ? Icons.calendar_month_rounded
                            : Icons.undo_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // calendar switch button
                ],
              ),
            ),
            const SizedBox(
              height: 75.0,
            ),
          ],
        ),
      ),
    );
  }
}
