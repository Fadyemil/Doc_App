import 'package:doc_app/features/home/ui/widget/doctors_list/doctors_list_view_Item.dart';
import 'package:flutter/material.dart';

class DouctorListView extends StatelessWidget {
  const DouctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return DoctorsListViewItem();
        },
      ),
    );
  }
}
