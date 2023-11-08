import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mcqer/models/UserModel.dart';
import 'package:mcqer/network/UserRepository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;


  UserBloc(this._userRepository) : super(UserLoadingState()) {

    on<LoadUserEvent>((event, emit)async {
      emit(UserLoadingState());
      try {
        final users=await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });

    on<UserClickEvent>((event, emit) {
      // Handle the user click event here
      // You can access the clicked user using event.user
    });

  }


}
