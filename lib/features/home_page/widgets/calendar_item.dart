import 'package:flutter/material.dart';
import 'package:todo_task/core/constants/app_constants.dart';
import 'package:todo_task/core/data/calendar_data/data_time.dart';
import 'package:todo_task/core/data/repositories/home_repo.dart';

import '../../../core/constants/app_colors.dart';



class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.isActiveMonth,
    required this.isChosen,
    required this.date,
    required this.onTap,
  });
  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isChosen;
  
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    final bool isPassed = date.isBefore(DateTime.now().dayStart);
     
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            decoration: isChosen 
             ? const BoxDecoration(color: blue, shape: BoxShape.circle)
             : isToday 
             ? BoxDecoration(
                border: Border.all(color: red),
                borderRadius: BorderRadius.circular(30),
             )
             : null,
             child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 14,
                color: isChosen
                  ? white
                  : isPassed
                   ? isActiveMonth
                    ? selectedMonthColor
                    : selectedMonthColor
                    : isActiveMonth
                    ? null
                    : selectedMonthColor,
                   fontFamily: 'Poppins-Light',
              ),
             ),
          ),
          const SizedBox(height: 3,),
          FutureBuilder(
            future: HomeRepositoryImpl().getFirst3EventsColorIndexes(date.toIso8601String()), 
            builder: (context, snapshot){
              if(snapshot.hasData && snapshot.data!.isRight) {
                final colorIndexes = snapshot.data!.right;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      colorIndexes.length, 
                      (i) => Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: 
                                AppConstants.lightColorsTodo[colorIndexes[i]],
                          shape: BoxShape.circle,
                        ),
                      ),
                      ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 5),
        ],
      ),
    );
  }
}