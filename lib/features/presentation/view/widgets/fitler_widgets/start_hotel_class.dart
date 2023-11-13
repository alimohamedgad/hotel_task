// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hotel_task/features/presentation/hotel_cubit/hotel_cubit.dart';

class StarRatingList extends StatelessWidget {
  // final HotelCubit hotelCubit;
  const StarRatingList({
    super.key,
    // required this.hotelCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        final hotelCubit = context.read<HotelCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StarsChild(
              hotelCubit: hotelCubit,
              onTap: () {
                hotelCubit.updateNumberOfStar(0);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_half,
                    color: Colors.orange.shade400,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange.shade400,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            StarsChild(
              hotelCubit: hotelCubit,
              onTap: () {
                hotelCubit.updateNumberOfStar(1);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange.shade400,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange.shade400,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            StarsChild(
              hotelCubit: hotelCubit,
              onTap: () {
                hotelCubit.updateNumberOfStar(2);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange.shade400,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange.shade400,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.star,
                        color: Colors.orange.shade400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            StarsChild(
              hotelCubit: hotelCubit,
              onTap: () {
                hotelCubit.updateNumberOfStar(3);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange.shade400,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.star,
                        color: Colors.orange.shade400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange.shade400,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.star,
                        color: Colors.orange.shade400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            StarsChild(
              hotelCubit: hotelCubit,
              onTap: () {
                hotelCubit.updateNumberOfStar(4);
              },
              child: Stack(
                children: [
                  Positioned(
                    right: 16,
                    bottom: 17,
                    child: Icon(
                      Icons.star,
                      color: Colors.orange.shade400,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange.shade400,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.star,
                            color: Colors.orange.shade400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange.shade400,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.star,
                            color: Colors.orange.shade400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class StarsChild extends StatelessWidget {
  final HotelCubit hotelCubit;

  final Widget child;
  final Function()? onTap;
  const StarsChild({
    Key? key,
    required this.hotelCubit,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: hotelCubit.numberOfStar == 1 ? Colors.black : Colors.orange,
            // color: Colors.orange,
          ),
        ),
        child: child,
      ),
    );
  }
}
