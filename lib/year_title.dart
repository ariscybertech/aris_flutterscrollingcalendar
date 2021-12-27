import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';

class YearTitle extends StatelessWidget {
  const YearTitle(
    this.year,
    this.color
  );

  final Color color;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Text(
      year.toString(),
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: screenSize(context) == ScreenSizes.small ? 22.0 : 26.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
