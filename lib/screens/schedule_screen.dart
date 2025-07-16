import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final TextEditingController dateCtrl = TextEditingController();
  final TextEditingController timeCtrl = TextEditingController();
  final TextEditingController locationCtrl = TextEditingController();

  bool isWalkIn = false;
  bool isPickup = false;
  bool isDelivery = false;

  String? selectedService;
  final List<String> allServices = [
    'Dry Cleaning',
    'Wash-Dry-Fold',
    'Handwash',
    'Shoe Cleaning',
    'Press',
    'Corporate Account',
  ];

  @override
  void dispose() {
    dateCtrl.dispose();
    timeCtrl.dispose();
    locationCtrl.dispose();
    super.dispose();
  }

  void confirmSchedule() {
    if (selectedService == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a service.")),
      );
      return;
    }

    if (dateCtrl.text.isEmpty || timeCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select date and time.")),
      );
      return;
    }

    if ((isPickup || isDelivery) && locationCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a location.")),
      );
      return;
    }

    if (!isWalkIn && !isPickup && !isDelivery) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select at least one service type.")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Schedule submitted for $selectedService!")),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args['service'] != null) {
      selectedService = args['service'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Pickup"),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: selectedService,
              items: allServices
                  .map((service) => DropdownMenuItem<String>(
                        value: service,
                        child: Text(service),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedService = value);
              },
              decoration: InputDecoration(
                labelText: "Select Service",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dateCtrl,
              decoration: InputDecoration(
                labelText: 'Select Date',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  dateCtrl.text = "${picked.year}-${picked.month}-${picked.day}";
                }
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: timeCtrl,
              decoration: InputDecoration(
                labelText: 'Select Time',
                suffixIcon: Icon(Icons.access_time),
              ),
              readOnly: true,
              onTap: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  timeCtrl.text = picked.format(context);
                }
              },
            ),
            SizedBox(height: 24),
            Text("Select Service Type", style: TextStyle(fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text("Walk-in"),
              value: isWalkIn,
              onChanged: (value) => setState(() => isWalkIn = value ?? false),
            ),
            CheckboxListTile(
              title: Text("Pick-up"),
              value: isPickup,
              onChanged: (value) => setState(() => isPickup = value ?? false),
            ),
            CheckboxListTile(
              title: Text("Delivery"),
              value: isDelivery,
              onChanged: (value) => setState(() => isDelivery = value ?? false),
            ),
            if (isPickup || isDelivery) ...[
              SizedBox(height: 16),
              TextField(
                controller: locationCtrl,
                decoration: InputDecoration(
                  labelText: 'Enter Location',
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
            ],
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: confirmSchedule,
              child: Text("Confirm Pickup Schedule"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFFA1356A),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
