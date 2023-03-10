import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninja_localization/app/state/app/app_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              AppLocalizations.of(context)?.helloUser ?? 'Hello User',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Center(
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) => previous.language != current.language,
                builder: (context, state) {
                  return DropdownButton(
                    borderRadius: BorderRadius.circular(8),
                    dropdownColor: Theme.of(context).colorScheme.surface,
                    value: state.language,
                    items: const [
                      //drop down of several supported languages
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('πΊπΈ English'),
                      ),
                      DropdownMenuItem(
                        value: 'es',
                        child: Text('πͺπΈ Spanish'),
                      ),
                      DropdownMenuItem(
                        value: 'fr',
                        child: Text('π«π· French'),
                      ),
                      DropdownMenuItem(
                        value: 'de',
                        child: Text('π©πͺ German'),
                      ),
                      DropdownMenuItem(
                        value: 'it',
                        child: Text('π?πΉ Italian'),
                      ),
                      DropdownMenuItem(
                        value: 'pt',
                        child: Text('π΅πΉ Portuguese'),
                      ),
                      DropdownMenuItem(
                        value: 'ru',
                        child: Text('π·πΊ Russian'),
                      ),
                      DropdownMenuItem(
                        value: 'zh',
                        child: Text('π¨π³ Chinese'),
                      ),
                    ],
                    onChanged: (value) => context.read<AppCubit>().changeLanguage(value ?? 'en'),
                  );
                },
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
