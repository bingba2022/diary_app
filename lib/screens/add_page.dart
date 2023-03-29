import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Icon _selectedWeather = const Icon(
    Icons.sunny,
    color: Colors.grey,
  );
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String month = DateFormat("MMM").format(now).toUpperCase();
    String day = now.day < 10 ? '0${now.day}' : '${now.day}';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade300,
              height: 350,
              width: 400,
              child: const Icon(Icons.add_a_photo_rounded),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '$month $day/${now.year}',
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Title',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('  SELECT WEATHER'),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.close_rounded))
                              ],
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.wb_sunny),
                            title: const Text('Sunny'),
                            onTap: () {
                              setState(() {
                                _selectedWeather = const Icon(Icons.wb_sunny);
                              });
                              Navigator.pop(context, Icon);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.cloud),
                            title: const Text('Cloudy'),
                            onTap: () {
                              setState(() {
                                _selectedWeather = const Icon(Icons.cloud);
                              });
                              Navigator.pop(context, Icon);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.wb_twighlight),
                            title: const Text('Rainny'),
                            onTap: () {
                              setState(() {
                                _selectedWeather =
                                    const Icon(Icons.wb_twighlight);
                              });
                              Navigator.pop(context, Icon);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.snowing),
                            title: const Text('Snowy'),
                            onTap: () {
                              setState(() {
                                _selectedWeather = const Icon(Icons.snowing);
                              });
                              Navigator.pop(context, Icon);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.thunderstorm),
                            title: const Text('Lighting'),
                            onTap: () {
                              setState(() {
                                _selectedWeather =
                                    const Icon(Icons.thunderstorm);
                              });
                              Navigator.pop(context, Icon);
                            },
                          ),
                        ],
                      );
                    },
                  ).then((value) {});
                },
                icon: _selectedWeather),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: const Text('Write your today...'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
