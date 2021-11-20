import 'package:flutter/material.dart';
import 'package:data_covid/core/viewmodels/corona_bloc.dart';
import 'package:data_covid/screen/detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Calling data in bloc
    Provider.of<CoronaBloc>(context, listen: false).initialized();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Data Kawal Corona"),
      ),
      body: Consumer<CoronaBloc>(builder: (context, coronaBloc, _) {
        return coronaBloc.isLoading
        // loading param is true
            ? Center(child: CircularProgressIndicator())
        // loading param is false
            : Container(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: coronaBloc.listCorona.length,
            itemBuilder: (BuildContext context, int index) {
              // loop list data corona
              final data = coronaBloc.listCorona[index];
              final attrib = data.attributes;
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(dataCorona: attrib!),
                      ),
                    );
                  },
                  title: Text(" ${data.attributes?.countryRegion}"),
                  subtitle: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Death : ${attrib?.deaths ?? "0"}"),
                        Text("Confirmed : ${attrib?.confirmed ?? "0"}"),
                        Text("Actived : ${attrib?.active ?? "0"}"),
                        Text("Recoverd : ${attrib?.recovered ?? "0"}")
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}