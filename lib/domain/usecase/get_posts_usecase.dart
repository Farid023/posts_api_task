import 'package:posts_api/domain/models/post_model.dart';

import '../repository/post_repository.dart';

class GetPostsUseCase {
  GetPostsUseCase(this._postRepository);

  final PostRepository _postRepository;

  Future<List<PostModel>> execute() {
    return _postRepository.getPosts();
  }
}
