

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/domain/usecase/get_post_by_id_usecase.dart';

import '../../../domain/models/post_model.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit(this._getPostByIdUseCase) : super(PostDetailInitial());

  final GetPostByIdUseCase _getPostByIdUseCase;

  void getPostById({required int? postId}) async {
    try {
      emit(PostDetailLoading());
      final post = await _getPostByIdUseCase.execute(postId: postId);
      emit(PostDetailSuccess(post));
    } catch (e) {
      emit(PostDetailFailure());
    }
  }




}
