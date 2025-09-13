import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/modules/add_notes/view/add_notes_screen.dart';
import 'package:notes_app/modules/home/bloc/home_cubit.dart';
import 'package:notes_app/modules/home/bloc/home_state.dart' hide InitialState;

import '../../../core/app_routes.dart';
import '../../../custom-widget/widget/app_bar_design.dart';
import '../../../custom-widget/widget/card_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBarDesign(context),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          var cubit = context.read<HomeCubit>();
          if (state is GetNoteDataSuccessState) {
            return itemsView(state, cubit);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget itemsView(state, cubit) {
    return ListView.separated(
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
    );
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
      exitIconShow: IconButton(
        icon: Icon(Icons.exit_to_app_rounded, color: Colors.black),
        onPressed: () async {
          await HomeCubit().signOut();
          GoRouter.of(context).pushReplacementNamed(AppRouter.loginScreen.name);
        },
      ),
    );
  }
}
