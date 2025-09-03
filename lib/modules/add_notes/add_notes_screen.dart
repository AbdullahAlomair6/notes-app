import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/add_notes/bloc/add_note_cubit.dart';
import 'package:notes_app/modules/add_notes/bloc/add_note_state.dart';
import 'package:notes_app/modules/home/bloc/home_cubit.dart';

import '../../custom-widget/widget/custom_button.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (BuildContext context, state) {
          var cubit = context.read<AddNoteCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Add New Note'),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: cubit.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Note Here',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: cubit.noteController,
                      validator: (String? value) {
                        return cubit.addNoteValidator(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Note Here! ',
                        filled: true,
                        fillColor: Colors.amber[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: 10,
                      cursorColor: Colors.black,
                    ),
                    Spacer(),
                    CustomButton(
                      text: 'dd Note',
                      icons: Icons.add,
                      onPressed: () async {
                        cubit.checkOnPressed(context);
                        context.read<HomeCubit>().getNoteData();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
