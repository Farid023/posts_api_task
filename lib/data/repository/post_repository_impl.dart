import 'package:dio/dio.dart';
import 'package:posts_api/domain/models/post_model.dart';
import 'package:posts_api/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final dio = Dio();

  static const _url = "https://jsonplaceholder.typicode.com";

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await dio.get("$_url/posts");
    if (response.statusCode == 200) {
      final List posts = response.data;
      return posts.map((post) => PostModel.fromJson(post)).toList();
    }
    throw Exception();
  }

  @override
  Future<PostModel> getPostById(int? id) async {
    final response = await dio.get("$_url/posts/$id");
    if (response.statusCode == 200) {
      final post = PostModel.fromJson(response.data);
      return post;
    }
    throw Exception();
  }
}
