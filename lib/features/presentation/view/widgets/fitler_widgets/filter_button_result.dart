import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../hotel_cubit/hotel_cubit.dart';
import '../../screens/hotel_view.dart';

class FilterButtonResult extends StatelessWidget {
  const FilterButtonResult({
    super.key,
    required this.hotelCubit,
  });

  final HotelCubit hotelCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {
          final filterList = hotelCubit.getFilterListData(
            hotelCubit.sliderValue.toInt(),
            hotelCubit.numberOfRating,
            hotelCubit.numberOfStar,
          );
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return HotelView(filterList: filterList);
            },
          ), (route) => false);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          'Show results',
          style: Styles.style14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
