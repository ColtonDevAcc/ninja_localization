import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninja_localization/app/state/app/app_cubit.dart';

class StateProvider extends StatelessWidget {
  final Widget child;
  const StateProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AppCubit>(create: (context) => AppCubit())],
      child: child,
    );
  }
}
