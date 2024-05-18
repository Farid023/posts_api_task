part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  final List<PostModel> data;

  HomeSuccess(this.data);
}
final class HomeFailure extends HomeState {}
