import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/styles/app_styles.dart';

class SortByTextAppBar extends StatelessWidget {
  const SortByTextAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.white,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .5,
            child: Text(
              'Sort By',
              textAlign: TextAlign.end,
              style: Styles.style18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
