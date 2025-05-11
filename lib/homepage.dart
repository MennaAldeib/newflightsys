import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';


class FlightBookingScreen extends StatefulWidget {
  final String logo;
  final String airlineTitle;

  const FlightBookingScreen({super.key, required this.logo, required this.airlineTitle});

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  String? selectedFrom;
  String? selectedTo;
  DateTime? startDate;
  DateTime? endDate;

  List<Map<String, String>> flights = [];

  @override
  void initState() {
    super.initState();
    flights = [
      {
        "airline": widget.airlineTitle,
        "logo": widget.logo,
        "departureTime": "13:15",
        "departureCity": "Cairo",
        "arrivalTime": "10:25",
        "arrivalCity": "Abu-dhabi",
        "price": "6000"
      },
      {
        "airline": widget.airlineTitle,
        "logo": widget.logo,
        "departureTime": "17:20",
        "departureCity": "Cairo",
        "arrivalTime": "10:25",
        "arrivalCity": "Abu-dhabi",
        "price": "6000"
      },
      {
        "airline": widget.airlineTitle,
        "logo": widget.logo,
        "departureTime": "15:30",
        "departureCity": "Cairo",
        "arrivalTime": "12:45",
        "arrivalCity": "Abu-dhabi",
        "price": "7500"
      },
      {
        "airline": widget.airlineTitle,
        "logo": widget.logo,
        "departureTime": "20:15",
        "departureCity": "Cairo",
        "arrivalTime": "10:25",
        "arrivalCity": "Abu-dhabi",
        "price": "6000"
      },

    ];
  }

  Future<void> pickDate({required bool isStart}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Booking' , style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold, color: Colors.white,
        ),),
        backgroundColor: Color(0xFF0D75B4),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        setState(() {
                          selectedFrom = country.name;
                        });
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedFrom ?? "From" ,
                          overflow: TextOverflow.ellipsis ,
                          softWrap: true,

                          ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                SizedBox( height: 10,),
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        setState(() {
                          selectedTo = country.name;
                        });
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedTo ?? "To"),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => pickDate(isStart: true),
                    child: _buildDateBox(startDate, "Start Date"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () => pickDate(isStart: false),
                    child: _buildDateBox(endDate, "End Date"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0D75B4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Search", style: TextStyle(color: Colors.white)),
            ),




            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: flights.length,
                itemBuilder: (context, index) {
                  return _buildFlightCard(flights[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(DateTime? date, String label) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        date == null ? label : "${date.day}/${date.month}/${date.year}",
      ),
    );
  }

  Widget _buildFlightCard(Map<String, String> flight) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(flight['airline']!, style: TextStyle(fontWeight: FontWeight.bold)),
                Image.network(flight['logo']!, height: 30),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${flight['departureTime']} - ${flight['departureCity']}"),
                Icon(Icons.flight),
                Text("${flight['arrivalTime']} - ${flight['arrivalCity']}"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${flight['price']} L.E", style: TextStyle(fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {},
                  style:

                  ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0D75B4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Book Now", style: TextStyle(color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
