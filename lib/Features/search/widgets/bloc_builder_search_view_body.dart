import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/search/widgets/search_view_body_text_field.dart';
import 'package:notes_app/cubits/search_cubit/search_cubit.dart';

import 'bloc_builder_search_views/search_in_empty_list_view.dart';
import 'bloc_builder_search_views/search_in_progress_view.dart';
import 'bloc_builder_search_views/search_initial_and_empty_query_view.dart';
import 'bloc_builder_search_views/search_no_matching_results_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).filteredSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInEmptyList) {
          return const SearchInEmptyListView();
        } else {
          return Column(
            children: [
              SearchViewBodyTextField(
                enabled: true,
                onChanged: (value) {
                  BlocProvider.of<SearchCubit>(context).filteredSearch(value);
                },
                suffixIcon: Icons.search,
              ),
              BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
                if (state is SearchInProgress) {
                  return SearchInProgressView(
                    notes: BlocProvider.of<SearchCubit>(context).filteredNotes,
                  );
                } else if (state is SearchNoMatchingResults) {
                  return const SearchNoMatchingResultsView();
                } else {
                  return SearchInitialAndEmptyQueryView(
                    notes:
                        BlocProvider.of<SearchCubit>(context).allExistingNotes,
                  );
                }
              }),
            ],
          );
        }
      },
    );
  }
}
