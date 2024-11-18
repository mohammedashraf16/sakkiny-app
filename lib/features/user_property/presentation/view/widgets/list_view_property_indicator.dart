
import 'package:flutter/material.dart';
import 'package:sakkiny/features/home/presentation/views/widget/loading_indicator/home_loading_indicator.dart';


class ListViewUserPropertyLoadingIndicator extends StatelessWidget {
  const ListViewUserPropertyLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const CustomLoadingIndicatorHome(),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }
}