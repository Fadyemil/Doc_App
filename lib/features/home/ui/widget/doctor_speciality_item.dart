import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theme/color.dart';
import 'package:doc_app/core/theme/styles.dart';
import 'package:doc_app/features/home/data/models/spec_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem(
      {super.key, required this.itemIndex, required this.specializationsData});
  final int itemIndex;
  final SpecializationsData? specializationsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManager.lighterGray,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              width: 40.w,
              height: 40.h,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? 'special',
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
