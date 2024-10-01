import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/note_card.dart';

import '../models/note_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notesList =
            BlocProvider.of<NotesCubit>(context).notes !;
        return ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              print("${notesList[index]}****************************");
              return NoteCard(
                note: notesList[index],
              );
            });
      },
    );
  }
}
