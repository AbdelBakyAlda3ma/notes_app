import 'package:flutter/material.dart';
import 'package:notes_app/Features/add_note/add_note_bottom_sheet_view.dart';
import 'package:notes_app/Features/home/widgets/home_view_body.dart';
import 'package:notes_app/utils/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            CustomAppBar(title: 'Notes', icon: Icons.search),
            HomeViewBody(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheetView();
                });
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
