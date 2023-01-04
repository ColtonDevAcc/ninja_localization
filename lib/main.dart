import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ninja_localization/app/pages/home_screen.dart';
import 'package:ninja_localization/app/state/app/app_cubit.dart';
import 'package:ninja_localization/app/state/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // state injection in a pretty simple way
    return StateProvider(
        // i would usually use a MateriaApp.router for adding links to app, but this is just a simple example
        child: BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          home: Builder(builder: (context) {
            //detect user device language after initialization of localization
            if (state.language == null) {
              context.read<AppCubit>().changeLanguage(Localizations.localeOf(context).languageCode);
            }
            return const HomeScreen();
          }),
          theme: ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: const ColorScheme(
              surfaceVariant: Color.fromRGBO(242, 241, 254, 1),
              surface: Color.fromRGBO(244, 246, 246, 1),
              background: Color.fromRGBO(249, 249, 249, 1),
              brightness: Brightness.light,
              error: Color.fromRGBO(242, 82, 82, 1),
              onBackground: Color.fromRGBO(36, 42, 47, 1),
              onError: Colors.white,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Color.fromRGBO(36, 42, 47, 1),
              secondaryContainer: Color.fromRGBO(234, 248, 253, 1),
              errorContainer: Color.fromRGBO(255, 244, 243, 1),
              onSurfaceVariant: Color.fromRGBO(140, 140, 140, 1),
              tertiaryContainer: Color.fromRGBO(226, 244, 226, 1),
              primary: Color.fromRGBO(36, 42, 47, 1),
              secondary: Color.fromRGBO(102, 159, 229, 1),
              tertiary: Color.fromRGBO(87, 54, 232, 1),
            ),
          ),
          locale: Locale(context.read<AppCubit>().state.language ?? 'en', ''),
          localizationsDelegates: const [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
            Locale('fr', ''),
            Locale('de', ''),
            Locale('it', ''),
            Locale('pt', ''),
            Locale('ru', ''),
            Locale('zh', ''),
          ],
        );
      },
    ));
  }
}
