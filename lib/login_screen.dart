import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login/login_cubit.dart';
import 'login/login_state.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(title: Text("Login")),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      errorText: state.errorMessage,
                    ),
                    onChanged: (value) {
                      context.read<LoginCubit>().updateEmail(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      errorText: state.errorMessage
                    ),
                    onChanged: (value) {
                      context.read<LoginCubit>().updatePassword(value);
                    },
                  ),
                  const SizedBox(height: 30),

                  state.isLoading?
                      CircularProgressIndicator()
                      : ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().submitLogin();
                      },
                      child: Text("Login")
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


