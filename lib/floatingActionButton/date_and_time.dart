import 'package:flutter/material.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  //create datetime variable
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Column(
      children: [
        /*Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 4.0),
              child: SizedBox(
                child: Text(
                  'Deadline',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),*/

        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
            child: SizedBox(
              child: Text(
                'Date: ${dateTime.day}-${dateTime.month}-${dateTime.year}   Time: $hours:$minutes',
                style: const TextStyle(fontSize: 18.0, color: Colors.yellow),
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: pickDateTime,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.alarm,
                        color: Colors.purple,
                      ),
                      Text(
                        '  Set the deadline',
                        style: TextStyle(fontSize: 20.0, color: Colors.purple),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return; //pressed 'Cancel'

    TimeOfDay? time = await pickTime();
    if (time == null) return; //pressed 'Cancel'

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      this.dateTime = dateTime;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.purple, // header background color
              onPrimary: Colors.yellow, // header text color
              onSurface: Colors.purple, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple, // button text color
              ),
            ),
          ),
          child: child!,
        );
      });

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 00, minute: 00),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.purple, // header background color
              onPrimary: Colors.yellow, // header text color
              onSurface: Colors.purple, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple, // button text color
              ),
            ),
          ),
          child: child!,
        );
      });
}
