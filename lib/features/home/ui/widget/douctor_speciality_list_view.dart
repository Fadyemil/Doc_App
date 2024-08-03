import 'package:doc_app/features/home/ui/widget/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DouctorSpecialityListView extends StatelessWidget {
  const DouctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return DoctorSpecialityItem(
            itemIndex: index,
          );
        },
      ),
    );
  }
}
