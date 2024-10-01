import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubits/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';

import '../constant.dart';

class EditNoteColors extends StatefulWidget {
  const EditNoteColors({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditNoteColors> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<EditNoteColors> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = KColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 3,
      child: ListView.builder(
          itemCount: KColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = KColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: KColors[index],
                  selected: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
