import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name for the UI
  String? time; // time in that location
  String flag; // URL to an asset flag icon
  String url; // // location URL for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    // Make the request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    // Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);

    // Create a DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // print(now);

    // set the time property
    time = now.toString();

  }
}