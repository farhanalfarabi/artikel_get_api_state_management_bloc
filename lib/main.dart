import 'package:artikel_statemanagement_get_api_bloc/bloc/product_bloc.dart';
import 'package:artikel_statemanagement_get_api_bloc/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProductEvent()),
      child: const MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
