import 'package:flutter/material.dart';
import '../../../models/note_model.dart';
import '../color_widget/color_item.dart';

import '../../../../constants.dart';

class EidtColorItem extends StatefulWidget {
  const EidtColorItem({super.key, required this.note});
  final Note note;
  @override
  State<EidtColorItem> createState() => _EidtColorItemState();
}

class _EidtColorItemState extends State<EidtColorItem> {
  late int currentindex;
  @override
  void initState() {
    currentindex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

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
                  widget.note.color = colors[index].value;
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
