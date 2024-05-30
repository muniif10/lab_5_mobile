import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_5_mobile/home_page.dart';

class EngineerView extends StatelessWidget {
  const EngineerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FactorySelectionBloc, int>(
          builder: (context, state) {
            return InvitedListWidget(title: state);
          },
        )
      ],
    );
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Michael Yakson", style: TextStyle(fontSize: 20)),
                          Text("+6012315134", style: TextStyle(fontSize: 20))
                        ],
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
                        children: [
                          Text("Ayasofya", style: TextStyle(fontSize: 20)),
                          Text("+6012315531", style: TextStyle(fontSize: 20))
                        ],
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
              ),
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
        backgroundColor: Colors.grey[300],
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
              SizedBox(
                height: 40,
              ),
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
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(15), child: Text('+60 ')),
                        border: InputBorder.none,
                        hintText: "012-2511534",
                      ),
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
