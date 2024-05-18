import '../models/post_model.dart';
import '../repository/post_repository.dart';

class GetPostByIdUseCase {
  GetPostByIdUseCase(this._postRepository);

  final PostRepository _postRepository;

  Future<PostModel> execute({required int? postId}) {
    return _postRepository.getPostById(postId);
  }
}
