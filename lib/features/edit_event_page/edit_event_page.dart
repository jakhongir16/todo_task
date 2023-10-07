import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/bloc/calendar_bloc/calendar_bloc.dart';
import '../../core/bloc/show_pop_up_bloc/show_pop_up_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_theme.dart';
import '../../core/constants/icons.dart';
import '../../core/data/model/event_model.dart';
import '../../core/widgets/custom_animation.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_show_dialog.dart';
import '../../core/widgets/custom_text_field.dart';

class EditEventPage extends StatefulWidget {
  const EditEventPage({super.key, required this.model});
  final EventModel model;
  
  
  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  late final TextEditingController eventNameController;
  late final TextEditingController eventDescriptionController;
  late final TextEditingController eventLocationController;
  late final TextEditingController eventTimeController;
  late int colorIndex;

   @override
  void initState() {
    final model = widget.model;
    eventNameController = TextEditingController(text: model.name);
    eventDescriptionController = TextEditingController(text: model.description);
    eventLocationController = TextEditingController(text: model.location);
    eventTimeController = TextEditingController(text: model.time);
    colorIndex = model.colorIndex;
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
    if(eventNameController.text != widget.model.name || 
       eventDescriptionController.text != widget.model.description || 
       eventLocationController.text != widget.model.location || 
       eventTimeController.text != widget.model.time || 
       colorIndex != widget.model.colorIndex){
        customShowDialog(
          context: context, 
          content: const Text('Do you really want to exit'), 
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
            ),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13, right: 19),
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
                            CustomTextField(
                              title: 'Event name',
                              maxLength: 50,
                              controller: eventNameController,
                            ),
                            CustomTextField(
                              title: 'Event description',
                              textInputAction: TextInputAction.newline,
                              controller: eventDescriptionController,
                              maxlines: 6,  
                            ),
                            CustomTextField(
                              suffix: AppIcons.location,
                              title: 'Event location',
                              maxLength: 40,
                              controller: eventLocationController,
                            ),
                          Padding(

                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
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
                          ),
                            CustomTextField(
                              title: 'Event time',
                              maxLength: 50, 
                              controller: eventTimeController
                              ),
                            
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  margin: const EdgeInsets.all(16),
                  height: 45,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roborto-Light'
                    ),
                  ),
                  onTap: (){
                    if(eventNameController.text.isNotEmpty){
                      final EventModel newModel = EventModel(
                        id: widget.model.id,
                        day: widget.model.day,
                        name: eventNameController.text,
                        description: eventDescriptionController.text,
                        time: eventTimeController.text,
                        location: eventLocationController.text,
                        colorIndex: colorIndex,
                      );
                      context.read<CalendarBloc>().add(
                        CalendarEvent.updateEvent(
                          newModel: newModel, 
                          onFailure: (error){
                            context.read<ShowPopUpBloc>().add(
                              ShowPopUpEvent.showFailure(text: error),
                            );
                            
                          },
                          onSuccess: (){
                            Navigator.pop(context);
                            context.read<ShowPopUpBloc>().add(
                            ShowPopUpEvent.showSuccess(text: 'Task successfully updated'),
                            );
                          },
                          )
                      );
                    } else{
                      context.read<ShowPopUpBloc>().add(
                        ShowPopUpEvent.showWarning(text: 'Enter your name'),
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