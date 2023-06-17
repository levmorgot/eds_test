import 'package:eds_test/common/app_colors.dart';
import 'package:eds_test/features/albums/presentation/bloc/albums_list_cubit/albums_list_cubit.dart';
import 'package:eds_test/features/posts/presentation/bloc/posts_comments_list_cubit/posts_comments_list_cubit.dart';
import 'package:eds_test/features/posts/presentation/bloc/posts_list_cubit/posts_list_cubit.dart';
import 'package:eds_test/features/users/presentation/bloc/users_list_cubit/users_list_cubit.dart';
import 'package:eds_test/features/users/presentation/pages/users_screen.dart';
import 'package:eds_test/locator_service.dart' as di;
import 'package:eds_test/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersListCubit>(
            create: (context) => sl<UsersListCubit>()..loadUsers()),
        BlocProvider<PostsListCubit>(create: (context) => sl<PostsListCubit>()),
        BlocProvider<PostsCommentsListCubit>(
            create: (context) => sl<PostsCommentsListCubit>()),
        BlocProvider<AlbumsListCubit>(
            create: (context) => sl<AlbumsListCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.mainBackground,
          colorScheme: const ColorScheme.dark()
              .copyWith(background: AppColors.mainBackground),
        ),
        title: 'Test Task Application',
        home: HomePage(),
      ),
    );
  }
}
