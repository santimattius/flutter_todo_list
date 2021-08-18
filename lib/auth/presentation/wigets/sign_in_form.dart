import 'package:arch_flutter_ddd/auth/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      builder: (context, state) {
        return Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                const Icon(Icons.account_circle),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value)),
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (failure) => failure.maybeMap(
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email), labelText: 'Email'),
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.passwordChanged(value)),
                  validator: (_) =>
                      context.read<SignInFormBloc>().state.password.value.fold(
                            (failure) => failure.maybeMap(
                              shortPassword: (_) => 'Short password',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                  autocorrect: false,
                  obscureText: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed());
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed());
                        },
                        child: const Text('REGISTER'),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<SignInFormBloc>()
                        .add(const SignInFormEvent.signInWithGooglePressed());
                  },
                  child: const Text(
                    'SIGN IN WITH GOOGLE',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ));
      },
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () => {},
            (either) => either.fold(
                  (failure) => {
                    _showSnackBar(
                        context,
                        failure.map(
                            cancelledByUser: (_) => 'Cancelled',
                            serverError: (_) => 'Server error',
                            emailAlreadyInUse: (_) => 'Email already in use',
                            invalidEmailAndPasswordCombination: (_) =>
                                'Invalid email and password combination')),
                  },
                  (_) => {
                    //TODO:navigate
                  },
                ));
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
