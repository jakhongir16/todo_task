import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:overlay_support/overlay_support.dart';

import 'core/bloc/calendar_bloc/calendar_bloc.dart';
import 'core/bloc/show_pop_up_bloc/show_pop_up_bloc.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_theme.dart';
import 'core/data/model/popup_types.dart';
import 'core/widgets/custom_popups.dart';
import 'features/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => 
               CalendarBloc()..add(const CalendarEvent.init()),
          ),
           BlocProvider(
            create: (context) => ShowPopUpBloc(),
           ),
        ],
        child: Builder( builder: (context) {
          return BlocListener<ShowPopUpBloc, ShowPopUpState>(
             listener: (context, state) {
              if(state.showPopUp && state.popUpType == PopUpType.error) {
                 showSimpleNotification(
                  CustomPopUp(
                    color: red.withOpacity(0.6),
                    text: state.errorText,
                  ),
                  elevation: 0,
                  background: Colors.transparent,
                  autoDismiss: true,
                  slideDismissDirection: DismissDirection.horizontal,
                 );
              } else if(state.showPopUp && 
                 state.popUpType == PopUpType.warning ) {
                  showSimpleNotification(
                    CustomPopUp(
                      color: orange.withOpacity(0.6),
                      text: state.warningText,
                    ),
                    elevation: 0,
                    background: Colors.transparent,
                    autoDismiss: true,
                    slideDismissDirection: DismissDirection.horizontal,
                  );
                 } else if(state.showPopUp && 
                    state.popUpType == PopUpType.success) {
                      showSimpleNotification(
                        CustomPopUp(
                          color: green.withOpacity(0.6),
                          text: state.successText,
                        ),
                        elevation: 0,
                        background: Colors.transparent,
                        autoDismiss: true,
                        slideDismissDirection: DismissDirection.horizontal,
                      );
                    }
             },
             child: OverlaySupport.global(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme(),
                darkTheme: AppTheme.darkTheme(),
                themeMode: ThemeMode.light,
                home: const HomePage(),  
              ),
              ),
          );        
                 },
        ),
      ),
    );
  }
}