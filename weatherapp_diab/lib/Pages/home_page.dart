import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_page.dart';
import '../cubit/weather_cubit.dart';
import '../models/weather_model.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return WeatherDetails(
                weatherData: state.weatherModel, cityName: state.cityName);
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text("There is Something Wrong"),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    super.key,
    required this.weatherData,
    required this.cityName,
  });

  final WeatherModel? weatherData;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData!.getThemeColor(),
        weatherData!.getThemeColor()[200]!,
        weatherData!.getThemeColor()[100]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(
          flex: 3,
        ),
        Text(
          cityName,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          "update At : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(weatherData!.getImage()),
            Text(
              '${weatherData!.temp.toInt()}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text('Maxtemp : ${weatherData!.maxTemp.toInt()}'),
                Text('Mintemp : ${weatherData!.minTemp.toInt()}'),
              ],
            ),
          ],
        ),
        const Spacer(),
        Text(
          weatherData!.weatherStateName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(
          flex: 5,
        )
      ]),
    );
  }
}
