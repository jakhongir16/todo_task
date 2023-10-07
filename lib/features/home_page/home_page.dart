import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/constants/page_route.dart';
import 'package:todo_task/core/data/model/form_status.dart';
import 'package:todo_task/features/home_page/widgets/calendar_header.dart';
import 'package:todo_task/features/home_page/widgets/home_app_bar.dart';

import '../../core/bloc/calendar_bloc/calendar_bloc.dart';
import '../../core/bloc/show_pop_up_bloc/show_pop_up_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../add_event_page/add_event_page.dart';
import '../event_detail_page/widget/event_preview.dart';
import 'widgets/calendar_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CalendarBloc, CalendarState>(
         builder: (context, state){
           if(state.selectedMonth == null){
            return const Center(
              child: CircularProgressIndicator(),
            );
           }        
           final selectedMonth = state.selectedMonth!;
           final selectedDate = state.selectedDate;
           return Column(
            children: [
              HomeAppBar(selectedDate: selectedDate ?? DateTime.now()),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  children: [
                    SizedBox(
                      height: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CalendarHeader(
                            selectedMonth: selectedMonth, 
                            onChange: (value) => context
                            .read<CalendarBloc>()
                            .add(CalendarEvent.changeSelectedMonth(value))),
                          CalendarBody(
                            selectedDate: selectedDate,
                            selectedMonth: selectedMonth,
                            selectDate: (value) => context
                            .read<CalendarBloc>()
                            .add(CalendarEvent.changeSelectedDate(value)),
                          ),  
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Schedule',
                         style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins-Black'
                         ),
                        ),
                        const Spacer(),
                        CustomButton(
                          borderRadius: 10,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          height: 30,
                          color: blue,
                          onTap: (){
                            if(selectedDate != null){
                              Navigator.push(
                                context,
                                cupertino(
                                  page: AddEventPage(
                                    selectedDate: selectedDate,
                                  )
                                )
                              );
                            } else {
                              context.read<ShowPopUpBloc>().add(
                                ShowPopUpEvent.showWarning(
                                  text: 'Please select a day to create an event', 
                                       ));
                            }
                          },
                          child: const Text(
                            '+ Add Event',
                            style: TextStyle(
                              color: white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins-Black'

                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Builder(
                      builder: (context){
                        return (){
                          if(state.status == FormStatus.submissionSuccess) {
                            final models = state.models;
                            if(models.isEmpty) {
                              return const Center(
                                child: Text('There is no any task on this day'),
                              );
                            }else{
                              return ListView.separated(
                                itemCount: models.length,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index){
                                  return EventPreview(
                                    model: models[index],
                                    index: index,
                                  );
                                }, 
                                separatorBuilder: (_, __)=> 
                                const SizedBox(height: 14,), 
                                );
                            }
                          } else if(state.status == FormStatus.submissionInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(color: blue),
                            );
                          } else if(state.status == FormStatus.pure){
                            return const Center(
                              child: Text('Select a date and add your task'),
                            );
                          }
                          return const SizedBox();
                        }();
                      },
                    )
                  ],
                ),
              )
            ],
           );
         } 
        )
      )
    );
  }
}