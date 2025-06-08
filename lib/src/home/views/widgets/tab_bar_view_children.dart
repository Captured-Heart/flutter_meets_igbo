import 'package:flutter/material.dart';
import 'package:flutter_meets_igbo/src/home/views/widgets/widgets.dart';

class TabBarViewChildren extends StatelessWidget {
  final ScrollController scrollController;
  final Widget? childWidget;
  final int? itemCount;

  const TabBarViewChildren({super.key, required this.scrollController, this.childWidget, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      controller: scrollController,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
      childAspectRatio: 0.7,
      shrinkWrap: true,
      physics: (itemCount ?? 2) < 3 ? const NeverScrollableScrollPhysics() : null,
      children: List.generate(itemCount ?? 3, growable: true, (index) => childWidget ?? FashionableShortsWidget(index: index)),
    );
  }
}
