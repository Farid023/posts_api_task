import 'package:flutter/material.dart';
import 'package:posts_api/domain/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post, this.onTap});

  final PostModel post;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.lightGreen.shade200,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(post.id.toString()),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.title.toString()),
                      SizedBox(height: 8),
                      Text(post.body.toString())
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
