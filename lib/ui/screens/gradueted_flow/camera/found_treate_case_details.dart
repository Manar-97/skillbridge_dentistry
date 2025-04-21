import 'package:flutter/material.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/mains_dentist_creen.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';

class FoundTreatCaseDetails extends StatefulWidget {
  const FoundTreatCaseDetails({super.key});
  static const String routeName = 'treatcasedetails';

  @override
  State<FoundTreatCaseDetails> createState() => _FoundTreatCaseDetailsState();
}

class _FoundTreatCaseDetailsState extends State<FoundTreatCaseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Consultant Name',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            const Text(
              'dentistname55@gmail.com',
              style: TextStyle(color: Color(0xFF898989), fontSize: 17),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: const Image(image: AssetImage('assets/p1.png')),
            ),
            const Text(
              'Treatment the case',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              'Lorem ipsum dolor sit amet consectetur. Risus et tempor congue id tortor. Non nisi sagittis bibendum nisl.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              '21 Sep 2024',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: AppButton(
                onTap: () {
                  _showSuccessDialog(context);
                },
                text: "OK",
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // يمنع الإغلاق بالنقر خارج النافذة
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 180,
                  width: 300,
                  child: Image.asset(
                    'assets/processing.png',
                    fit: BoxFit.cover,
                  ),
                ), // ضع صورة علامة الصح هنا
                const SizedBox(height: 15),
                const Text(
                  "Thank you for your trust Alwayes SkillBridge in your own",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 20),
                AppButton(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, MainDentistScreen.routeName),
                  text: "OK",
                ),
              ],
            ),
          ),
        );
      },
    );
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pop();
    //   Future.delayed(Duration(milliseconds: 300), () {
    //     showDialog(
    //       context: context,
    //       barrierDismissible: false, // يمنع الإغلاق بالنقر خارج النافذة
    //       builder: (context) {
    //         return Dialog(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Padding(
    //             padding: const EdgeInsets.all(20.0),
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Image.asset('assets/sent.png',
    //                     width: 80), // ضع صورة علامة الصح هنا
    //                 const SizedBox(height: 10),
    //                 const Text(
    //                   "Your case is being sent to a specialist. You will receive a response as soon as possible.",
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(fontSize: 14, color: Colors.grey),
    //                 ),
    //                 const SizedBox(height: 20),
    //                 AppButton(
    //                   onTap: () => Navigator.pushReplacementNamed(
    //                       context, MainDentistScreen.routeName),
    //                   text: "OK",
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //   });
    // });
  }
}
