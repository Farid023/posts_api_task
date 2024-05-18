


import 'package:get_it/get_it.dart';
import 'package:posts_api/data/repository/post_repository_impl.dart';
import 'package:posts_api/domain/models/post_model.dart';
import 'package:posts_api/domain/repository/post_repository.dart';
import 'package:posts_api/domain/usecase/get_post_by_id_usecase.dart';
import 'package:posts_api/domain/usecase/get_posts_usecase.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  locator.registerLazySingleton(()=> PostModel());
  locator.registerLazySingleton(()=> PostRepositoryImpl());
  locator.registerLazySingleton<PostRepository>(()=> PostRepositoryImpl());

  locator.registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(locator()));
  locator.registerLazySingleton<GetPostByIdUseCase>(() => GetPostByIdUseCase(locator()));





}
