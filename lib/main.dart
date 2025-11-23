import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/screens/home_screen.dart';
import 'cubit/todo_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => TodoCubit(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
