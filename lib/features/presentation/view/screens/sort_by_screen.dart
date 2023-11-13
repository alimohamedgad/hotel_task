import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_task/core/styles/app_styles.dart';
import 'package:hotel_task/features/presentation/hotel_cubit/hotel_cubit.dart';
import 'package:hotel_task/features/presentation/view/screens/hotel_view.dart';

import '../../../../core/dumy_data.dart';
import '../widgets/sort_widget/sort_by_text_app_bar.dart';

class SortByScreen extends StatelessWidget {
  const SortByScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: ListView(
        children: [
          const SortByTextAppBar(),
          const SizedBox(height: 20),
          ...List.generate(
            sortByList.length,
            (index) => BlocBuilder<HotelCubit, HotelState>(
              builder: (context, state) {
                final hotelCubit = context.read<HotelCubit>();
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 5.0),
                  child: InkWell(
                    onTap: () {
                      hotelCubit.updateCurrentIndex(index);
                      hotelCubit.updateSort();
                      sortHotels(index, hotelCubit);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HotelView();
                        }),
                        (route) => false,
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              sortByList[index],
                              style:
                                  Styles.style14.copyWith(color: Colors.black),
                            ),
                            const Spacer(),
                            hotelCubit.currentIndex == index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void sortHotels(int index, HotelCubit hotelCubit) {
    if (sortByList[index] == 'Rating only') {
      hotelCubit.hotels.sort((a, b) => hotelCubit.ascendingHotels
          ? a.starts.compareTo(b.starts)
          : b.starts.compareTo(a.starts));
    } else if (sortByList[index] == 'Price only') {
      hotelCubit.hotels.sort((a, b) => hotelCubit.ascendingHotels
          ? a.price.compareTo(b.price)
          : b.price.compareTo(a.price));
    } else {
      hotelCubit.hotels.sort((a, b) => hotelCubit.ascendingHotels
          ? a.price.compareTo(b.price)
          : b.price.compareTo(a.price));
      hotelCubit.hotels.sort((a, b) => hotelCubit.ascendingHotels
          ? a.reviewScore.compareTo(b.reviewScore)
          : b.reviewScore.compareTo(a.reviewScore));
      hotelCubit.hotels.sort((a, b) => hotelCubit.ascendingHotels
          ? a.starts.compareTo(b.starts)
          : b.starts.compareTo(a.starts));
    }
  }
}
