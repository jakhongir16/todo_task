import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_task/core/data/calendar_data/data_time.dart';

import '../../data/get_it.dart';
import '../../data/model/event_model.dart';
import '../../data/model/form_status.dart';
import '../../data/repositories/home_repo.dart';

part 'calendar_bloc.freezed.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
   final HomeRepository _repository = getIt<HomeRepository>();   
   
   CalendarBloc() : super(_CalendarState()) {
    on<_Init>((event, emit){
      final DateTime selectedMonth = DateTime.now().monthStart;
      emit(state.copyWith(selectedMonth: selectedMonth));
    });
    
    on<_ChangeSelectedMonth>((event, emit){
      if(state.selectedMonth != event.newMonth) {
        emit(state.copyWith(selectedMonth: event.newMonth));
      }
    });
    
    on<_ChangeSelectedDate>((event, emit) async {
      if(state.selectedDate != event.newDate) {
        final result = 
           await _repository.getEvents(event.newDate.toIso8601String());
          result.either((fail){
            emit(state.copyWith(
              selectedDate: event.newDate,
              status: FormStatus.submissionFailure,
            )); 
          }, (success) {
            emit(state.copyWith(
              selectedDate: event.newDate,
              status: FormStatus.submissionSuccess,
              models: success
              ));
          }); 
      }
    });
    
    on<_AddEvent>((event, emit) async{
      final currentModels = state.models;
      final result = await _repository.addNewEvent(event.model);
    
      //emit(state.copyWith(models: currentModels + [event.model]));
      result.either((value) {
        event.onFailure(value.errorMessage);
       }, (id) {
        emit(state.copyWith(models:currentModels + [
          event.model.copyWith(id: id)
        ]));
        event.onSuccess();
       });
    });
    
    on<_DeleteEvent>((event, emit) async {
      if(state.models.contains(event.model)){
        final List<EventModel> newModels = List.from(state.models);
        newModels.remove(event.model);
        emit(state.copyWith(models: newModels));
        final result = await _repository.deleteAnEvent(event.model.id!);
        result.either((value) {
          event.onFailure(value.errorMessage);
         }, (_) { 
          event.onSuccess();
         });
      }
    });
    
    on<_UpdateEvent>((event, emit) async {
      final result = 
           await getIt<HomeRepository>().updateAnEvent(event.newModel);
       result.either((fail) {
        event.onFailure(fail.errorMessage);
        }, (value) { 
          final index = state.models.indexWhere((e) => e.id == event.newModel.id);
          
          if(index != -1){
            final List<EventModel> newModels = List.from(state.models);
            newModels[index] = event.newModel;
            emit(state.copyWith(models: newModels));
          }
          event.onSuccess();
        });    
    });
   }
}