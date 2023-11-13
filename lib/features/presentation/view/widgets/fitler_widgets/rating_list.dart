// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_task/features/presentation/hotel_cubit/hotel_cubit.dart';

import '../../../../../core/dumy_data.dart';
import '../../../../../core/styles/app_styles.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(
          ratingList.length,
          (index) => InkWell(
            onTap: () {
              context.read<HotelCubit>().numberOfRating = ratingList[index];
              log(context.read<HotelCubit>().numberOfRating.toString());
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colors[index],
              ),
              child: Center(
                child: Text(
                  '${ratingList[index]}+',
                  style: Styles.style14.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        // Icon(Icons.star, color: Colors.yellow),
        // Icon(Icons.star, color: Colors.yellow),
        // Icon(Icons.star, color: Colors.yellow),
        // Icon(Icons.star, color: Colors.grey),
        // Icon(Icons.star, color: Colors.grey),
      ],
    );
  }
}
