import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_5_mobile/bloc/logged_in_bloc.dart';
import 'package:lab_5_mobile/bloc/selected_view_bloc.dart';
import 'package:lab_5_mobile/home_page.dart';

void main() {
  runApp(MainApp());
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
                    return LoginView();
                  } else {
                    return PushToHome();
                  }
                },
              );
            },
          )),
    );
  }
}

class LoginView extends StatefulWidget {
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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: [
              Text("Welcome!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
              SizedBox(
                height: 20,
              ),
              submitted
                  ? Container(
                      decoration: BoxDecoration(
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
                            Text(
                                "Enter the activation code sent to your phone."),
                            TextField(
                              controller: otp,
                              decoration:
                                  InputDecoration(hintText: "Enter code here"),
                            ),
                            Text(
                              "${otp.text.length}/6",
                              style: TextStyle(fontSize: 11),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<LoggedInBloc>()
                                      .add(LogInEvent());
                                },
                                child: Text("Activate")),
                          ],
                        ),
                      ))
                  : Container(
                      decoration: BoxDecoration(
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
                            Text(
                                "Enter your phone number to activate your account."),
                            TextField(
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
                                Text("Agree to terms and Services")
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(
                                    () => submitted = true,
                                  );
                                },
                                child: Text("Get Activation Code")),
                          ],
                        ),
                      )),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
