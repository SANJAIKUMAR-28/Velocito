import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocito/pages/BookingProcess/Ride/DriverDetails.dart';
import 'package:velocito/pages/BookingProcess/Ride/VehicleSelection.dart';

class RideOptions extends StatefulWidget {
  final String img;
  final String cost;
  final String vec;
  final String seats;
  final String time;
  const RideOptions({super.key, required this.img, required this.cost, required this.vec, required this.seats, required this.time});

  @override
  State<RideOptions> createState() => _RideOptionsState();
}

class _RideOptionsState extends State<RideOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Ride options',
            style: TextStyle(
                fontFamily: 'Arimo',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(62, 73, 88, 1.0)),
          ),
          centerTitle: true,
          toolbarHeight: 50,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Image.asset('assets/map.png')
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 320,
                child: Selection(),

              ),

            ],
          ),

        ])
    );

  }
  Material Selection() {
    return Material(
        elevation: 5,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  child: MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    onPressed: () {

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(''),
                            InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => VehicleSelection()));
                              },
                              child:
                            Text('Change',style: TextStyle(fontFamily: 'Arimo',color:Color.fromRGBO(255, 51, 51, 0.8),fontSize: 12,fontWeight: FontWeight.bold),),)
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      "${widget.img}",
                                      height: 50,
                                      width: 80,

                                    ),
                                  ]),
                              Row(
                                  children:[
                                    Text('Total cost : ',style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Arimo',
                                        color:
                                        Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Icon(LineIcons.indianRupeeSign,size: 13,color: Colors.black,),
                                    SizedBox(width: 2,),
                                    Text('${widget.cost}',style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Arimo',
                                        color:
                                        Colors.black,
                                        fontWeight: FontWeight.bold),),
                                  ]
                              ),

                            ]),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${widget.vec}',style: TextStyle(fontFamily: 'Arimo',),),
                            Container(
                              height: 20,
                              child: VerticalDivider(
                                color: Color.fromRGBO(255, 51, 51, 0.8),
                              ),
                            ),
                            Row(children: [
                              Icon(Icons.person,color: Colors.black,),
                              SizedBox(width: 5,),
                              Text('${widget.seats} seats',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.bold),)
                            ],),
                            Container(
                              height: 20,
                              child: VerticalDivider(
                                color: Color.fromRGBO(255, 51, 51, 0.8),
                              ),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5,right: 5),
                                child: Text('3 mins',style: TextStyle(fontFamily: 'Arimo',color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' Estimated trip time',style: TextStyle(fontFamily: 'Arimo',color: Colors.grey,fontSize: 13),),
                  Text(' 24 min',style: TextStyle(fontFamily: 'Arimo',color:Color.fromRGBO(255, 51, 51, 0.8),fontSize: 13),)
                ],
              ),
              SizedBox(height: 20,),
              Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 2,
                color: Color.fromRGBO(255, 51, 51, 0.9),
                child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DriverDetails()));
                  },
                  child:  Text(
                    "Book ride",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Arimo',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}