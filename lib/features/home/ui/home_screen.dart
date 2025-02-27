import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/features/home/ui/widget/doctors_blue_container.dart';
// import 'package:doc_app/features/home/ui/widget/doctors_list/douctor_list_view.dart';
import 'package:doc_app/features/home/ui/widget/doctors_speciality_see_all.dart';
import 'package:doc_app/features/home/ui/widget/doctors_list/doctros_bloc_builder.dart';
// import 'package:doc_app/features/home/ui/widget/doctros_bloc_builder.dart';
// import 'package:doc_app/features/home/ui/widget/douctor_speciality_list_view.dart';
import 'package:doc_app/features/home/ui/widget/hom_top_bar.dart';
import 'package:doc_app/features/home/ui/widget/specializations_list/specializations_bloc_builder.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //  Future<void> _fetchData() async {
  //   // Simulate a network call or some async operations
  //   await Future.delayed(Duration(seconds: 2));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomTopBar(),
              verticalSpace(16),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(16),
              // Container(
              //   height: 400.h,
              //   child: 
                const SpecializationsBlocBuilder(),
              // ),
              verticalSpace(8),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
