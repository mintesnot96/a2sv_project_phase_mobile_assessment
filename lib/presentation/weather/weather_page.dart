import 'package:flutter/material.dart';
import 'package:a2sv_project_phase_mobile_assessment/core/show_snackbar.dart';
import 'package:a2sv_project_phase_mobile_assessment/presentation/weather/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a2sv_project_phase_mobile_assessment/presentation/weather/weather_detail_page.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String query = '';

    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherError) {
          showSnackBar(context, state.errorMessage);
        } else if (state is WeatherSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherDetailPage(
                weatherResponse: state.weatherReponse,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(245, 244, 255, 1),
          body: SafeArea(
            child: Column(
              children: [
                const Text(
                  'Choose a city',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color.fromRGBO(33, 23, 114, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchWidget(onChanged: (val) {
                          query = val;
                        }),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          context.read<WeatherBloc>().add(FetchWeather(query: query));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(255, 186, 37, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child: SizedBox(
                              height: 40,
                              width: 80,
                              child: state is WeatherLoading
                                  ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                                  : Center(
                                child: const Text(
                                  'Search',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      'My Fav Cities',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(33, 23, 114, 1),
                      ),
                    ),
                  ),
                ),
                // ListView.builder for weather items
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _WeatherItem(
                        location: 'New Mexico, USA',
                        temperature: '28°',
                        icon: Icon(Icons.wb_sunny),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WeatherItem extends StatelessWidget {
  const _WeatherItem({
    super.key,
    required this.location,
    required this.temperature,
    required this.icon,
  });

  final String location;
  final String temperature;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(location),
              Row(
                children: [
                  Text(
                    temperature,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  icon,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.onChanged,
  });

  final Function(String val) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
