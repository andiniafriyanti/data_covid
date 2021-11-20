import 'package:flutter/material.dart';
import 'package:data_covid/core/viewmodels/corona_bloc.dart';
import 'package:data_covid/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainActivity());
}

class MainActivity extends StatelessWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
            ChangeNotifierProvider(create: (_) => CoronaBloc()),
        ],
        child: const MaterialApp(
          home: SplashScreen(),debugShowCheckedModeBanner: false,
        ),
    );
  }
}
