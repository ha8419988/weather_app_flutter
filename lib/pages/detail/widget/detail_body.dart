import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/apps/utils/asset.dart';
import 'package:weather/models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.list});
  final List<WeatherDetail> list;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(list[index].dxTxt);
        String fotmarDate = DateFormat('EEEE').format(dateTime);
        String fotmarTime = DateFormat('HH:MM').format(dateTime);
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white30,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      createTemp(31, fontSize: 30),
                      Text(
                        list[index].weather.main,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    fotmarDate,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    fotmarTime,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: Image.asset(AssetCustom.getLinkImg('rain')),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: list.length,
    );
  }
}
