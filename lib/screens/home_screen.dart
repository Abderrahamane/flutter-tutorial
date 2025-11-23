import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_state.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("Todo App (Cubit)")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Enter text',
                          border: OutlineInputBorder(),
                        ),
                      ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: (){
                        if (controller.text.isNotEmpty){
                          context.read<TodoCubit>().addTodo(controller.text);
                          controller.clear();
                        }
                      },
                      child: Text("Add"),
                  ),
                ],
              ),
            ),

            Expanded(
                child: BlocBuilder<TodoCubit, TodoState>(
                  builder: (context, state){
                    return ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index){
                          final todo = state.todos[index];
                          return ListTile(
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            leading: Checkbox(
                                value: todo.isDone,
                                onChanged: (value) {
                                  context.read<TodoCubit>().toggleTodo(index);
                                }
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  context.read<TodoCubit>().deleteTodo(index);
                                },
                                icon: Icon(Icons.delete, color: Colors.red)
                            ),
                          );
                        }
                    );
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
