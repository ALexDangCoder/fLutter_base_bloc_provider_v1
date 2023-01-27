import 'package:flutter/material.dart';

import '../core/widgets/appointment_card.dart';

class TestComponent extends StatelessWidget {
  const TestComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        const SizedBox(
          height: 120,
        ),
        AppointmentCard(
          title: "Women-Baby's Centre ANNA",
          subtitles: const ['Obstetrician', 'Gynaecologist', 'Paediatrician'],
          locationText:
              'Aura Condominium, Ground Floor, #87 Preah Trasak Paem St. (63) (corner of 172), Phnom Penh, Cambodia',
          phoneNumber: '+855 98 800 921',
          onTap: () {},
        ),
      ]),
    );
  }
}
