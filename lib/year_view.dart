import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/month_view.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/year_title.dart';

class YearView extends StatelessWidget {
  const YearView({
    @required this.context,
    @required this.year,
    @required this.currentDateColor,
    this.yearPadding,
    this.dividerColor,
    this.monthDaysColor,
    this.monthTitleColor,
    this.yearTitleColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
  });

  final EdgeInsets yearPadding;
  final Color dividerColor;
  final Color monthDaysColor;
  final Color monthTitleColor;
  final Color yearTitleColor;
  final BuildContext context;
  final int year;
  final Color currentDateColor;
  final List<DateTime> highlightedDates;
  final Color highlightedDateColor;
  final List<String> monthNames;
  final Function onMonthTap;
  double get horizontalMargin => 16.0;
  double get monthViewPadding => 8.0;

  Widget buildYearMonths(BuildContext context) {
    final List<Row> monthRows = <Row>[];
    final List<MonthView> monthRowChildren = <MonthView>[];

    for (int month = 1; month <= DateTime.monthsPerYear; month++) {
      monthRowChildren.add(
        MonthView(
          context: context,
          year: year,
          month: month,
          padding: monthViewPadding,
          currentDateColor: currentDateColor,
          monthDaysColor: monthDaysColor,
          monthTitleColor: monthTitleColor,
          highlightedDates: highlightedDates,
          highlightedDateColor: highlightedDateColor,
          monthNames: monthNames,
          onMonthTap: onMonthTap,
        ),
      );

      if (month % 3 == 0) {
        monthRows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<MonthView>.from(monthRowChildren),
          ),
        );
        monthRowChildren.clear();
      }
    }

    return Column(
      children: List<Row>.from(monthRows),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getYearViewHeight(context),
      padding: yearPadding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin,
              vertical: 0.0,
            ),
            child: YearTitle(year, yearTitleColor),
          ),
          Container(
            margin: EdgeInsets.only(
              left: horizontalMargin,
              right: horizontalMargin,
              top: 8.0,
            ),
            child: Divider(
              color: dividerColor ?? Colors.black26,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin - monthViewPadding,
              vertical: 6.0,
            ),            
            child: buildYearMonths(context),
          ),
        ],
      ),
    );
  }
}
