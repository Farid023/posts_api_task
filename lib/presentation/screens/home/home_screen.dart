import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/di/locator.dart';
import 'package:posts_api/domain/models/post_model.dart';
import 'package:posts_api/presentation/cubits/home/home_cubit.dart';
import 'package:posts_api/presentation/cubits/post_detail/post_detail_cubit.dart';
import 'package:posts_api/presentation/screens/post_detail/post_detail_screen.dart';
import 'package:posts_api/presentation/screens/home/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeFailure) {
            return const Text("Something went wrong");
          } else if (state is HomeSuccess) {
            final List<PostModel> postList = state.data;
            return SizedBox(
              child: ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return PostCard(
                      post: postList[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) =>
                                          PostDetailCubit(locator())
                                            ..getPostById(
                                                postId: postList[index].id),
                                      child: PostDetailScreen(
                                        postId: postList[index].id,
                                      ),
                                    )));
                      },
                    );
                  }),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
