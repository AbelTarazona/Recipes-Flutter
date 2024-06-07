import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/core/widgets/animated_grid_widget.dart';
import 'package:recipes_aplazo/core/widgets/infinite_scroll_mixin.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/home/widgets/recipe_card.dart';
import 'package:recipes_aplazo/presentation/home/widgets/recipe_empty.dart';
import 'package:recipes_aplazo/presentation/search/bloc/search_recipe_bloc.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList>
    with InfiniteScrollMixin<SearchList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchRecipeBloc, BaseScreenState<Pagination<Recipe>>>(
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
            loadingWidget: const CircularProgressIndicator(
              color: AppColors.codGray,
            ),
            scrollDirection: Axis.vertical,
            isPaginated: isPagination,
            shrinkWrap: true,
            errorWidget: const SizedBox(),
            emptyWidget: const RecipeEmpty(),
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
    BlocProvider.of<SearchRecipeBloc>(context).add(const CallAction());
  }
}
