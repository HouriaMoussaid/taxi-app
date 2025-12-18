import 'package:flutter/material.dart';

class RequestRidePage extends StatefulWidget {
  const RequestRidePage({Key? key}) : super(key: key);

  @override
  State<RequestRidePage> createState() => _RequestRidePageState();
}

class _RequestRidePageState extends State<RequestRidePage> {
  int _selectedVehicle = 0;
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          // Handle élégant
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 5,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.8),
              borderRadius: BorderRadius.circular(3),
            ),
          ),

          const SizedBox(height: 8),

          // Header avec logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.directions_car,
                        color: Colors.deepOrange,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RÉSERVATION',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          'Transport',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Ligne de séparation
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.black.withOpacity(0.1),
          ),

          const SizedBox(height: 24),

          // Contenu scrollable
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section départ
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'LIEU DE DÉPART',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.15),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.deepOrange,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _departureController,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Adresse de départ',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.gps_fixed,
                              color: Colors.deepOrange,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Section destination
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'DESTINATION',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.15),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.flag,
                              color: Colors.deepOrange,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _destinationController,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Adresse de destination',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.deepOrange,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Section type de véhicule
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'TYPE DE VÉHICULE',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(width: 4),
                        _buildVehicleCard(
                          0,
                          Icons.directions_car_outlined,
                          'Standard',
                          'Idéal pour 1-4 personnes',
                          '15-25 DH',
                        ),
                        const SizedBox(width: 16),
                        _buildVehicleCard(
                          1,
                          Icons.airport_shuttle_outlined,
                          'Van',
                          'Parfait pour les groupes',
                          '30-45 DH',
                        ),
                        const SizedBox(width: 16),
                        _buildVehicleCard(
                          2,
                          Icons.two_wheeler_outlined,
                          'Moto',
                          'Rapide et économique',
                          '8-15 DH',
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Bouton de confirmation
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepOrange,
                          Colors.deepOrange.withOpacity(0.9),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 12),
                                  Text(
                                    'Réservation confirmée !',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.deepOrange,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_car_filled,
                                color: Colors.white,
                                size: 26,
                              ),
                              SizedBox(width: 16),
                              Text(
                                'CONFIRMER LA RÉSERVATION',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Note d'information
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.08),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            color: Colors.deepOrange,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text(
                            'Les prix sont indicatifs et peuvent varier selon la distance, la demande et les conditions de trafic.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard(
      int index,
      IconData icon,
      String title,
      String subtitle,
      String price,
      ) {
    bool isSelected = _selectedVehicle == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedVehicle = index),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange.withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.deepOrange : Colors.black.withOpacity(0.1),
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.deepOrange.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepOrange : Colors.black.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.black,
                  size: 26,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.deepOrange : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepOrange.withOpacity(0.15) : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.deepOrange : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}