import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterncov19/model/AllData.dart';
import 'package:flutterncov19/model/CountriesData.dart';

//Class to call API Service

class APIService{
  static final url = 'https://corona.lmao.ninja/v2/';
  static final getAll = 'all';
  static final getCountries = 'countries';

  //Method to call All Data
  static Future<AllData> getAllData() async{
    try{
      final response = await http.get(url + getAll);
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        //print(json);
        return AllData.fromJson(json);
      } else {        
        return null;
      }
    } catch(e){
      throw Exception(e.toString()); // return Empty Data
    }
  }

  //Method to call All Data Countries
  static Future<List<Countries>> getDataAllCountries() async{
    try{
      final response = await http.get(url + getCountries);
      if(response.statusCode == 200){
        List<Countries> list = parseResponse(response.body);
        return list; 
      } else {
        return []; // empty List
      }
    } catch(e){
      throw Exception(e.toString()); // Empty List
    }
  }

  //Method to call Data With countries param
  static Future<Countries> getDataByCountries(country) async{
    try{
      final response = await http.get(url + getCountries + '/' + country);
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        return Countries.fromJson(json);
      } else {
        return null;
      }
    } catch(e){
      return null;  //return empty
    }
  }

  //Method to parse JSON to List<Countries>
  static List<Countries> parseResponse(String responseBody){
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Countries>((json) => Countries.fromJson(json)).toList();
  }

}