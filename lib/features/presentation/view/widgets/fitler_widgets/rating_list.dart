// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          (index) => BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) {
              final hotelCubit = context.read<HotelCubit>();

              return InkWell(
                onTap: () {
                  hotelCubit.updateCurrentIndex(index);

                  hotelCubit.numberOfRating = ratingList[index];
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5,
                        color: hotelCubit.currentIndex == index
                            ? Colors.black
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(6),
                    color: hotelCubit.currentIndex == index
                        ? Colors.white
                        : colors[index],
                  ),
                  child: Center(
                    child: Text(
                      '${ratingList[index]}+',
                      style: Styles.style12.copyWith(
                        color: hotelCubit.currentIndex == index
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
