import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_5_mobile/bloc/logged_in_bloc.dart';
import 'package:lab_5_mobile/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  bool isLogged = false;

  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoggedInBloc(),
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Builder(
            builder: (context) {
              return BlocBuilder<LoggedInBloc, bool>(
                builder: (context, state) {
                  if (state == false) {
                    return const LoginView();
                  } else {
                    return const PushToHome();
                  }
                },
              );
            },
          )),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool checkmark = false;
  bool submitted = false;
  int length = 0;
  TextEditingController otp = TextEditingController();

  void _updateLength() {
    if (otp.text.length > 6) {
      otp.text = otp.text.substring(0, 5);
    }
    setState(() {
      length = otp.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    otp.addListener(_updateLength);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
              const SizedBox(
                height: 20,
              ),
              submitted
                  ? Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black87,
                                spreadRadius: -4,
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                                "Enter the activation code sent to your phone."),
                            TextField(
                              controller: otp,
                              decoration:
                                  const InputDecoration(hintText: "Enter code here"),
                            ),
                            Text(
                              "${otp.text.length}/6",
                              style: const TextStyle(fontSize: 11),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<LoggedInBloc>()
                                      .add(LogInEvent());
                                },
                                child: const Text("Activate")),
                          ],
                        ),
                      ))
                  : Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black87,
                                spreadRadius: -4,
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                                "Enter your phone number to activate your account."),
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: "Enter your phone number."),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: checkmark,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          checkmark = value!;
                                        },
                                      );
                                    }),
                                const Text("Agree to terms and Services")
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(
                                    () => submitted = true,
                                  );
                                },
                                child: const Text("Get Activation Code")),
                          ],
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}

class PushToHome extends StatefulWidget {
  const PushToHome({
    super.key,
  });

  @override
  State<PushToHome> createState() => _PushToHomeState();
}

class _PushToHomeState extends State<PushToHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Home(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          semanticsLabel: 'Circular progress indicator',
        ),
        Text("Loading..."),
      ],
    )));
  }
}
