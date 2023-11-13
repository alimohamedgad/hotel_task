// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_task/features/presentation/hotel_cubit/hotel_cubit.dart';

class StarRatingList extends StatelessWidget {
  final HotelCubit hotelCubit;
  const StarRatingList({
    super.key,
    required this.hotelCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StarsChild(
          onTap: () {
            hotelCubit.updateNumberOfStar(1);
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
          onTap: () {
            hotelCubit.updateNumberOfStar(2);

            print(hotelCubit.numberOfStar);
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
          onTap: () {
            hotelCubit.updateNumberOfStar(3);
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
          onTap: () {
            hotelCubit.updateNumberOfStar(4);
            print(hotelCubit.numberOfStar);
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
          onTap: () {
            hotelCubit.updateNumberOfStar(5);
            // print(widget.hotelCubit.numberOfStar);
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
  }
}

class StarsChild extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const StarsChild({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: context.read<HotelCubit>().updateNumberOfStar(
                        context.read<HotelCubit>().numberOfStar) ==
                    context.read<HotelCubit>().numberOfStar
                ? Colors.orange
                : Colors.red,
          ),
        ),
        child: child,
      ),
    );
  }
}
