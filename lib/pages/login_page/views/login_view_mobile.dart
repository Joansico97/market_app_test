import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app_test/core/utils/utils.dart';
import 'package:market_app_test/pages/login_page/riverpod/login_page_states.dart';

class LoginViewMobile extends ConsumerWidget {
  const LoginViewMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginPageProvider);
    final notifier = ref.watch(loginPageProvider.notifier);

    return Container(
      height: size.fullHeight(context),
      width: size.fullWidth(context),
      padding: size.horizontal(context, .1),
      color: colors.primaryColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Iniciar sesión',
              style: textStyles.large(
                color: colors.white,
              ),
            ),
            SizedBox(height: size.height(context, .1)),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: colors.textColor,
                      ),
                      filled: true,
                      fillColor: colors.white,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      labelText: 'Correo Electrónico',
                      labelStyle: textStyles.small(
                        color: colors.textSecondaryColor,
                      ),
                    ),
                    style: textStyles.small(
                      color: colors.textColor,
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    // keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: colors.textColor,
                      ),
                      filled: true,
                      fillColor: colors.white,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      labelText: 'Contraseña',
                      labelStyle: textStyles.small(
                        color: colors.textSecondaryColor,
                      ),
                    ),
                    style: textStyles.small(
                      color: colors.textColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height(context, .1)),
            InkWell(
              onTap: () async {
                await ref.read(loginPageProvider.notifier).login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go('/home');
                });
              },
              child: Container(
                height: size.height(context, .07),
                width: size.fullWidth(context),
                decoration: BoxDecoration(
                  color: colors.secondaryColor,
                  borderRadius: size.borderRadius(context, .01),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Iniciar sesión',
                  style: textStyles.medium(
                    color: colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
