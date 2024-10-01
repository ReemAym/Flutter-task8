import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_note_colors.dart';

import 'custom_icon.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Note',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // widget.note.title = title ?? widget.note.title;
              // widget.note.content = content ?? widget.note.content;
              // widget.note.save();
              // Navigator.pop(context);
            },
            icon: CustomIcon(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.done_rounded,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 16,
          ),
          child: Column(
            children: [
              CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                hint: widget.note.title,
                initialValue: widget.note.title,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                onChanged: (value) {
                  content = value;
                },
                hint: widget.note.content,
                initialValue: widget.note.content,
                maxLines: 5,
              ),
               EditNoteColors(note: widget.note,),
            ],
          ),
        ),
      ),
    );
  }
}
