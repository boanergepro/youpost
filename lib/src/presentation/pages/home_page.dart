import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youpost/src/domain/entities/user.dart';
import 'package:youpost/src/presentation/providers/post_provider.dart';
import 'package:youpost/src/presentation/providers/user_provider.dart';
import 'package:youpost/src/presentation/widgets/post_widget.dart';
import 'package:youpost/src/presentation/widgets/user_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(postProvider.notifier).fetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postProvider);
    /*ref.read(postProvider.notifier).fetchPosts();*/

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            right: 20,
            left: 20,
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                const SliverAppBar(
                  title: ListTile(
                    title: Text(
                      'Blog',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Las ultimas noticias',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SliverAppBar(
                  floating: true,
                  elevation: 8.0,
                  primary: true,
                  pinned: true,
                  expandedHeight: 0,
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Posts'),
                      Tab(text: 'Escritores'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (scroll) {
                    if (scroll.metrics.pixels ==
                            scroll.metrics.maxScrollExtent &&
                        !state.isLoading) {
                      ref.read(postProvider.notifier).fetchPosts();
                    }
                    return true;
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: state.posts.length + (state.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == state.posts.length) {
                        return Center(
                          child: state.hasMore
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'No hay mas posts',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                        );
                      }

                      return PostWidget(
                        data: state.posts[index],
                      );
                    },
                  ),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final AsyncValue<List<User>> users =
                        ref.watch(userProvider);

                    return Center(
                      child: switch (users) {
                        AsyncData(:final value) => ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15,
                            ),
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return UserWidget(
                                data: value[index],
                              );
                            },
                          ),
                        AsyncError() => const Text(
                            'Ha ocurrido un error al obtener los escritores'),
                        _ => const CircularProgressIndicator(),
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
