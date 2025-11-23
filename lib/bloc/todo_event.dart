import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();
}

// 1. Add Todo
class AddTodoEvent extends TodoEvent {
  final String title;
  const AddTodoEvent(this.title);

  @override
  List<Object?> get props => [title];
}

// 2. Toggle Todo
class ToggleTodoEvent extends TodoEvent {
  final int index;
  const ToggleTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}

// 3. Delete Todo
class DeleteTodoEvent extends TodoEvent {
  final int index;
  const DeleteTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}