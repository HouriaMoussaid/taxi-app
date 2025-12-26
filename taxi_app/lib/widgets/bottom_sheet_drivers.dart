import 'package:flutter/material.dart';
import '../database/driver_database.dart';
import '../models/driver_model.dart';
import '../widgets/button.dart';
import 'driver_card.dart';

class BottomPanelDriver extends StatefulWidget {
  const BottomPanelDriver({
    super.key,
    required this.scrollController,
    this.onDriverSelected,
  });

  final ScrollController scrollController;
  final void Function(Driver driver)? onDriverSelected;

  @override
  State<BottomPanelDriver> createState() => _BottomPanelDriverState();
}

class _BottomPanelDriverState extends State<BottomPanelDriver> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -3)),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Chauffeurs disponibles",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          /// ✅ SQLITE LOAD
          Expanded(
            child: FutureBuilder<List<Driver>>(
              future: DriverDatabase.instance.getAllDrivers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final drivers = snapshot.data!;
                return ListView.builder(
                  controller: widget.scrollController,
                  itemCount: drivers.length,
                  itemBuilder: (_, index) {
                    final driver = drivers[index];
                    final selected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selected
                                ? const Color(0xFFF67F00)
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DriverCard(
                          driverName: driver.name,
                          carType: driver.car,
                          distance: driver.distance,
                          eta: driver.eta,
                          highlight: selected,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  titre: "Choisir",
                  onPressed: selectedIndex == null
                      ? null
                      : () async {
                          final drivers =
                              await DriverDatabase.instance.getAllDrivers();
                          widget.onDriverSelected
                              ?.call(drivers[selectedIndex!]);
                        },
                  color: const Color(0xFFF67F00),
                  colorFont: Colors.white,
                  width: double.infinity,
                  height: 50,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ButtonWidget(
                  titre: "Annuler",
                  onPressed: () => Navigator.pop(context),
                  color: Colors.white,
                  colorFont: const Color(0xFFF67F00),
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
