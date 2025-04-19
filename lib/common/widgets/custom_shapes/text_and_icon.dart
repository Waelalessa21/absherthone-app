import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  final String description;
  final Function onPressed;
  final bool isShadowNeeded;
  final double fontSize;

  const TextAndIcon({
    super.key,
    required this.iconPath,
    required this.label,
    required this.description,
    required this.onPressed,
    this.isShadowNeeded = true,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final iconTheme = Theme.of(context).iconTheme;

    return GestureDetector(
      onTap: () => onPressed(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: isShadowNeeded
                      ? [
                          BoxShadow(
                            color: colorScheme.shadow.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : null,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  iconPath,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.cover,
                  color: iconTheme.color,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                label,
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(right: 35.w),
            child: Text(
              description,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
