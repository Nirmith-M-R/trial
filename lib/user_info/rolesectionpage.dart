import 'package:flutter/material.dart';

class RiderPassengerPage extends StatefulWidget {
  @override
  _RiderPassengerPageState createState() => _RiderPassengerPageState();
}

class _RiderPassengerPageState extends State<RiderPassengerPage> {
  String selectedRole = '';
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final List<TextEditingController> checkpointControllers = [];
  // final TextEditingController seatsController = TextEditingController();

  final TextEditingController passengerSourceController =
      TextEditingController();
  final TextEditingController passengerDestinationController =
      TextEditingController();

  void addCheckpoint() {
    setState(() {
      checkpointControllers.add(TextEditingController());
    });
  }

  void removeCheckpoint(int index) {
    setState(() {
      checkpointControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider or Passenger'),
        backgroundColor: Colors.green,
      ),
      resizeToAvoidBottomInset: true, // Ensures UI adjusts to avoid keyboard overlap
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Your Role:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     GestureDetector(
              //       onTap: () => setState(() {
              //         selectedRole = 'Passenger';
              //       }),
              //       child: RoleBlock(
              //         label: 'Passenger',
              //         isSelected: selectedRole == 'Passenger',
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () => setState(() {
              //         selectedRole = 'Rider';
              //       }),
              //       child: RoleBlock(
              //         label: 'Rider',
              //         isSelected: selectedRole == 'Rider',
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              // if (selectedRole == 'Passenger') ...[
              //   const Text(
              //     'Passenger Details',
              //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //   ),
                // const SizedBox(height: 10),
                // TextField(
                //   controller: passengerSourceController,
                //   decoration: const InputDecoration(
                //     labelText: 'Source',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // TextField(
                //   controller: passengerDestinationController,
                //   decoration: const InputDecoration(
                //     labelText: 'Destination',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
              // ] else if (selectedRole == 'Rider') ...[
              //   const Text(
              //     'Rider Details',
              //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //   ),
                const SizedBox(height: 10),
                TextField(
                  controller: sourceController,
                  decoration: const InputDecoration(
                    labelText: 'Source',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: destinationController,
                  decoration: const InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Checkpoints',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200, // Set a fixed height for the scrollable area
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < checkpointControllers.length; i++)
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: checkpointControllers[i],
                                  decoration: InputDecoration(
                                    labelText: 'Checkpoint ${i + 1}',
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove_circle,
                                    color: Colors.red),
                                onPressed: () => removeCheckpoint(i),
                              ),
                            ],
                          ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addCheckpoint,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Add Checkpoint'),
                ),
                const SizedBox(height: 10),
                // TextField(
                //   controller: seatsController,
                //   keyboardType: TextInputType.number,
                //   decoration: const InputDecoration(
                //     labelText: 'Number of Seats Available',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
              // ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (selectedRole.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all details to proceed.'),
                      ),
                    );
                    return;
                  }

                  // if (selectedRole == 'Passenger') {
                  //   final passengerSource = passengerSourceController.text;
                  //   final passengerDestination =
                  //       passengerDestinationController.text;

                  //   print('Passenger Source: $passengerSource');
                  //   print('Passenger Destination: $passengerDestination');
                  // } else if (selectedRole == 'Rider') {
                    final source = sourceController.text;
                    final destination = destinationController.text;
                    final checkpoints = checkpointControllers
                        .map((controller) => controller.text)
                        .toList();
                    // final seats = seatsController.text;

                    print('Rider Source: $source');
                    print('Rider Destination: $destination');
                    print('Rider Checkpoints: $checkpoints');
                    // print('Seats Available: $seats');
                  // }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$selectedRole details submitted!')),
                  );

                  // Clear fields
                  passengerSourceController.clear();
                  passengerDestinationController.clear();
                  sourceController.clear();
                  destinationController.clear();
                  checkpointControllers.clear();
                  // seatsController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleBlock extends StatelessWidget {
  final String label;
  final bool isSelected;

  const RoleBlock({Key? key, required this.label, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey,
          width: 2,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
