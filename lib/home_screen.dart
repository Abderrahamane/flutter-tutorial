import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/theme_cubit.dart';
import '../theme/theme_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Theme Switcher")),
          body: Center(
            child: Switch(
              value: state.isDark,
              onChanged: (_) {
                context.read<ThemeCubit>().toggleTheme();
              },
            )
          ),
        );
      },
    );
  }
}
