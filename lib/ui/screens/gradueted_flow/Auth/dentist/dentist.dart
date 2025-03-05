import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';
import '../../../../utils/widgets/apptextfield.dart';
import '../register/register.dart';

class Dentist extends StatefulWidget {
  const Dentist({super.key});
  static const String routeName = 'dentist';
  @override
  State<Dentist> createState() => _DentistState();
}

class _DentistState extends State<Dentist> {
  String? _selectedValue;
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _years = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to\nSkillBridge Dentistry',
              style: GoogleFonts.getFont('Inter',
                  fontSize: 24, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Please complete the following',
              style: GoogleFonts.getFont('Inter',
                  color: const Color(0xFF717070), fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            AppTextField(
              text: 'Full Name',
              hintText: 'Enter the answer',
              controller: _fullName,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            AppTextField(
              text: 'Years of Graduation',
              hintText: 'Enter the answer',
              controller: _years,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'University',
                style: GoogleFonts.getFont('Inter',
                    color: const Color(0xFF717070),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            DropdownButtonFormField<String>(
              value: _selectedValue,
              items: const [
                DropdownMenuItem(
                    value: 'must',
                    child: Text(
                      'MUST',
                    )),
                DropdownMenuItem(
                    value: 'elahram',
                    child: Text(
                      'Elahram',
                    )),
                DropdownMenuItem(
                    value: 'o6u',
                    child: Text(
                      'O6U',
                    )),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select an option';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Select your university',
                hintStyle: GoogleFonts.getFont('Inter',
                    color: const Color(0xFF9D9D9D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Department/Specialization',
                style: GoogleFonts.getFont('Inter',
                    color: const Color(0xFF717070),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            DropdownButtonFormField<String>(
              value: _selectedValue,
              items: const [
                DropdownMenuItem(
                    value: 'must',
                    child: Text(
                      'MUST',
                    )),
                DropdownMenuItem(
                    value: 'elahram',
                    child: Text(
                      'Elahram',
                    )),
                DropdownMenuItem(
                    value: 'o6u',
                    child: Text(
                      'O6U',
                    )),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select an option';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Select your answer',
                hintStyle: GoogleFonts.getFont('Inter',
                    color: const Color(0xFF9D9D9D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            AppButton(
                text: 'Submit',
                onTap: () {
                  Navigator.pushNamed(context, Register.routeName);
                })
          ],
        ),
      ),
    );
  }
}
