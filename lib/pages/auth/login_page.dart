import 'package:flutter/material.dart';
import 'package:lamna/pages/auth/register_page.dart';
import 'package:lamna/utils/color_constants.dart';
import 'package:lamna/utils/font_constants.dart';
import 'package:lamna/utils/widgets/buttons/button_large.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool enable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'lämna',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 50,
                color: ColorConstants.greenLightAppColor,
                fontFamily: FontConstants.principalFont,
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            "Adresse email",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: FontConstants.principalFont,
                                fontSize: 18,
                                color: ColorConstants.greenDarkAppColor),
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'johndoe@gmail.com',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (data) {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              enable = false;
                            } else {
                              enable = true;
                            }
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            "Mot de passe",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: FontConstants.principalFont,
                                fontSize: 18,
                                color: ColorConstants.greenDarkAppColor),
                          ),
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Minimum 8 caractères',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                          ),
                          onChanged: (data) {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              enable = false;
                            } else {
                              enable = true;
                            }
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: ButtonLarge(
                            text: "Se connecter",
                            color: enable
                                ? ColorConstants.greenLightAppColor
                                : Colors.grey,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              ),
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: "Compte n'existe pas ?",
                                    style: TextStyle(
                                        color: ColorConstants.blackAppColor),
                                  ),
                                  TextSpan(
                                    text: " S'inscrire ",
                                    style: TextStyle(
                                        color:
                                            ColorConstants.greenLightAppColor,
                                        fontSize: 15,
                                        fontFamily: FontConstants.principalFont,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
