import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantingView extends StatelessWidget {
  const PlantingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planting Calendar'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          String monthName = DateFormat.MMMM().format(DateTime(DateTime.now().year, index + 1, 1));

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MonthDetailsPage(monthName: monthName),
                ),
              );
            },
            child: Hero(
              tag: monthName,
              child: Card(
                elevation: 2,
                margin: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    monthName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MonthDetailsPage extends StatelessWidget {
  final String monthName;

  const MonthDetailsPage({Key? key, required this.monthName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(monthName),
      ),
      body: Center(
        child: DateGrid(monthName: monthName),
      ),
    );
  }
}

class DateGrid extends StatelessWidget {
  final String monthName;

  const DateGrid({Key? key, required this.monthName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse the month name to get a DateTime instance
    DateTime parsedDate = DateFormat.MMM().parse(monthName);

    // Extract the month number from the parsed date
    int monthNumber = parsedDate.month;

    // Calculate the first day of the month
    DateTime firstDayOfMonth = DateTime(DateTime.now().year, monthNumber, 1);

    // Calculate the number of days in the month
    int daysInMonth = DateTime(DateTime.now().year, monthNumber + 1, 0).day;

    // Create a list of day names
    List<String> dayNames = DateFormat.E().dateSymbols.STANDALONEWEEKDAYS;

    return Column(
      children: [
        // Display month name
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            monthName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Display day names as titles
        Row(
          children: List.generate(
            7,
            (index) => Expanded(
              child: Center(
                child: Text(
                  dayNames[(index + 1) % 7], // Start from Monday
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        // Display dates in a grid
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: daysInMonth + firstDayOfMonth.weekday - 1, // Include empty cells for previous month
          itemBuilder: (context, index) {
            if (index < firstDayOfMonth.weekday - 1) {
              // Display empty cells for previous month
              return Container();
            } else {
              // Calculate current date
              DateTime currentDate = firstDayOfMonth.add(Duration(days: index - firstDayOfMonth.weekday + 1));
              return Card(
                elevation: 2,
                margin: const EdgeInsets.all(4),
                child: Center(
                  child: Text(
                    currentDate.day.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}



