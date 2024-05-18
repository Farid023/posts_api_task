part of 'post_detail_cubit.dart';

@immutable
sealed class PostDetailState {}

final class PostDetailInitial extends PostDetailState {}

final class PostDetailLoading extends PostDetailState {}

final class PostDetailSuccess extends PostDetailState {
  PostDetailSuccess(this.data);

  final PostModel data;
}

final class PostDetailFailure extends PostDetailState {}
