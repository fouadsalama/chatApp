import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool? isSelected;
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(message: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(message: 'email already exists'));
      }
    } catch (e) {
      emit(RegisterFailure(message: 'there was an error please try again '));
    }
  }

  void selected() {
    emit(RegisterTrue(isSelected: true));

    emit(RegisterFalse());
  }
}
