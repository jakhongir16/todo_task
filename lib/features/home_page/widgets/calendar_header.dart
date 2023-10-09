import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/core/data/calendar_data/data_time.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_functions.dart';
import '../../../core/constants/icons.dart';
import '../../../core/widgets/custom_button.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.selectedMonth,
    required this.onChange,
    });
  
  final DateTime selectedMonth;
  
  final ValueChanged<DateTime> onChange;
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppFunctions.getMonth(selectedMonth.month),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: selectedMonthColor, fontFamily: 'Poppins-BoldItalic'),
              ),
              const Spacer(),
              CustomButton(
                height: 24,
                width: 24,
                onTap: (){
                  onChange(selectedMonth.addMonth(-1));
                },
                color: grey,
                borderRadius: 30,
                child: SvgPicture.asset(AppIcons.arrowLeft),
              ),
              const SizedBox(width: 10,),
              CustomButton(
                height: 24,
                width: 24,
                onTap: (){
                  onChange(selectedMonth.addMonth(1));
                },
                color: grey,
                borderRadius: 30,
                child: SvgPicture.asset(AppIcons.arrowRight),
              )
            ],
          )
        ],
      ),
    );
  }
}