// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/hotel_model.dart';
import '../../hotel_cubit/hotel_cubit.dart';
import '../widgets/filter_widget.dart';
import '../widgets/hotel_item.dart';

class HotelBody extends StatelessWidget {
  final List<HotelModel> filterList;

  const HotelBody({
    super.key,
    required this.filterList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarFilter(),
        BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            final hotelCubit = context.read<HotelCubit>();

            if (state is GetHotelLoading) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: filterList.isEmpty
                      ? hotelCubit.hotels.length
                      : filterList.length,
                  itemBuilder: (context, index) {
                    final hotelModel = filterList.isEmpty
                        ? hotelCubit.hotels[index]
                        : filterList[index];
                    return Stack(
                      children: [
                        Column(
                          children: [
                            HotelItem(hotelModel: hotelModel),
                          ],
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 10,
                                  blurRadius: 1,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
