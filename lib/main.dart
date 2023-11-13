import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_task/core/service_locator/service_locator.dart';
import 'package:hotel_task/features/presentation/view/screens/hotel_view.dart';
import 'features/presentation/hotel_cubit/hotel_cubit.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HotelCubit>()..getHotel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HotelView(),
      ),
    );
  }
}
