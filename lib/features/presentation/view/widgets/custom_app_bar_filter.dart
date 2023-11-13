// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/styles/app_styles.dart';

import 'package:hotel_task/features/presentation/view/screens/filter_screen.dart';

import '../screens/sort_by_screen.dart';

class CustomAppBarFilter extends StatelessWidget {
  const CustomAppBarFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: const EdgeInsets.only(bottom: 10, right: 20, left: 20, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.black.withOpacity(
              0.2,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .9,
                  minHeight: 100,
                ),
                builder: (context) {
                  return const FilterModalBottomSheet();
                },
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.filter_list,
                  color: Colors.blue,
                ),
                const SizedBox(width: 6),
                Text(
                  'Filters',
                  style: Styles.style16.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                useSafeArea: true,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .9,
                  minHeight: 100,
                ),
                builder: (context) {
                  return const SortByScreen();
                },
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.sort,
                  color: Colors.blue,
                ),
                const SizedBox(width: 6),
                Text(
                  'Sort',
                  style: Styles.style16.copyWith(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
