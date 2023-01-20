import 'package:flutter/material.dart';

import 'package:blog_app_riverpod/features/home/list_all_blogs/presentation/widgets/edit_delete_button.dart';
import 'package:blog_app_riverpod/features/home/list_all_blogs/state/all_blogs_state.dart';

class AllBlogsListView extends StatelessWidget {
  final void Function() onRefresh;
  const AllBlogsListView({
    Key? key,
    required this.onRefresh,
    required this.blogState,
  }) : super(key: key);
  final AllBlogsLoadedState blogState;

  @override
  Widget build(BuildContext context) {
    return blogState.blogs.isEmpty?const Center(child: Text("No Blogs Added Yet!"),): RefreshIndicator(
      onRefresh:() async=> onRefresh() ,
      child: ListView.builder(
        itemCount: blogState.blogs.length,
        itemBuilder: (context, index) {
          final blog = blogState.blogs[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              shadowColor: Colors.teal.shade600,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: CircleAvatar(
                            child: Text(blog.id.toString()),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                          //height:  MediaQuery.of(context).size.height / 30,
                        ),
                        Text(
                          " ${blog.title.toUpperCase()}",
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.teal.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 50,
                      endIndent: 10,
                      thickness: 1,
                      color: Colors.teal.shade100,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 7, right: 7, bottom: 7),
                      child: Text(
                        blog.body,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black38,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    EditDeleteButton(
                      blog: blog,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
