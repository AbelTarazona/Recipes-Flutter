import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/widgets/animated_elements_widget.dart';

class AnimatedGridWidget<T> extends AnimatedElementsWidget {
  final double? mainAxisExtent;

  const AnimatedGridWidget({
    super.key,
    required super.items,
    required super.itemBuilder,
    super.isLoading,
    super.isError,
    super.separatorSize,
    super.scrollDirection,
    super.loadingWidget,
    super.errorWidget,
    super.controller,
    super.afterBuildCallback,
    super.emptyWidget,
    super.inverse,
    super.isPaginated,
    super.shrinkWrap,
    super.physics,
    this.mainAxisExtent,
  });

  @override
  Widget listBuilder(context) {
    return GridView.builder(
      physics: physics,
      controller: controller,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: mainAxisExtent,
      ),
      shrinkWrap: shrinkWrap,
      itemCount: items.length + (isPaginated ? 1 : 0),
      reverse: inverse,
      scrollDirection: scrollDirection,
      itemBuilder: (context, x) {
        if (isPaginated && x >= items.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return itemBuilder(items[x]);
      },
    );
  }
}
