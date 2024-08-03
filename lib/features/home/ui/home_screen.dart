import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/features/home/ui/widget/doctors_blue_container.dart';
// import 'package:doc_app/features/home/ui/widget/doctors_list/douctor_list_view.dart';
import 'package:doc_app/features/home/ui/widget/doctors_speciality_see_all.dart';
// import 'package:doc_app/features/home/ui/widget/douctor_speciality_list_view.dart';
import 'package:doc_app/features/home/ui/widget/hom_top_bar.dart';
import 'package:doc_app/features/home/ui/widget/specializations_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              HomTopBar(),
              verticalSpace(16),
              DoctorsBlueContainer(),
              verticalSpace(24),
              DoctorsSpecialitySeeAll(),
              verticalSpace(16),
              SpecializationsAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
