import 'package:doc_app/features/home/data/models/spec_response_model.dart';
import 'package:doc_app/features/home/ui/widget/doctors_list/doctors_list_view_Item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, required this.doctorsList});
  final List<Doctors?>? doctorsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList!.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorsModels: doctorsList?[index],
          );
        },
      ),
    );
  }
}
