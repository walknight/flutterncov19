import 'package:flutter/material.dart';
import 'package:flutterncov19/model/CountriesData.dart';

class CountryCell extends StatelessWidget {
  const CountryCell(this.countries);
  @required
  final Countries countries;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/no-img.jpg', 
                    image: countries.countryInfo.flag,
                    width: 100,
                    height: 100, 
                  ),
                )
              ),              
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  countries.country,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
