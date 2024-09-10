import 'package:clean_architecture/config/envs/config.dart';
import 'package:clean_architecture/config/envs/environment.dart';
import 'package:clean_architecture/config/theme/app_themes.dart';
import 'package:clean_architecture/presentation/user/domain/usecase/get_all_user_usecase.dart';
import 'package:clean_architecture/presentation/user/presentation/bloc/user_bloc.dart';
import 'package:clean_architecture/widgets/custom_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/presentation/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture/presentation/daily_news/presentation/pages/home/daily_news.dart';
import 'presentation/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.setEnvironment(Environment.development);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = ThemeMode.system;

    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticlesBloc>(
          create: (context) => sl()..add(const GetArticles()),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(sl<GetAllUserUsecase>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme(),
        theme: lightTheme(),
        themeMode: _themeMode,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: Stack(
          children: [
            const DailyNews(),
            if (Config.envConfig.showBanner)
              const Align(
                alignment: Alignment.topRight,
                child: CustomDebugBanner(),
              ),
          ],
        ),
      ),
    );
  }
}
