import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youpost/src/data/datasources/post_datasource.dart';
import 'package:youpost/src/data/repositories/post_repository.dart';
import 'package:youpost/src/domain/entities/post.dart';
import 'package:youpost/src/domain/repositories/post_repository.dart';
import 'package:youpost/src/domain/usecases/post_usecases.dart';

class PostListState {
  final List<Post> posts;
  final bool isLoading;
  final bool hasMore;
  final int page;

  PostListState({
    required this.posts,
    required this.isLoading,
    required this.hasMore,
    required this.page,
  });

  PostListState copyWith({
    List<Post>? posts,
    bool? isLoading,
    bool? hasMore,
    int? page,
  }) {
    return PostListState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }
}

final postProvider = StateNotifierProvider<PostNotifier, PostListState>(
  (ref) => PostNotifier(),
);

class PostNotifier extends StateNotifier<PostListState> {
  final IPostDataSource _postDataSource = PostDatasource();
  late final DomainPostRepository _domainPostRepository;
  late final PostUsecases _usecases;

  PostNotifier()
      : super(PostListState(
            posts: [], isLoading: false, hasMore: true, page: 1)) {
    _domainPostRepository = DataPostRepository(_postDataSource);
    _usecases = PostUsecases(_domainPostRepository);
  }

  final int limit = 15;

  Future<void> fetchPosts() async {
    if (state.isLoading) return;
    bool hasMore = state.hasMore;

    state = state.copyWith(isLoading: true);
    final response = await _usecases
        .getAll({'_limit': limit.toString(), '_page': state.page.toString()});

    if (response.length < limit) {
      hasMore = false;
    }
    state = state.copyWith(
      posts: [...state.posts, ...response],
      isLoading: false,
      page: state.page + 1,
      hasMore: hasMore,
    );
  }
}
