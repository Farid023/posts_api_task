
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/domain/models/post_model.dart';
import 'package:posts_api/domain/usecase/get_posts_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getPostsUseCase) : super(HomeInitial());

  final GetPostsUseCase _getPostsUseCase;

  void getPosts() async {
    try {
      emit(HomeLoading());
      final posts = await _getPostsUseCase.execute();
      emit(HomeSuccess(posts));
    } catch (e) {
      emit(HomeFailure());
    }
  }
}
