import 'package:flutter/material.dart';
import 'package:homepage/reservationflight.dart';

class FlightBookingScreen extends StatefulWidget {
  final String logo ;
  final String airlineTitle;

  const FlightBookingScreen({super.key, required this.logo, required this.airlineTitle});

 // final TripInfo
  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  late List<Map<String, String>> flights;

  @override

  void initState() {
   flights = [
    {
      "airline":widget.airlineTitle,
      "logo": widget.logo,
      "departureTime": "13:15",
      "departureCity": "Cairo",
      "arrivalTime": "10:25",
      "arrivalCity": "Abu-dhabi",
      "price": "6000EP"
    },
    {
      "airline": widget.airlineTitle,
      "logo": widget.logo,
      "departureTime": "15:30",
      "departureCity": "Cairo",
      "arrivalTime": "12:45",
      "arrivalCity": "Abu-dhabi",
      "price": "7500EP"
    },
    {
      "airline": widget.airlineTitle,
      "logo": widget.logo,
      "departureTime": "17:45",
      "departureCity": "Cairo",
      "arrivalTime": "14:55",
      "arrivalCity": "Abu-dhabi",
      "price": "8000EP"
    },
  ];

  super.initState();
  }

@override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: const Color(0xFF0D75B4),
          leading: InkWell(
            onTap: () => Navigator.
              pop(context) ,
              child: Icon(Icons.arrow_back ,color: Colors.white,)),
          title:  Row(
            children: [
              Text("Tour and Travel", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Text("Abu-dhabi", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDateBox("14/6/2025"),
                  SizedBox(width: 15),
                  _buildDateBox("19/6/2025"),
                ],
              ),
              SizedBox(height: 20),
              _buildTabBar(),
              SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildFlightList(),
                    _buildFlightList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateBox(String date) {
    return Container(
      width: 120,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          date,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(33),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: TabBar(
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            color: Color(0xFF0D75B4),
            borderRadius: BorderRadius.circular(33),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(text: "Economy"),
            Tab(text: "First Class"),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightList() {
    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) {
        return _buildFlightCard(
          flights[index]["airline"]!,
          flights[index]["logo"]!,
          flights[index]["departureTime"]!,
          flights[index]["departureCity"]!,
          flights[index]["arrivalTime"]!,
          flights[index]["arrivalCity"]!,
          flights[index]["price"]!,
        );
      },
    );
  }

  Widget _buildFlightCard(
      String airline,
      String logo,
      String departureTime,
      String departureCity,
      String arrivalTime,
      String arrivalCity,
      String price) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(airline,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Image.network(logo, height: 30),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(departureTime,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(departureCity, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Icon(Icons.flight_takeoff, color: Colors.grey, size: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(arrivalTime,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(arrivalCity, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              Divider(thickness: 1, height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$price L.E",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(),
                        ),
                      );

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0D75B4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child:
                    Text("Book Now", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}