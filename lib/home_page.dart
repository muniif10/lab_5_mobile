// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_5_mobile/bloc/selected_view_bloc.dart';
import 'package:lab_5_mobile/engineer_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      widget: Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Text('$value_data $unit',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                                            ),
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

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 3}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class FactorySelectionBloc extends Bloc<FactorySelectionEvent, int> {
  FactorySelectionBloc() : super(1) {
    on<FactoryOneEvent>((event, emit) {
      emit(1);
    });
    on<FactoryTwoEvent>((event, emit) {
      emit(2);
    });
  }
}

class FactorySelectionEvent {}

class FactoryOneEvent extends FactorySelectionEvent {}

class FactoryTwoEvent extends FactorySelectionEvent {}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedViewBloc(),
        ),
        BlocProvider(
          create: (context) => FactorySelectionBloc(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<SelectedViewBloc, int>(
          builder: (context, state) {
            return BottomNavigationBar(
              onTap: (value) {
                switch (value) {
                  case 0:
                    context
                        .read<SelectedViewBloc>()
                        .add(GoEngineerListViewEvent());
                  case 1:
                    context.read<SelectedViewBloc>().add(GoHomeViewEvent());
                  case 2:
                    context
                        .read<SelectedViewBloc>()
                        .add(GoSettingListViewEvent());
                }
              },
              currentIndex: state,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: "Engineer"),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            );
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: BlocBuilder<FactorySelectionBloc, int>(
            builder: (context, state) {
              return AppBar(
                centerTitle: true,
                title: Text("Factory $state"),
              );
            },
          ),
        ),
        body: BlocBuilder<SelectedViewBloc, int>(
          builder: (context, state) {
            if (state == 1) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey[200]),
                            child: BlocBuilder<FactorySelectionBloc, int>(
                              builder: (context, state) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        state == 2
                                            ? '1534.63kW'
                                            : 'Unreachable',
                                        textScaler: TextScaler.linear(
                                            ScaleSize.textScaleFactor(context)),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600)),
                                    Expanded(
                                      flex: 5,
                                      child: GridView.count(
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        crossAxisCount:
                                            MediaQuery.of(context).size.width >
                                                    400
                                                ? 2
                                                : 1,
                                        padding: const EdgeInsets.all(10),
                                        children: [
                                          GaugeOne(
                                            value_data: state == 2
                                                ? 10
                                                : 0, // condition ? output if true : output if false
                                            unit: "bar",
                                            title: "Pressure",
                                          ),
                                          GaugeOne(
                                            title: "Voltage",
                                            value_data: state == 2 ? 100 : 0,
                                            max: 200,
                                            unit: "kV",
                                          ),
                                          GaugeOne(
                                            title: "Amperage",
                                            value_data: state == 2 ? 55 : 0,
                                            max: 70,
                                            warning: 30,
                                            unit: "Amps",
                                          ),
                                          GaugeOne(
                                            title: "Steam Produced",
                                            value_data: state == 2 ? 77 : 0,
                                            max: 125,
                                            warning: 40,
                                            unit: "Ton/Hour",
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(state == 2
                                        ? DateTime.now().toString().substring(0, 19)
                                        : "--:--")
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<FactorySelectionBloc, int>(
                            builder: (context, factory_selection) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Perform the BLoC thing
                                      context
                                          .read<FactorySelectionBloc>()
                                          .add(FactoryOneEvent());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.001 *
                                              8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.grey[100],
                                            boxShadow: factory_selection == 1
                                                ? <BoxShadow>[
                                                    const BoxShadow(
                                                        color: Colors.blue,
                                                        blurRadius: 5,
                                                        spreadRadius: 0,
                                                        blurStyle:
                                                            BlurStyle.solid)
                                                  ]
                                                : null),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001 *
                                                  20.0),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.factory_rounded),
                                              Text("Factory 1",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<FactorySelectionBloc>()
                                          .add(FactoryTwoEvent());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.001 *
                                              8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.grey[100],
                                            boxShadow: factory_selection == 2
                                                ? <BoxShadow>[
                                                    const BoxShadow(
                                                        color: Colors.blue,
                                                        blurRadius: 5,
                                                        spreadRadius: 0,
                                                        blurStyle:
                                                            BlurStyle.solid)
                                                  ]
                                                : null),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001 *
                                                  20.0),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.factory_rounded),
                                              Text("Factory 2",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              if (state == 0) {
                return const EngineerView();
              } else {
                return const SettingView();
              }
            }
          },
        ),
      ),
    );
  }
}

class SettingView extends StatelessWidget {
  const SettingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController(text: "2412");
    final controller2 = TextEditingController(text: "412");
    final controller3 = TextEditingController(text: "133");
    final controller4 = TextEditingController(text: "412");
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[200]),
                  child: BlocBuilder<FactorySelectionBloc, int>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Minimums"),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 2,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        const Text("Steam Pressure"),
                                        TextField(
                                          controller: controller1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        const Text("Steam Flow"),
                                        TextField(
                                          controller: controller2,
                                          decoration: const InputDecoration(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        const Text("Power Frequency"),
                                        TextField(
                                          controller: controller3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        const Text("Water Level"),
                                        TextField(
                                          controller: controller4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: BlocBuilder<FactorySelectionBloc, int>(
                  builder: (context, factory_selection) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Perform the BLoC thing
                            context
                                .read<FactorySelectionBloc>()
                                .add(FactoryOneEvent());
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height *
                                    0.001 *
                                    8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey[100],
                                  boxShadow: factory_selection == 1
                                      ? <BoxShadow>[
                                          const BoxShadow(
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
                                child: const Column(
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
                            context
                                .read<FactorySelectionBloc>()
                                .add(FactoryTwoEvent());
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height *
                                    0.001 *
                                    8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey[100],
                                  boxShadow: factory_selection == 2
                                      ? <BoxShadow>[
                                          const BoxShadow(
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
                                child: const Column(
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
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
