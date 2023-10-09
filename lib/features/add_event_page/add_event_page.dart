import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/bloc/calendar_bloc/calendar_bloc.dart';
import '../../core/bloc/show_pop_up_bloc/show_pop_up_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_theme.dart';
import '../../core/constants/icons.dart';
import '../../core/data/model/event_model.dart';
import '../../core/widgets/custom_animation.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_container.dart';
import '../../core/widgets/custom_show_dialog.dart';
import '../../core/widgets/custom_sizedbox.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/custom_text.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key, required this.selectedDate});
  final DateTime selectedDate;
  
  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  late final TextEditingController eventNameController;
  late final TextEditingController eventDescriptionController;
  late final TextEditingController eventLocationController;
  late final TextEditingController eventTimeController;
  
  
  int colorIndex = 0;
  String eventTime = '';
  Duration duration = const Duration(seconds: 0);
  
  @override
  void initState() {
    eventNameController = TextEditingController();
    eventDescriptionController = TextEditingController();
    eventLocationController = TextEditingController();
    eventTimeController = TextEditingController();
    super.initState();
  }
  
  @override
  void dispose() {
    eventNameController.dispose();
    eventDescriptionController.dispose();
    eventLocationController.dispose();
    eventTimeController.dispose();
    super.dispose();
  }
  
  Future<bool> willExit() async {
    if(eventNameController.text.isNotEmpty || 
       eventDescriptionController.text.isNotEmpty || 
       eventLocationController.text.isNotEmpty ||
       eventTimeController.text.isNotEmpty
       ){
        customShowDialog(
          context: context, 
          content: const Text('Do you want to exit'), 
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            )
          ]
          );
          return false;
       }
       Navigator.pop(context);
       return false;
  }
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightTheme()
      .copyWith(brightness: Theme.of(context).brightness),
      child: WillPopScope(
        onWillPop: () => willExit(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    primary: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAnimation(
                          onTap: () => willExit(),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SvgPicture.asset(
                              AppIcons.back,
                              alignment: Alignment.topLeft,
                            ),
                          ), 
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 19, left: 13),
                            child: CustomTextField(
                              title: 'Event name', 
                              maxLength: 50,
                              controller: eventNameController,
                              ),
                          ),
                            Padding(
                              padding: const EdgeInsets.only(right: 19, left: 13),
                              child: CustomTextField(
                                title: 'Event description',
                                textInputAction: TextInputAction.newline,
                                controller: eventDescriptionController,
                                maxlines: 3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 19, left: 13),
                              child: CustomTextField(
                                title: 'Event location',
                                maxLength: 40, 
                                controller: eventLocationController,
                                suffix: AppIcons.location,

                                ),
                            ),
                              const CustomContainer(
                                  margin: EdgeInsets.only(left: 13),
                                  child:  CustomText(
                                   text: 'Priority color',
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roborto-Light',
                                    color: anotherGrayColor
                                  ),
                                  ),
                              ),
                              const CustomSizedBoxWidget(height: 6,),
                              CustomContainer(
                                margin: const EdgeInsets.only(left: 13),
                                width: 75,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: greyBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    dropdownColor: greyBackground,
                                    icon: Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: SvgPicture.asset(
                                    AppIcons.bottomArrow,
                                  ),
                                ),
                                    value: colorIndex,
                                    items: AppConstants.lightColorsTodo
                                    .map((Color color){
                                      return DropdownMenuItem<int>(
                                        value: AppConstants.lightColorsTodo
                                        .indexOf(color),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 9),
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            color: color,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (selectedColorIndex){
                                      if(selectedColorIndex != null) {
                                        colorIndex = selectedColorIndex;
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 19, left: 13),
                                child: CustomTextField(
                                  title: 'Event time', 
                                  maxLength: 50,
                                  controller: eventTimeController,
                                  ),
                              ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  margin: const EdgeInsets.all(16),
                  height: 45,
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roborto-Light',
                    ),
                  ),
                  onTap: (){
                    if(eventNameController.text.isNotEmpty){
                      final EventModel model = EventModel(
                        
                        day: widget.selectedDate.toIso8601String(),
                        name: eventNameController.text,
                        description: eventDescriptionController.text,
                        time: eventTimeController.text,
                        location: eventLocationController.text,
                        colorIndex: colorIndex,
                      );
                      context.read<CalendarBloc>().add(
                        CalendarEvent.addNewEvent(
                          model: model, 
                          onFailure: (error){
                            context.read<ShowPopUpBloc>().add(
                              ShowPopUpEvent.showFailure(text: error)
                            );
                          }, 
                          onSuccess: (){
                          Navigator.pop(context);
                          context.read<ShowPopUpBloc>()
                          .add(ShowPopUpEvent.showSuccess(
                            text: 'New Task successfully added'));  
                          },
                          ),
                      );
                    } else {
                      context.read<ShowPopUpBloc>().add(
                        ShowPopUpEvent.showWarning(text: 'Add a task name'),
                      );
                    }
                  },
                  ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}