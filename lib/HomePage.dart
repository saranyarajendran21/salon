import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Carouseldata> CarouselList;
  late List<Servicedata> ServiceList;

  List imglist = [
    "http://admin.blissme.hk/public/../storage/banner/product-banner3.jpg",
    "http://admin.blissme.hk/public/../storage/banner/product-banner1.jpg",
    "http://admin.blissme.hk/public/../storage/banner/banner_2.jpg",
    "http://admin.blissme.hk/public/../storage/banner/banner_1.jpg",
  ];

  Future<List<Carouseldata>> fetchCaro() async {

      final String url = 'https://admin.blissme.hk/public/api/services';

      var response =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json","Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNmZkZDhiYTNmZjY5ZWEzNGFhMjY4NjZkMDk1NGU5ZDVmMGMzYmE0OWUzYWVkYzVkYmQxODc2ZDM5Y2EwODlhZWQ1MmE1OThlNjllMzY4MDMiLCJpYXQiOjE2MzE4NjAzMTUsIm5iZiI6MTYzMTg2MDMxNSwiZXhwIjoxNjYzMzk2MzE1LCJzdWIiOiIxODgiLCJzY29wZXMiOltdfQ.mK8NMG8A0thg5KuY7LwMn3qITxdciDZUxJ21EQO9wnfhWkQB9LizkS40lvkEg4KfEspUKpO2uuEUKQvGU3BcSdMWd38z2grEPHwdIjauYGxFB6Ya5CplDTT3RqTgPOjjN9I4oYahdB0zY8NqG4YRcbhkVnGs6CjkrolZLZ4_T4nt8nMJKjE3ao1J4EPjGqBEySknjIsGzL2mBIt3rIMreEz0UWN3cm8y_UxueUbPcFQAIJVoxJN7SDmLOaGs5cSOpQGvgm_4zM35KcJvSAKO4_ZbEwpncQve-KJ0YDfCwE-th4Gx6_TNw4puzc1g7jsjbbktg-oYVZl6zY3qr_1s_zgek46d5OkW4L2YqLZrxAdw-lEjM-bDcxV_CDtLqDOwB1e5dN_BQmJd2FdOOwsqxGpo7qExy7HiutbEVffYyTCH_8oGNgqY8B2ozzYTv85LyT7B7ZVU85KDi23E3lxXn45QHnKqGrCInSBqXN1o36YaXZUWcjxr-qXR1ploSxMN1i7n4hzpsd7CPgpqd4PbAnPO48s_HwzfLmKgBXrZdPob5NrDkE2_lY3pNCO2WCyvN6mvKMvfLR97_JmzvmFWjrNTDEejIA53wsmWirkzY81j2LMiD60cUL8_nZKLthahOM38Vk8SA5s3oWh85IdynA-Z6uoG4WY5Hgj6_QjSu80"});

      if (response.statusCode == 200) {
        var convertDataJson = json.decode(response.body);
        var datajson = convertDataJson['carousel'];

        final items = datajson.cast<Map<String, dynamic>>();
        // print("hotel items = $items");

        CarouselList = items.map<Carouseldata>((json) {
          return Carouseldata.fromJson(json);
        }).toList();


        return CarouselList;
      } else {
        throw Exception('Failed to load data from Server.');
      }
  }

  Future<List<Servicedata>> fetchService() async {

    final String url = 'https://admin.blissme.hk/public/api/services';

    var response =
    await http.get(Uri.parse(url), headers: {"Accept": "application/json","Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNmZkZDhiYTNmZjY5ZWEzNGFhMjY4NjZkMDk1NGU5ZDVmMGMzYmE0OWUzYWVkYzVkYmQxODc2ZDM5Y2EwODlhZWQ1MmE1OThlNjllMzY4MDMiLCJpYXQiOjE2MzE4NjAzMTUsIm5iZiI6MTYzMTg2MDMxNSwiZXhwIjoxNjYzMzk2MzE1LCJzdWIiOiIxODgiLCJzY29wZXMiOltdfQ.mK8NMG8A0thg5KuY7LwMn3qITxdciDZUxJ21EQO9wnfhWkQB9LizkS40lvkEg4KfEspUKpO2uuEUKQvGU3BcSdMWd38z2grEPHwdIjauYGxFB6Ya5CplDTT3RqTgPOjjN9I4oYahdB0zY8NqG4YRcbhkVnGs6CjkrolZLZ4_T4nt8nMJKjE3ao1J4EPjGqBEySknjIsGzL2mBIt3rIMreEz0UWN3cm8y_UxueUbPcFQAIJVoxJN7SDmLOaGs5cSOpQGvgm_4zM35KcJvSAKO4_ZbEwpncQve-KJ0YDfCwE-th4Gx6_TNw4puzc1g7jsjbbktg-oYVZl6zY3qr_1s_zgek46d5OkW4L2YqLZrxAdw-lEjM-bDcxV_CDtLqDOwB1e5dN_BQmJd2FdOOwsqxGpo7qExy7HiutbEVffYyTCH_8oGNgqY8B2ozzYTv85LyT7B7ZVU85KDi23E3lxXn45QHnKqGrCInSBqXN1o36YaXZUWcjxr-qXR1ploSxMN1i7n4hzpsd7CPgpqd4PbAnPO48s_HwzfLmKgBXrZdPob5NrDkE2_lY3pNCO2WCyvN6mvKMvfLR97_JmzvmFWjrNTDEejIA53wsmWirkzY81j2LMiD60cUL8_nZKLthahOM38Vk8SA5s3oWh85IdynA-Z6uoG4WY5Hgj6_QjSu80"});

    if (response.statusCode == 200) {
      var convertDataJson = json.decode(response.body);
      var datajson = convertDataJson['services'];

      final items = datajson.cast<Map<String, dynamic>>();

      ServiceList = items.map<Servicedata>((json) {
        return Servicedata.fromJson(json);
      }).toList();

      return ServiceList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Top Salon',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: [
          IconButton(icon: Icon(Icons.search_rounded, color: Colors.black),onPressed: () {})
          ],
          leading: IconButton(icon: Icon(Icons.menu, color: Colors.black),onPressed: () {
          },),
        ),
      body: ListView(
        children: [
          CarouselSlider(
                        options: CarouselOptions(
                          height: 150,
                          enableInfiniteScroll: true,
                          aspectRatio: 1.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                        ),
                        items: imglist.map((newdata) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: (
                                  Image.network(newdata,fit: BoxFit.fill,)
                                ),
                              );
                            },
                          );
                        }).toList(),
            ),
           Container(
             height: 60,
             color: Colors.white,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Top Salon',style: TextStyle(fontSize: 18,color: Colors.black),),
                   Icon(Icons.filter_alt)
                 ],
               ),
             )
           ),
           Container(
            height: MediaQuery.of(context).size.height - 250,
            width: MediaQuery.of(context).size.width,
            child: new FutureBuilder<List<Servicedata>>(
              future: fetchService(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: ServiceList.length,
                    itemBuilder: (context, index) {
                      return Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/spa.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 5.0,
                                                  left: 5.0,
                                                  child: Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(4.0)),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(5.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                            size: 13,
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            "4.5",
                                                            style: TextStyle(
                                                                fontSize: 13,fontFamily: 'lato',letterSpacing: .6
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(snapshot.data![index].serviceId != null ? snapshot.data![index].serviceId.toString():'',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                                  Text(snapshot.data![index].serviceName != null ? snapshot.data![index].serviceName:'',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal)),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.location_on),
                                                      Text('2.5KM',style: TextStyle(fontSize: 16,),)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        RaisedButton(onPressed: (){},
                                         child: Text('View'),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );

                    });
              },
            ),
          ),
        ],
      )
    );
  }
}

class Carouseldata {
  int id;
  String type;
  String image;


  Carouseldata({required this.id, required this.type, required this.image });

  factory Carouseldata.fromJson(Map<String, dynamic> json) {
    return Carouseldata(
        id: json['id'],
        type: json['type'],
        image: json['image'],

    );
  }
}

class Servicedata {
  int serviceId;
  String serviceName;
  int spaCount;


  Servicedata({required this.serviceId, required this.serviceName, required this.spaCount });

  factory Servicedata.fromJson(Map<String, dynamic> json) {
    return Servicedata(
      serviceId: json['serviceId'],
      serviceName: json['serviceName'],
      spaCount: json['spaCount'],

    );
  }
}

