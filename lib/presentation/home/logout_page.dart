import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posresto/core/constants/colors.dart';
import 'package:posresto/data/datasource/auth_local_datasource.dart';
import 'package:posresto/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:posresto/presentation/auth/login_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueDarkColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                error: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message),
                      backgroundColor: AppColors.red,
                    ),
                  );
                },
                success: (value) {
                  AuthLocalDataSource().removeAuthData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logout success'),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
              );
            },
            child: ElevatedButton(
              onPressed: () {
                context.read<LogoutBloc>().add(const LogoutEvent.logout());
              },
              child: Text('Logout'),
            ),
          )
        ],
      ),
    );
  }
}
