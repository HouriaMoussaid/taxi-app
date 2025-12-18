import 'package:flutter/material.dart';
import 'package:taxi_app/widgets/button.dart';

class BottomPanelDriver extends StatelessWidget {
  

  const BottomPanelDriver({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Text("Chauffeur Trouvé !",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                ButtonWidget(
                  titre: "Annuler", 
                  onPressed: (){}
                ),
                Spacer(),
                ButtonWidget(
                  titre: "Suivant", 
                  onPressed: (){}
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
