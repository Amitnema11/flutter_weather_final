import 'package:flutter/material.dart';
import 'package:weather_new/repo.dart';
import 'package:weather_new/weather_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Weather app"),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.search,color: Colors.black,size: 20,),
                      prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey[900]),
                    ),
                  controller: controller,
                ),
                ),

                ElevatedButton(
                    onPressed: () async {
                      weatherModel = await Repo().getWeather(controller.text);
                      print(weatherModel?.main?.temp ?? "error");
                      setState(() {});
                    },
                    child: Text("Search")),
                Text("${weatherModel?.name}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                Text("Temperature - ${weatherModel?.main?.temp}° F"),
                Text("Min Temperature - ${weatherModel?.main?.tempMin}° F"),
                Text("Max Temperature - ${weatherModel?.main?.tempMax}° F"),
                Text("Weather - ${weatherModel?.weather?[0].main}"),
                Text("Description - ${weatherModel?.weather?[0].description}")
              ],
            )));
  }
}
