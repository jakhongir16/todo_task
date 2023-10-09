import 'package:flutter/material.dart';
import 'package:todo_task/core/constants/app_colors.dart';
import 'package:todo_task/core/data/calendar_data/calendar_month.dart';
import 'package:todo_task/core/data/calendar_data/data_time.dart';
import 'package:todo_task/features/home_page/widgets/calendar_item.dart';

import '../../../core/constants/app_constants.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({
    super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate
    });
  
  final DateTime selectedMonth;
  final DateTime? selectedDate;
  
  final ValueChanged<DateTime> selectDate;
  
  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(AppConstants.wordsOfWeekDays.length, (index){
            final day = AppConstants.wordsOfWeekDays[index];
            return Text(
              day,
              style: const TextStyle(
                color: greyText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Medium',
              ),
            );
          })),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for(final week in data.weeks)
              Row(
                children: week.map((d){
                  return Expanded(
                    child: CalendarItem(
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () => selectDate(d.date),
                      isChosen: selectedDate != null &&
                         selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              )
            ],
          )
      ],
    );
  }
}