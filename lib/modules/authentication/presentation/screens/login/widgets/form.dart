// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../login_screen.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              AppTextField(
                controller: cubit.email,
                label: "Email",
                validator: (_) => cubit.errors['email'],
              ),
              23.verticalSpace,
              _PasswordField(cubit: cubit),
              33.verticalSpace,
              AppElevatedButton(
                label: "LOGIN",
                fillParent: true,
                onPressed: () {
                  context.read<LoginCubit>().login();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final LoginCubit cubit;

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool isShowing = false;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.cubit.password,
      label: "Password",
      obscureText: isShowing,
      validator: (_) => widget.cubit.errors['password'],
      suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isShowing = !isShowing;
            });
          },
          child: !isShowing
              ? Icon(
                  Icons.visibility_off,
                  color: context.color.primary,
                )
              : Icon(
                  Icons.visibility,
                  color: context.color.primary,
                )),
    );
  }
}
