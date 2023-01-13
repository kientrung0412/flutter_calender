import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      supportedLocales: [
        Locale('en', ''),
        Locale('vi', ''),
      ],
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Wrap(
                        children: [
                          IosCalender(),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('data'),
          ),
        ),
      ),
    );
  }
}

class IosCalender extends StatelessWidget {
  IosCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: const [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Flexible(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.blue,
                            )
                          )
                        ),
                        child : Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Text(
                            'Thang 1',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.blue,
                size: 24,
              ),
              const SizedBox(width: 24),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.blue,
                size: 24,
              ),
            ],
          ),
        ),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          headerVisible: false,
          startingDayOfWeek: StartingDayOfWeek.monday,
          rangeStartDay: DateTime.now(),
          rangeEndDay: DateTime(2023, 1, 20),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              );
            },
            selectedBuilder: (context, day, focusedDay) =>
                Center(child: Text('${day.day}')),
            outsideBuilder: (context, day, focusedDay) =>
                const SizedBox.shrink(),
            todayBuilder: (context, day, focusedDay) => Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            headerTitleBuilder: (context, day) => const SizedBox.shrink(),
            rangeHighlightBuilder: (context, day, isWithinRange) {
              if (day.day == 13) {
                return LayoutBuilder(
                  builder: (p0, p1) => Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: p1.maxWidth / 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.lightBlueAccent.withOpacity(0.4),
                    ),
                  ),
                );
              }
              if (day.day == 20) {
                return LayoutBuilder(
                  builder: (p0, p1) => Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: p1.maxWidth / 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.lightBlueAccent.withOpacity(0.4),
                    ),
                  ),
                );
              }
              if ((day.weekday == 1 || day.weekday == 7) && isWithinRange) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.4),
                    borderRadius: day.weekday == 1
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                          )
                        : const BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                );
              }
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: isWithinRange
                    ? Colors.lightBlueAccent.withOpacity(0.4)
                    : null,
              );
            },
            withinRangeBuilder: (context, day, focusedDay) => Container(
              alignment: Alignment.center,
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            rangeEndBuilder: (context, day, focusedDay) => Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            rangeStartBuilder: (context, day, focusedDay) => Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
