import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../cubits/add_note_cubit/addnote_cubit.dart';
import 'color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
                onTap: () {
                  currentindex = index;
                  BlocProvider.of<AddnoteCubit>(context).color = colors[index];
                  setState(() {});
                },
                child: ColorItem(
                  isSelected: currentindex == index,
                  color: colors[index],
                )),
          );
        },
        itemCount: colors.length,
      ),
    );
  }
}
