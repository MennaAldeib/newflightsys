import 'package:flutter/material.dart';
import 'package:homepage/homepage.dart';

class Selectedairline extends StatelessWidget {


  const Selectedairline({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> arabAirlines = [
      {
        "name": "Emirates",
        "logoUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Emirates_logo.svg/1934px-Emirates_logo.svg.png"
      },
      {
        "name": "Etihad Airways",
        "logoUrl": "https://logos-world.net/wp-content/uploads/2023/01/Etihad-Airways-Logo.png"
      },
      {
        "name": "EgyptAir",
        "logoUrl": "https://upload.wikimedia.org/wikipedia/commons/7/7d/Egypt_air_logo.jpg"
      },
      {
        "name": "Kuwait Airways",
        "logoUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmUbMy-h1L2mYJr7Q9grMmMZypCpb3YsOlckpQH-bxoXxLFUOcx7F1eBPkSE_ClvJnmyc&usqp=CAU"
      },
      {
        "name": "Oman Air",
        "logoUrl": "https://download.logo.wine/logo/Oman_Air/Oman_Air-Logo.wine.png"
      },
      {
        "name": "Middle East Airlines (MEA)",
        "logoUrl": "https://download.logo.wine/logo/Middle_East_Airlines/Middle_East_Airlines-Logo.wine.png"
      },
      {
        "name": "Flydubai",
        "logoUrl": "https://1000logos.net/wp-content/uploads/2020/04/FlyDubai-Logo.jpg"
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF0D75B4),
        title: Row(
          children: [
            SizedBox(width: 10),
            Text("Tour and Travel", style: TextStyle(fontSize: 18 , color: Colors.white) ,),
          ],
        ),
      ),
      body:  Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemCount: arabAirlines.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlightBookingScreen(airlineTitle:arabAirlines[index]["name"] !, logo:arabAirlines[index]["logoUrl"] ! ,),
                ),
              );



            },
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(

                          arabAirlines [index]["name"]!,
                          style: TextStyle(
                            fontFamily: "Poppins-SemiBold",
                            color: Color(0xff0d75b4),
                            fontSize: 21,
                          ),
                        ),
                        SizedBox(height: 7),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      arabAirlines[index]["logoUrl"]!,
                      width: 150,

                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),



    );
  }
}
