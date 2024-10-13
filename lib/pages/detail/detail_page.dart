import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/pages/detail/widget/detail_body.dart';
import 'package:weather/providers/weather_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xff1D6CF3),
          Color(0xff19D2FE),
        ],
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      )),
      child: FutureBuilder(
          future: context.read<WeatherProvider>().getApiWeatherDetail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'No data',
                  style: TextStyle(fontSize: 100, color: Colors.white),
                ),
              );
            }
            List<WeatherDetail> list = snapshot.data as List<WeatherDetail>;

            return Scaffold(
              body: DetailBody(
                list: list,
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: false,
                title: Row(
                  children: [
                    const Icon(
                      Icons.send,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText(
                          speed: const Duration(
                            milliseconds: 200,
                          ),
                          context.read<WeatherProvider>().nameCity,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: const [
                  Icon(Icons.search),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
