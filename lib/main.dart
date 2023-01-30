import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/di/injection.dart' as di;
import 'core/di/injection.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/cubit/state.dart';
import 'core/util/resources/bloc_observer_manager.dart';
import 'features/home/presentation/controller/home_cubit.dart';
import 'features/login/presentation/controller/login_cubit.dart';
import 'features/login/presentation/screens/splash_screen.dart';
import 'features/register/presentation/controller/register_cubit.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  bool isRtl = false;


  String translation = await rootBundle.loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');

  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    isRtl: isRtl,
    widget: const SplashScreen(),
    translation: translation,
  ));

}

class MyApp extends StatelessWidget {
  final bool isRtl;
  final Widget widget;
  final String translation;

  const MyApp({
    Key? key,
    required this.isRtl,
    required this.widget,
    required this.translation,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<AppBloc>()
            ..setThemes(
              rtl: isRtl,
            )
            ..setTranslation(
              translation: translation,
            )
            ..connectivityListener(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<RegisterCubit>(),
        ),
        // BlocProvider(
        //   create: (context) => sl<HomeCubit>(),
        // ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Bluezone',
            debugShowCheckedModeBanner: false,
            themeMode:ThemeMode.light,
            theme: AppBloc.get(context).lightTheme,
            // initialRoute: Routes.splash,
            // routes: Routes.routes,
            home: widget,
          );
        },
      ),
    );
  }
}

