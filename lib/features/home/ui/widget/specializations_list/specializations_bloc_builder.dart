import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doc_app/features/home/logic/cubit/home_state.dart';
import 'package:doc_app/features/home/ui/widget/doctors_list/doctors_shimmer_loading.dart';
// import 'package:doc_app/features/home/ui/widget/doctors_list/douctor_list_view.dart';
import 'package:doc_app/features/home/ui/widget/specializations_list/speciality_list_view.dart';
import 'package:doc_app/features/home/ui/widget/specializations_list/speciality_shimmer_loading.dart';
// import 'package:doc_app/features/home/ui/widget/speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/helpers/spacing.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
            specializationsLoading: () {
              return setupLoading();
            },
            specializationsSuccess: (specializationsResponseModel) {
              var specializationsList = specializationsResponseModel;
              return setupSuccess(specializationsList);
            },
            specializationsError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

 /// shimmer loading for specializations and doctors
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

 Widget setupSuccess(specializationsList) {
    return SpecialityListView(
      specializationDataList: specializationsList ?? [],
    );
  }
  Widget setupError() {
    return const SizedBox.shrink();
  }
}
