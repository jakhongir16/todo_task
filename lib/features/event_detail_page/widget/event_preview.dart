import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/icons.dart';
import '../../../core/constants/page_route.dart';
import '../../../core/data/model/event_model.dart';
import '../event_detail_page.dart';

class EventPreview extends StatelessWidget {
  const EventPreview({
    super.key,
    required this.model,
    required this.index,
    });
  
  final EventModel model;
  final int index;
  
  @override
  Widget build(BuildContext context) {
    final lightColor = AppConstants.lightColorsTodo[model.colorIndex];
    final darkColor = AppConstants.darkColorsTodo[model.colorIndex];
    return GestureDetector(
      onTap: ()=> Navigator.push(
        context,
        material(page: EventDetailPage(index:index)),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 22, 12, 12),
            decoration: BoxDecoration(
              color: lightColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10), 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins-Black'
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  ),
                  if(model.description.isNotEmpty)
                  Text(
                    model.description,
                    style: TextStyle(
                      color: darkColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins-Medium'

                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      if(model.time.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            // ignore: deprecated_member_use
                            SvgPicture.asset(AppIcons.clock, color: darkColor,
                            ),
                            const SizedBox(width: 4,),
                            Text(
                              model.time,
                              style: TextStyle(
                                color: darkColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins-Medium'

                              ),
                            )
                          ],
                        ),
                      ),
                      if(model.location.isNotEmpty)
                         Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.location,
                                // ignore: deprecated_member_use
                                color: darkColor,
                              ),
                              const SizedBox(width: 4,),
                              Expanded(
                                child: Text(
                                  model.location,
                                  style: TextStyle(
                                    color: darkColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                         ),
                    ],
                  ),
              ],
            ),
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          ),
        ],
      ),
    );
  }
}