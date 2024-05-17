import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}


class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 3}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text("Login"));
  }
}

class InvitePage extends StatelessWidget {
  InvitePage({super.key, required this.title});
  int title;
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invitation Sent'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('The engineer will be notifed soon.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          centerTitle: true,
          title: Text("Factory $title"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Invitation",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              Text("Invite users",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Padding(
                padding: MediaQuery.of(context).size.width < 600
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1)
                    : EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Align(
                  child: Text(
                    "Owner's Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: MediaQuery.of(context).size.width < 600
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1)
                    : EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter name here"),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              Padding(
                padding: MediaQuery.of(context).size.width < 600
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1)
                    : EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Align(
                  child: Text(
                    "Owner's Phone Number",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: MediaQuery.of(context).size.width < 600
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1)
                    : EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Text(
                            "+60",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "012-2511534",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              Padding(
                padding: MediaQuery.of(context).size.width < 600
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1)
                    : EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _showMyDialog();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Submit",
                                  style: TextStyle(fontSize: 20)),
                            ))),
                  ],
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int factory = 1;
  bool isLogged = false;
  int viewIndex = 1;
  String now = DateTime.now().toString();
  Widget currentView = SizedBox();
  // Todo Replace the goddamn ayam with login page
  @override
  Widget build(BuildContext context) {
    switch (viewIndex) {
      case 1: // Home
        currentView = Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey[200]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(factory == 2 ? '1534.63kW' : 'Unreachable',
                              textScaler: TextScaler.linear(
                                  ScaleSize.textScaleFactor(context)),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w600)),
                          Expanded(
                            flex: 5,
                            child: GridView.count(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              crossAxisCount:
                                  MediaQuery.of(context).size.width > 400
                                      ? 2
                                      : 1,
                              padding: EdgeInsets.all(10),
                              children: [
                                GaugeOne(
                                  value_data: factory == 2
                                      ? 10
                                      : 0, // condition ? output if true : output if false
                                  unit: "bar",
                                  title: "Pressure",
                                ),
                                GaugeOne(
                                  title: "Voltage",
                                  value_data: factory == 2 ? 100 : 0,
                                  max: 200,
                                  unit: "kV",
                                ),
                                GaugeOne(
                                  title: "Amperage",
                                  value_data: factory == 2 ? 55 : 0,
                                  max: 70,
                                  warning: 30,
                                  unit: "Amps",
                                ),
                                GaugeOne(
                                  title: "Steam Produced",
                                  value_data: factory == 2 ? 77 : 0,
                                  max: 125,
                                  warning: 40,
                                  unit: "Ton/Hour",
                                )
                              ],
                            ),
                          ),
                          Text(factory == 2
                              ? "${now.toString().substring(0, 19)}"
                              : "--:--")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                factory = 1;
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height *
                                    0.001 *
                                    8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey[100],
                                  boxShadow: factory == 1
                                      ? <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.blue,
                                              blurRadius: 5,
                                              spreadRadius: 0,
                                              blurStyle: BlurStyle.solid)
                                        ]
                                      : null),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height *
                                        0.001 *
                                        20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.factory_rounded),
                                    Text("Factory 1",
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                factory = 2;
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height *
                                    0.001 *
                                    8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey[100],
                                  boxShadow: factory == 2
                                      ? <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.blue,
                                              blurRadius: 5,
                                              spreadRadius: 0,
                                              blurStyle: BlurStyle.solid)
                                        ]
                                      : null),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height *
                                        0.001 *
                                        20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.factory_rounded),
                                    Text("Factory 2",
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      case 0: // Profile
        currentView = Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InvitedListWidget(
                    title: factory,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                factory = 1;
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height *
                                    0.001 *
                                    8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey[100],
                                  boxShadow: factory == 1
                                      ? <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.blue,
                                              blurRadius: 5,
                                              spreadRadius: 0,
                                              blurStyle: BlurStyle.solid)
                                        ]
                                      : null),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height *
                                        0.001 *
                                        20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.factory_rounded),
                                    Text("Factory 1",
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                factory = 2;
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height *
                                    0.001 *
                                    8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey[100],
                                  boxShadow: factory == 2
                                      ? <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.blue,
                                              blurRadius: 5,
                                              spreadRadius: 0,
                                              blurStyle: BlurStyle.solid)
                                        ]
                                      : null),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height *
                                        0.001 *
                                        20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.factory_rounded),
                                    Text("Factory 2",
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        ;
      case 2:
        currentView = SizedBox(
          child: Text("Settings"),
        );
      default:
        currentView = SizedBox(
          child: Column(
            children: [
              Text("Hallo"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLogged = true;
                    });
                  },
                  child: Text("Jadi la"))
            ],
          ),
        );
    }
    return Scaffold(
        backgroundColor: Colors.grey[400],
        bottomNavigationBar: isLogged
            ? BottomNavigationBar(
                showUnselectedLabels: false,
                currentIndex: viewIndex,
                onTap: (value) {
                  setState(() {
                    viewIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Profile"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings")
                ],
              )
            : null,
        appBar: isLogged
            ? AppBar(
                centerTitle: true,
                title: Text("Factory $factory"),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              )
            : null,
        body: isLogged ? currentView : LoginPage());
  }
}

class InvitedListWidget extends StatelessWidget {
  InvitedListWidget({
    super.key,
    required this.title,
  });
  int title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey[200]),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [Text("Benim adim Ayeh"), Text("+6012315134")],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: 100,
                  width: 400,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                ),
                Container(
                  child: Column(
                    children: [Text("Benim adim Ayeh"), Text("+6012315134")],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: 100,
                  width: 400,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                ),
                Container(
                  child: Column(
                    children: [Text("Benim adim Ayeh"), Text("+6012315134")],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: 100,
                  width: 400,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => InvitePage(
                      title: title,
                    ),
                  ));
                },
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GaugeOne extends StatelessWidget {
  GaugeOne({
    super.key,
    required this.value_data,
    this.max = 100,
    this.warning = 25,
    required this.unit,
    required this.title,
  });

  final double value_data;
  double max;
  double warning;
  String unit;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      //////
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(minimum: 0, maximum: max, pointers: <GaugePointer>[
                  RangePointer(
                    color: value_data >= warning ? Colors.green : Colors.red,
                    value: value_data,
                  ),
                  MarkerPointer(
                    color: value_data >= warning ? Colors.grey : Colors.red,
                    value: warning,
                    markerOffset: -5,
                  )
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('$value_data $unit',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      angle: 90,
                      positionFactor: 1)
                ])
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
