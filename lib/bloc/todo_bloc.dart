import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_state.dart';
import '../models/todo_model.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState.initial());

  void addTodo(String title) {
    final newTodo = Todo(title: title);
    final updatedList = [...state.todos, newTodo];
    emit(state.copyWith(todos: updatedList));
  }

  void toggleTodo(int index) {
    final todo = state.todos[index];
    final updatedTodo = todo.copyWith(isDone: !todo.isDone);

    final updatedList = [...state.todos];
    updatedList[index] = updatedTodo;

    emit(state.copyWith(todos: updatedList));
  }

  void deleteTodo(int index) {
    final updatedList = [...state.todos]..removeAt(index);
    emit(state.copyWith(todos: updatedList));
  }
}
