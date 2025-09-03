import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/modules/add_notes/add_notes_screen.dart';
import 'package:notes_app/modules/add_notes/bloc/add_note_cubit.dart';
import 'package:notes_app/modules/add_notes/bloc/add_note_state.dart';
import 'package:notes_app/modules/home/bloc/home_cubit.dart';
import 'package:notes_app/modules/home/bloc/home_state.dart' hide InitialState;

import '../../core/app_routes.dart';
import '../../custom-widget/widget/app_bar_design.dart';
import '../../custom-widget/widget/card_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getNoteData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, state) {
          var cubit = context.read<HomeCubit>();
          if (state is GetNoteDataSuccessState) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: _appBarDesign(context),
              body: ListView.separated(
                itemBuilder:
                    (context, index) => CardItems(
                      text: "${state.response[index]['note']}",
                      editOnPressed: () {},
                      deleteOnPressed: () {
                        cubit.deleteData(state.response[index]);
                      },
                    ),
                separatorBuilder: (context, index) => Container(),
                itemCount: state.response.length,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

AppBarDesign _appBarDesign(context) {
  return AppBarDesign(
    title: 'Notes App',
    onPressedIcon: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return AddNotesScreen();
          },
        ),
      );
    },
    exitIconShow: true,
    onPressedIconExit: () async {
      await HomeCubit().signOut();
      GoRouter.of(context).pushReplacementNamed(AppRouter.loginScreen.name);
    },
  );
}
