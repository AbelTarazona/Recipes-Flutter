import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/bloc/pagination/pagination_params.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';

abstract class PaginationBloc<T> extends BaseScreenBloc<Pagination<T>> {
  PaginationBloc({required super.hasConnection});

  final int pageSize = 10;
  int page = 0;

  @override
  FutureOr<void> onCallAction(
    CallAction event,
    Emitter<BaseScreenState<Pagination<T>>> emit,
  ) async {
    bool isOtherData = false;
    if (event.params is ScreenPaginationParams) {
      emit(
        // ignore: prefer_const_constructors
        BaseScreenState(
          value: null,
          status: ScreenStatusType.loading,
        ),
      );
      isOtherData = (event.params as ScreenPaginationParams).clearData;
      page = 0;
    }
    if (!isOtherData &&
        (state.status.isLoading ||
            (state.value != null && state.value!.data.isEmpty))) {
      log('PaginationBloc: State is loading or next is null');
      return;
    }
    await super.onCallAction(event, emit);
  }

  @override
  void onSuccess(emit, value, params) {
    List<T>? initialList;
    if (params is ScreenPaginationParams) {
      if (params.clearData) {
        initialList = [];
      }
    }
    final previousList = state.value;
    final List<T> newList = [
      ...(initialList ?? previousList?.data ?? []),
      ...value.data
    ];
    final pagination = Pagination<T>(
      total: value.total,
      limit: value.limit,
      skip: value.skip,
      data: newList,
    );
    emit(
      state.copyWith(
        status: ScreenStatusType.loaded,
        value: pagination,
      ),
    );
    page += pageSize;
  }
}
