import 'package:flutter/material.dart';
import 'package:hotel_task/features/presentation/view/screens/filter_screen.dart';

class CustomAppBarFilter extends StatelessWidget {
  const CustomAppBarFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
                useSafeArea: true,
                builder: (context) {
                  return const FilterModalBottomSheet();
                },
              );
            },
            child: const Row(
              children: [
                Text('Filters'),
                Icon(Icons.filter_list),
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
            child: const Row(
              children: [
                Text('Sort'),
                Icon(Icons.sort),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<String> sortyBy = [
  'Our recommendation',
  'Rating & Recommended',
  'Price & Recommended',
  'Distance & Recommended',
  'Rating only',
  'Price only',
  'Distance only'
];

class SortByScreen extends StatelessWidget {
  const SortByScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5, top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.white,
              )
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Sort By'),
              Icon(Icons.close),
            ],
          ),
        ),
        ...List.generate(
          sortyBy.length,
          (index) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sortyBy[index],
                ),
                const Divider()
              ],
            ),
          ),
        )
      ],
    );
  }
}
