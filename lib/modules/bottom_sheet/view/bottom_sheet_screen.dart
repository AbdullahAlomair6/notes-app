import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom-widget/widget/custom_edittext.dart';
import '../bloc/bottom_sheet_cubit.dart';
import '../bloc/bottom_sheet_state.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BottomSheetCubit();
    return BlocProvider(
      create: (context) => BottomSheetCubit(),
      child: BlocBuilder<BottomSheetCubit, BottomSheetState>(
        builder:
            (context, state) => Container(
              height: 250,
              key: cubit.formKey,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomEdittext(
                      label: 'Note',
                      hint: 'Write your note',
                      controller: cubit.noteController
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: ElevatedButton(
                        onPressed: () {
                        //  final note = cubit.noteController.text;
                         //cubit.addNote(note);
                         Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
