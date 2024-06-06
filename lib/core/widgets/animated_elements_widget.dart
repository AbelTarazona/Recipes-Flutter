import 'package:flutter/material.dart';

abstract class AnimatedElementsWidget<T> extends StatelessWidget {
  final List<T> items;
  final bool isLoading;
  final bool isError;
  final Axis scrollDirection;

  final double separatorSize;
  final Widget Function(T item) itemBuilder;
  final ScrollController? controller;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final VoidCallback? afterBuildCallback;
  final Widget? emptyWidget;
  final bool inverse;
  final bool isPaginated;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const AnimatedElementsWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.loadingWidget,
    this.errorWidget,
    this.controller,
    this.afterBuildCallback,
    this.emptyWidget,
    this.isLoading = false,
    this.isError = false,
    this.separatorSize = 16,
    this.scrollDirection = Axis.horizontal,
    this.inverse = false,
    this.isPaginated = false,
    this.shrinkWrap = true,
    this.physics,
  });

  Widget listBuilder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      afterBuildCallback?.call();
    });

    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: (isLoading && !isPaginated
            ? loadingWidget ??
                const Center(
                  child: CircularProgressIndicator(),
                )
            : isError
                ? errorWidget ??
                    const Center(
                      child: Text('Error al cargar los datos'),
                    )
                : items.isEmpty
                    ? emptyWidget ?? const SizedBox()
                    : listBuilder(context)),
      ),
    );
  }
}
