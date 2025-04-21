import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/main_consul_screen.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';
import '../../../utils/widgets/apptextfield.dart';
import '../register/register.dart';

class Consultant extends StatefulWidget {
  const Consultant({super.key});
  static const String routeName = 'consultant';
  @override
  State<Consultant> createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
  String? _selectedValue;
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _years = TextEditingController();
  final TextEditingController _resume = TextEditingController();
  final TextEditingController _biograghy = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Welcome to\nSkillBridge Dentistry',
                style: GoogleFonts.getFont('Inter',
                    fontSize: 24, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
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
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              AppTextField(
                text: 'Years of Experience',
                hintText: 'Enter the answer',
                controller: _years,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
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
                      value: 'dep1',
                      child: Text(
                        'Dep1',
                      )),
                  DropdownMenuItem(
                      value: 'dep2',
                      child: Text(
                        'Dep2',
                      )),
                  DropdownMenuItem(
                      value: 'dep3',
                      child: Text(
                        'Dep3',
                      )),
                  DropdownMenuItem(
                      value: 'other',
                      child: Text(
                        'other',
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
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              AppTextField(
                text: 'Resume link',
                hintText: 'Please enter a URL',
                controller: _resume,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              AppTextField(
                text: 'Short Biography',
                hintText: 'Please write the answer',
                controller: _biograghy,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              AppButton(
                  text: 'Submit',
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, MainConsultantScreen.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
