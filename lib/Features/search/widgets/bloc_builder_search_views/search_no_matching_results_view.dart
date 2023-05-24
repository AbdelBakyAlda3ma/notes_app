import 'package:flutter/material.dart';

class SearchNoMatchingResultsView extends StatelessWidget {
  const SearchNoMatchingResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "There is no matching results",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
