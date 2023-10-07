import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/bloc/calendar_bloc/calendar_bloc.dart';
import '../../core/bloc/show_pop_up_bloc/show_pop_up_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/icons.dart';
import '../../core/constants/page_route.dart';
import '../../core/widgets/custom_animation.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_show_dialog.dart';
import '../edit_event_page/edit_event_page.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CalendarBloc, CalendarState>(
        buildWhen: (previous, current) =>
            !listEquals(previous.models, current.models),
        builder: (context, state) {
          final model = state.models[index];
          return Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppConstants.lightColorsTodo[model.colorIndex],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CustomButton(
                          borderRadius: 30,
                          padding: const EdgeInsets.all(8),
                          onTap: () => Navigator.pop(context),
                          color: white,
                          child: SvgPicture.asset(
                            AppIcons.arrowLeft,
                            height: 24,
                          ),
                        ),
                        const Spacer(),
                        CustomAnimation(
                          onTap: () => Navigator.push(
                            context,
                            cupertino(page: EditEventPage(model: model)),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.edit),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                'Edit',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Bold'),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        model.name,
                        style: const TextStyle(
                          color: white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins-Black',
                        ),
                      ),
                      if (model.description.isNotEmpty)
                        Text(
                          model.description,
                          style: const TextStyle(
                            color: white,
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins-Medium',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (model.time.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              // ignore: deprecated_member_use
                              SvgPicture.asset(
                                AppIcons.clock,
                                color: white,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                model.time,
                                style: const TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins-Medium',
                                ),
                              )
                            ],
                          ),
                        ),
                      if (model.location.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              // ignore: deprecated_member_use
                              SvgPicture.asset(
                                AppIcons.location,
                                color: white,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  model.location,
                                  style: const TextStyle(
                                    color: white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(28),
                  children: [
                    const Text(
                      'Reminder',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins-Black'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '15 minutes befor',
                      style: TextStyle(
                          color: darkGreyText,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    if (model.description.isNotEmpty)
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins-Black'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            //model.description,
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non. ",
                            style: TextStyle(
                              color: greyText,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins-Medium',
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
              CustomButton(
                margin: const EdgeInsets.all(28),
                borderRadius: 10,
                height: 50,
                color: brightPink,
                onTap: () {
                  print("note Id : ${model.id}");
                  customShowDialog(
                      context: context,
                      content:
                          const Text('Do you really want to delete this task?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('No'),
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<CalendarBloc>().add(
                                  CalendarEvent.deleteEvent(
                                    model: model,
                                    onSuccess: () => Navigator.pop(context),
                                    onFailure: (message) => context
                                        .read<ShowPopUpBloc>()
                                        .add(ShowPopUpEvent.showFailure(
                                            text: message)),
                                  ),
                                );
                          },
                        ),
                      ]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.bin),
                    const Text(
                      'Delete Event',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
