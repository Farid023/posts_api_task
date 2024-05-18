import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/presentation/cubits/post_detail/post_detail_cubit.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key, required this.postId});

  final int? postId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Detail")),
      body: BlocBuilder<PostDetailCubit, PostDetailState>(
          builder: (context, state) {
        if (state is PostDetailInitial || state is PostDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostDetailFailure) {
          return const Center(child: Text("Something went wrong."));
        } else if (state is PostDetailSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("post ID: ${state.data.id}"),
                const SizedBox(height: 20),
                Text("Title: ${state.data.title}"),
                const SizedBox(height: 20),
                Text("Body: ${state.data.body}"),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
