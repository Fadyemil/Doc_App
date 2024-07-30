import 'package:doc_app/features/login/data/models/login_request_body.dart';
import 'package:doc_app/features/login/data/repos/login_repo.dart';
import 'package:doc_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginresponse) {
        emit(LoginState.Success(loginresponse));
      },
      failure: (error) {
        emit(
          LoginState.Error(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
