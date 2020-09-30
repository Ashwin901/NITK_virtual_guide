import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'wec_bloc/state.dart';
import 'wec_bloc/guide_bloc.dart';
import 'screens/guide_screen.dart';
import 'screens/news_screen.dart';
import 'screens/welcome_screen.dart';
import 'theme_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return GuideBloc(GuideState());
          },
          child: GuideScreen(),
        ),
        BlocProvider(
          create: (context) {
            return GuideBloc(GuideState());
          },
          child: MainScreen(),
        )
      ],
      child: BlocBuilder<GuideBloc, GuideState>(
        builder: (context, GuideState state) {
          var theme = lightTheme;
          if(state is ChangeThemeState)
            {
                theme = state.theme;
            }

          return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: WelcomeScreen(),
          );
        },
      ),
    );
  }
}
