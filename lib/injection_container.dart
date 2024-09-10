import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:clean_architecture/presentation/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/presentation/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/presentation/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture/presentation/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/presentation/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture/presentation/user/data/data_sources/user_api_service.dart';
import 'package:clean_architecture/presentation/user/data/repository_impl/user_repository_implementation.dart';
import 'package:clean_architecture/presentation/user/domain/repositories/user_repository.dart';
import 'package:clean_architecture/presentation/user/domain/usecase/get_all_user_usecase.dart';
import 'package:clean_architecture/presentation/user/presentation/bloc/user_bloc.dart';
import 'presentation/daily_news/data/data_sources/local/app_database.dart';
import 'presentation/daily_news/domain/usecases/get_saved_article.dart';
import 'presentation/daily_news/domain/usecases/remove_article.dart';
import 'presentation/daily_news/domain/usecases/save_article.dart';
import 'presentation/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerLazySingleton<UserApiService>(() => UserApiService(sl<Dio>()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl<UserApiService>()));

  //UseCases

    // Article
      sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

    // All User
      sl.registerLazySingleton(() => GetAllUserUsecase(sl<UserRepository>()));

    // Get All Save Article
      sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
      
    // Save Article
      sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

    // Remove Article
      sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory(() => UserBloc(sl<GetAllUserUsecase>()));

  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
