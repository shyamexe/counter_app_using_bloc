import 'package:counter_app/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xff2b2d42)),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_xk9jkg7k.json',
                reverse: true),
            Align(
              alignment: Alignment.center,
              heightFactor: 2.6,
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, counterState) {
                  return Text(
                    counterState.count.toString(),
                    style: const TextStyle(
                        color: Color(0xffe2eafc),
                        fontSize: 120,
                        fontWeight: FontWeight.w800),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text(
                        '-',
                        style: TextStyle(
                            color: Color(0xffe2eafc),
                            fontSize: 50,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        context.read<CounterBloc>().add(Decrement());
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    TextButton(
                      child: const Text(
                        '+',
                        style: TextStyle(
                            color: Color(0xffe2eafc),
                            fontSize: 50,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        context.read<CounterBloc>().add(Increment());
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
