import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/widgets/animated_grid_widget.dart';
import 'package:recipes_aplazo/core/widgets/infinite_scroll_mixin.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/home/bloc/recipe_bloc.dart';
import 'package:recipes_aplazo/presentation/home/widgets/recipe_card.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList>
    with InfiniteScrollMixin<RecipeList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, BaseScreenState<Pagination<Recipe>>>(
      builder: (context, state) {
        final items = state.value?.data ?? [];
        final isPagination = state.status.isLoading && items.isNotEmpty;
        final showLoader = state.status.isLoading && items.isEmpty;

        return Expanded(
          child: AnimatedGridWidget<Recipe>(
            mainAxisExtent: 180,
            isLoading: showLoader,
            items: items,
            isError: state.status.isError,
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            loadingWidget: const CircularProgressIndicator(),
            scrollDirection: Axis.vertical,
            isPaginated: isPagination,
            shrinkWrap: true,
            errorWidget: const SizedBox(),
            emptyWidget: const SizedBox(),
            itemBuilder: (item) {
              return RecipeCard(recipe: item);
            },
          ),
        );
      },
    );
  }

  @override
  void Function() get onScrollEnd => continuePagination;

  @override
  ScrollController get scrollController => _scrollController;

  void continuePagination() {
    BlocProvider.of<RecipeBloc>(context).add(const CallAction());
  }
}
