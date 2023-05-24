import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/widgets/bloc_builder_home_view_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BlocBuilderHomeViewScaffold(),
    );
  }
}
