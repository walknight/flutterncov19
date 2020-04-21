import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterncov19/model/CountriesData.dart';
import 'package:flutterncov19/pages/CountriesDetail.dart';
import 'package:flutterncov19/pages/Credit.dart';
import 'package:flutterncov19/services/API_Service.dart';
import 'package:flutterncov19/model/AllData.dart';
import 'package:flutterncov19/widget/GridCell.dart';
import 'package:flutterncov19/widget/NumberData.dart';

class Home extends StatefulWidget {
  static const String id = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<AllData> dataAll;
  Future<List<Countries>> dataCountries;
  ScrollController _scrollController = ScrollController();
  int _maxItemPrint = 8;
  int _maxData;

  
  gridView(BuildContext context, AsyncSnapshot<List<Countries>> snapshot) {
    //get total data
    _maxData = snapshot.data.length;
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: _maxItemPrint,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0), 
        itemBuilder: (context, int index){          
          return GestureDetector(
            child: CountryCell(snapshot.data[index]),
            onTap:()=> 
              //clickCell(snapshot.data[index])
              /* Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CountryDetail(snapshot.data[index])
              )) */
              Navigator.pushNamed(context, CountryDetail.id, arguments: snapshot.data[index])
            ,
          );
        }
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dataAll = APIService.getAllData();
    dataCountries = APIService.getDataAllCountries();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        if(_maxItemPrint <= _maxData-1)
        {
          print(_maxItemPrint);
          _getMoreData();
        }
      }
    });
  }

  _getMoreData(){
    //print("Get More Data");
    _maxItemPrint = _maxItemPrint + 4;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('COVID-19 Updates'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  dataAll = APIService.getAllData();
                  dataCountries = APIService.getDataAllCountries();
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, Credit.id);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.0),
          controller: _scrollController,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FutureBuilder<AllData>(
                        future: dataAll,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            //print(snapshot.hasData);
                            if (snapshot.hasData) {
                              return NumberData(cases: snapshot.data.cases, updated: snapshot.data.updated, deaths: snapshot.data.deaths, recovered: snapshot.data.recovered,);
                            } else {
                              return Text('No Data');
                            }
                          }
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 18, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Countries',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 20,
                            fontFamily: 'Bebas',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FutureBuilder<List<Countries>>(
                        future: dataCountries,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            //return Text('${snapshot.data.length}');
                            return Expanded(child: gridView(context, snapshot));
                          }
                        },
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
