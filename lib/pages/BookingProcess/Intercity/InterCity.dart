import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class InterCity extends StatefulWidget {
  const InterCity({super.key});

  @override
  State<InterCity> createState() => _InterCityState();
}

class _InterCityState extends State<InterCity> {
  bool oneway=true;
  bool round=false;
  bool sedan=true;
  bool suv=false;
  int adult=0;
  int child=0;
  final fromcontroller = new TextEditingController();
  final tocontroller = new TextEditingController();
  final departureController = new TextEditingController();
  final returnController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final from = Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(151, 173, 182, 0.5)),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
            //readOnly: true,
            // onTap: () async {
            //     String? selectedplace = await ShowPlaces();
            //     fromcontroller.text=selectedplace;
            // },
            cursorColor: Colors.redAccent,
            autofocus: false,
            controller: fromcontroller,
            style: TextStyle(fontFamily: 'Arimo'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Pick FROM location");
              }
              return null;
            },
            onSaved: (value) {
              fromcontroller.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: Color.fromRGBO(255, 51, 51, 0.9),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: InputBorder.none),
          ),
        ));
    final to = Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(151, 173, 182, 0.5)),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
            cursorColor: Colors.redAccent,
            autofocus: false,
            controller: tocontroller,
            style: TextStyle(fontFamily: 'Arimo'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Pick TO location");
              }
              return null;
            },
            onSaved: (value) {
              tocontroller.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color:Color.fromRGBO(255, 51, 51, 0.9),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: InputBorder.none),
          ),
        ));
    final departure = Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(151, 173, 182, 0.5)),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
            cursorColor: Colors.redAccent,
            autofocus: false,
            controller: departureController,
            style: TextStyle(fontFamily: 'Arimo'),
            keyboardType: TextInputType.phone,
            onTap: () async {
              DateTime ? pickdate2 = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 0)),
                  lastDate: DateTime(2050));

              if (pickdate2 != null) {
                setState(() {
                  departureController.text =
                      DateFormat('dd-MM-yyyy').format(pickdate2);
                });
              };
            },
            validator: (value) {
              if (value!.isEmpty) {
                return ("Pick TO location");
              }
              return null;
            },
            onSaved: (value) {
              departureController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  LineIcons.calendar,
                  color:Color.fromRGBO(255, 51, 51, 0.9),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: InputBorder.none),
          ),
        ));
    final travellers = Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(151, 173, 182, 0.5)),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
            child: Row(
              children: [
                Icon(Icons.person_outline_rounded,color: Colors.redAccent,),
                SizedBox(width: 10,),
                Text('${adult} Adult, ${child} Child',style: TextStyle(fontFamily: 'Arimo'))
              ],
            ),
          )
        ));
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body:  Column(
        children: [
      Expanded(
      child: SingleChildScrollView(
      clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(height: MediaQuery.of(context).size.height,
              color: Colors.black,
            ),
          ],
        ),
      ),
    ),
    Stack(
        clipBehavior: Clip.none,
        children:<Widget> [

        SizedBox(
        width: MediaQuery.of(context).size.width,
    height: 600,
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)),
          color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20,10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: (){
                                  setState(() {
                                    oneway=!oneway;
                                    round=false;
                                  });

                                },
                                child: Row(
                                  children: [
                                   Stack(
                                     children: [
                                       Icon(Icons.circle_outlined,size: 20,color: Colors.redAccent,),
                                      Positioned.fill(
                                        child: Align(
                                            alignment: Alignment.center,
                                            child:Icon(Icons.circle,size: 11,color: (oneway)?Colors.redAccent:Colors.white,)
                                        )
                                        ),
                                     ],
                                   ),
                                    SizedBox(width: 8,),
                                    Text('One-way',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),)
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: (){
                                  setState(() {
                                    round=!round;
                                    oneway=false;
                                  });

                                },
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Icon(Icons.circle_outlined,size: 20,color: Colors.redAccent,),
                                        Positioned.fill(
                                            child: Align(
                                                alignment: Alignment.center,
                                                child:Icon(Icons.circle,size: 11,color: (round)?Colors.redAccent:Colors.white,)
                                            )
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 8,),
                                    Text('Rounded-trip',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                setState(() {
                                  sedan=!sedan;
                                  suv=false;
                                });

                              },
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Icon(Icons.circle_outlined,size: 20,color: Colors.redAccent,),
                                      Positioned.fill(
                                          child: Align(
                                              alignment: Alignment.center,
                                              child:Icon(Icons.circle,size: 11,color: (sedan)?Colors.redAccent:Colors.white,)
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8,),
                                  Text('Sedan (max 4)',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                setState(() {
                                  suv=!suv;
                                  sedan=false;
                                });

                              },
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Icon(Icons.circle_outlined,size: 20,color: Colors.redAccent,),
                                      Positioned.fill(
                                          child: Align(
                                              alignment: Alignment.center,
                                              child:Icon(Icons.circle,size: 11,color: (suv)?Colors.redAccent:Colors.white,)
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8,),
                                  Text('SUV (max 7)  ',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text('From',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),),
                        SizedBox(height: 5,),
                        from,
                        SizedBox(height: 15,),
                        Text('To',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),),
                        SizedBox(height: 5,),
                        to,
                        SizedBox(height: 15,),
                        Text('Departure date',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),),
                        SizedBox(height: 5,),
                        departure,
                        if(round)
                        Return(),
                        SizedBox(height: 15,),
                        Text('Travellers',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),),
                        SizedBox(height: 5,),
                        travellers,
                      ]

    )
    )
      )
    )
    ]
      ),
    ]
      )
    );
  }
  Column Return(){
    final Return = Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(151, 173, 182, 0.5)),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
            cursorColor: Colors.redAccent,
            autofocus: false,
            controller: returnController,
            style: TextStyle(fontFamily: 'Arimo'),
            keyboardType: TextInputType.phone,
            onTap: () async {
              DateTime ? pickdate2 = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 0)),
                  lastDate: DateTime(2050));

              if (pickdate2 != null) {
                setState(() {
                  returnController.text =
                      DateFormat('dd-MM-yyyy').format(pickdate2);
                });
              };
            },
            validator: (value) {
              if (value!.isEmpty) {
                return ("Pick TO location");
              }
              return null;
            },
            onSaved: (value) {
              returnController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  LineIcons.calendar,
                  color:Color.fromRGBO(255, 51, 51, 0.9),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: InputBorder.none),
          ),
        ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 15,),
    Text('Return date',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w700),),
    SizedBox(height: 5,),
    Return,
      ],
    );

  }
}