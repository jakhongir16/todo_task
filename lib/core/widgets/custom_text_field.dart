import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.maxlines = 1,
    required this.controller,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.onTap,
    this.isReadOnly = false,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.suffix
  });

  
  final String title;
  final int? maxlines;
  final TextEditingController controller;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final TextInputAction textInputAction;
  final int? maxLength;
  final String? suffix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Roborto-Light'),
          ),
          const SizedBox(height: 4,),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            maxLength: maxLength,
            readOnly: isReadOnly,
            onTap: onTap,
            controller: controller,
            maxLines: maxlines,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              fillColor: greyBackground,
              suffix: suffix == null ?
              const SizedBox()
              : SvgPicture.asset(suffix!),
              counterText: '',
              filled: true,
              focusedBorder: OutlineInputBorder(
                
                borderSide: 
                    const BorderSide(width: 0, color: Colors.transparent),
               borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: 
                   const BorderSide(width: 0, color: Colors.transparent),
                   borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],       
      ),
    );
  }
}