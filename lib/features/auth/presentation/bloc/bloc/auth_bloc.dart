
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style_sphere/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:style_sphere/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:style_sphere/features/auth/domain/entities/user_entitiy.dart';
import 'package:style_sphere/features/auth/domain/usecases/login_usecase.dart';
import 'package:style_sphere/features/auth/domain/usecases/logout_usecase.dart';
import 'package:style_sphere/features/auth/domain/usecases/reset_password_usewecase.dart';
import 'package:style_sphere/features/auth/domain/usecases/signup_usecase.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginEvent>(
      (event, emit) async {
        emit(LoginLoadingState());
        LoginUsecase loginUsecase =
            LoginUsecase(authRepository: AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSourceImplWithFirestore()));

        final either = await loginUsecase.call(event.email, event.password);
        either.fold((l) {
          log("fel bloc");
          emit(LoginErrorState(message: 'Login Failed'));
        }, (r) => emit(LoginSuccessState()));
      },
    );

    on<SignupEvent>(
      (event, emit) async {
        emit(SignupLoadingState());
        SignupUsecase signupUsecase =
            SignupUsecase(authRepository: AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSourceImplWithFirestore()));

        final either = await signupUsecase.call(event.name, event.email, event.password);
        either.fold((l) => emit(SignupErrorState(message: l.message)), (r) => emit(SignupSuccessState(user: r)));
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        emit(LogoutLoadingState());
        LogoutUsecase logoutUsecase =
            LogoutUsecase(authRepository: AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSourceImplWithFirestore()));

        final either = await logoutUsecase.call();
        either.fold((l) => emit(LogoutErrorState(message: l.message)), (r) => emit(LogoutSuccessState()));
      },
    );


    on<ResetPassword>(
      (event, emit) async {
        emit(ResetPasswordLoadingState());
        ResetPasswordUsecase resetPasswordUsecase =
            ResetPasswordUsecase(authRepository: AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSourceImplWithFirestore()));

        final either = await resetPasswordUsecase.call(event.userEmail);
        either.fold((l) => emit(ResetPasswordErrorState(message: l.message)), (r) => emit(ResetPasswordSuccessState()));
      },
    );
  }
}

