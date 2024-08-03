import 'package:doc_app/features/home/data/models/spec_response_model.dart';
import 'package:doc_app/features/home/ui/widget/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView(
      {super.key, required this.specializationsList});

  final List<SpecializationsData?> specializationsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityItem(
            itemIndex: index,
            specializationsData: specializationsList[index],
          );
        },
      ),
    );
  }
}
