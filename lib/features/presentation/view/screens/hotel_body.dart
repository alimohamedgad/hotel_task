// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/hotel_model.dart';
import '../../hotel_cubit/hotel_cubit.dart';
import '../widgets/custom_app_bar_filter.dart';
import '../widgets/hotel_item.dart';

class HotelBody extends StatelessWidget {
  final List<HotelModel> filterHotelList;

  const HotelBody({
    super.key,
    required this.filterHotelList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        final hotelCubit = context.read<HotelCubit>();

        return Column(
          children: [
            const CustomAppBarFilter(),
            Expanded(
              child: state is GetHotelLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: filterHotelList.isEmpty
                          ? hotelCubit.hotels.length
                          : filterHotelList.length,
                      itemBuilder: (context, index) {
                        final hotelModel = filterHotelList.isEmpty
                            ? hotelCubit.hotels[index]
                            : filterHotelList[index];
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
                              child: GestureDetector(
                                onTap: () {},
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
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
