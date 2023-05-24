import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/search_cubit/search_cubit.dart';
import '../search_view_body_text_field.dart';

class SearchInEmptyListView extends StatelessWidget {
  const SearchInEmptyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchViewBodyTextField(
          enabled: false,
          hintText: 'The text field has been disabled',
          onChanged: (value) {
            BlocProvider.of<SearchCubit>(context).filteredSearch(value);
          },
          suffixIcon: Icons.search,
        ),
        const Center(
          child: Text(
            "There is no notes to search",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
