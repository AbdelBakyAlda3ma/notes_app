import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/search/search_view.dart';
import 'package:notes_app/cubits/featch_notes_cubit/featch_notes_cubit.dart';
import '../../../utils/widgets/custom_app_bar.dart';
import '../../add_note/add_note_bottom_sheet_view.dart';
import 'home_view_body.dart';

class HomeViewScaffold extends StatelessWidget {
  const HomeViewScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            onPressed: BlocProvider.of<FeatchNotesCubit>(context).notes.isEmpty
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SearchView();
                        },
                      ),
                    );
                  },
          ),
          const HomeViewBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModBottomSheet(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<dynamic> showModBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: context,
      builder: (context) {
        return const AddNoteBottomSheetView();
      },
    );
  }
}
