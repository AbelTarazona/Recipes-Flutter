import 'package:flutter/material.dart';

mixin InfiniteScrollMixin<T extends StatefulWidget> on State<T> {
  ScrollController get scrollController;
  void Function() get onScrollEnd;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) onScrollEnd();
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9); // 90% hacia abajo
  }
}
