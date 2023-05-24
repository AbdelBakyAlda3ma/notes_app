import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/widgets/bloc_builder_notes_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewListViewBlocBuilder();
  }
}
