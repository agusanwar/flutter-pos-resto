import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posresto/core/constants/colors.dart';
import 'package:posresto/data/datasource/auth_local_datasource.dart';
import 'package:posresto/data/datasource/auth_remote_datasource.dart';
import 'package:posresto/data/datasource/product_local_datasource.dart';
import 'package:posresto/data/datasource/product_remote_datasource.dart';
import 'package:posresto/presentation/auth/bloc/login/login_bloc.dart';
import 'package:posresto/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:posresto/presentation/auth/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posresto/presentation/home/pages/bloc/local_product/local_product_bloc.dart';
import 'package:posresto/presentation/home/pages/dashboard_page.dart';
import 'package:posresto/presentation/setting/bloc/sync_product/sync_product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            AuthRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(
            AuthRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => SyncProductBloc(
            ProductRemoteDatasource(),
          ),
        ),
        // add .instance if from database local
        BlocProvider(
          create: (context) => LocalProductBloc(
            ProductLocalDatasource.instance,
          ),
        ),
      ],
      child: MaterialApp(
        title: "Narve POS",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.quicksandTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        home: FutureBuilder<bool>(
            future: AuthLocalDataSource().isAuthDataExists(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!) {
                  return const DashboardPage();
                } else {
                  return const LoginPage();
                }
              }
              return const Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              );
            }),
      ),
    );
  }
}
