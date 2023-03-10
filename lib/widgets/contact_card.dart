import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contactModel;

  ContactCard({required this.contactModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: GlassMorphism(
        color: Colors.white,
        blur: 10,
        opacity: 0.05,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    contactModel.name,
                    minFontSize: 20,
                    maxFontSize: 30,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    contactModel.type,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  // SizedBox(height: 8),
                  // Text(
                  //   contactModel.number.toString(),
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 16,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.phone),
                onPressed: () {
                  // Add code here to initiate a phone call
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
