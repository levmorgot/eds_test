import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/features/posts/domain/usecases/get_all_posts.dart';
import 'package:eds_test/features/posts/presentation/bloc/posts_list_cubit/posts_list_state.dart';

class PostsListCubit extends Cubit<PostState> {
  final GetAllPostsForUser getAllPosts;

  PostsListCubit({required this.getAllPosts}) : super(PostEmptyState());

  void loadPosts(int userId) async {
    if (state is PostLoadingState) return;

    emit(PostLoadingState());

    final failureOrPosts = await getAllPosts(userId);

    emit(failureOrPosts.fold(
        (failure) => PostErrorState(message: _mapFailureMessage(failure)),
        (posts) => PostLoadedState(posts)));
  }

  String _mapFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server failure';
      case CacheFailure:
        return 'Cache failure';
      default:
        return 'Unexpected Error';
    }
  }
}
