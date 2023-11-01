import 'package:flutter/material.dart';

import '../constant.dart';
import 'circular_item.dart';

class AddNoteColorsWidget extends StatefulWidget {
  const AddNoteColorsWidget({super.key});

  @override
  State<AddNoteColorsWidget> createState() => _AddNoteColorsWidgetState();
}

class _AddNoteColorsWidgetState extends State<AddNoteColorsWidget> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = kColors.indexOf(colorNote);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              kColors[index];
              currentIndex = index;
            });
            },
          child: ColorItem(
            color: kColors[index],
            isSelected: currentIndex == index,
          ),
        ),
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
