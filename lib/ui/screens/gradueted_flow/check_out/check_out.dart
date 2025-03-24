import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/mainscreen.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});
  static const String routeName = 'checkout';

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int activeStep = 0; // بدأنا من الخطوة الأولى
  final PageController _pageController = PageController();

  void _goToStep(int index) {
    setState(() => activeStep = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextStep() {
    if (activeStep < 2) {
      _goToStep(activeStep + 1);
    }
  }

  void _previousStep() {
    if (activeStep > 0) {
      _goToStep(activeStep - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: EasyStepper(
                  activeStep: activeStep,
                  lineStyle: const LineStyle(
                    lineLength: 100,
                    lineType: LineType.normal,
                    defaultLineColor: Colors.grey,
                    finishedLineColor: Color(0xFF1B875A),
                  ),
                  activeStepTextColor: Colors.black,
                  finishedStepTextColor: Colors.black,
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  stepRadius: 15,
                  showStepBorder: false,
                  steps: [
                    EasyStep(
                      customStep: _buildStep(0, '1'),
                      title: 'Shipping',
                    ),
                    EasyStep(
                      customStep: _buildStep(1, '2'),
                      title: 'Payment',
                    ),
                    EasyStep(
                      customStep: _buildStep(2, '3'),
                      title: 'Review',
                    ),
                  ],
                  onStepReached: _goToStep,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ShippingPage(onNext: _nextStep),
                PaymentPage(onNext: _nextStep, onBack: _previousStep),
                ReviewPage(onBack: _previousStep),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int stepIndex, String stepNumber) {
    bool isCompleted = activeStep > stepIndex;
    bool isActive = activeStep == stepIndex;

    return isCompleted
        ? const CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xFF1B875A),
            child: Icon(Icons.check, color: Colors.white, size: 20),
          )
        : CircleAvatar(
            radius: 15,
            backgroundColor:
                isActive ? Colors.grey.shade200 : Colors.grey.shade500,
            child: Text(
              stepNumber,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}

// 🛒 صفحة الشحن
class ShippingPage extends StatelessWidget {
  final VoidCallback onNext;
  const ShippingPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('🛒 Shipping Page', style: TextStyle(fontSize: 22)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: AppButton(onTap: onNext, text: "Next"),
        ),
      ],
    );
  }
}

// 💳 صفحة الدفع
class PaymentPage extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const PaymentPage({super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('💳 Payment Page', style: TextStyle(fontSize: 22)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppButton(onTap: onBack, text: "Previous"),
            AppButton(onTap: onNext, text: "Next"),
          ],
        ),
      ],
    );
  }
}

// ✅ صفحة المراجعة
class ReviewPage extends StatelessWidget {
  final VoidCallback onBack;
  const ReviewPage({super.key, required this.onBack});

  void _completeOrder(BuildContext context) {
    // 🔹 الانتقال إلى الصفحة الرئيسية بعد إتمام الطلب
    Navigator.pushReplacementNamed(context, MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('✅ Review Page', style: TextStyle(fontSize: 22)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppButton(onTap: onBack, text: "Previous"),
            AppButton(
                onTap: () {
                  _completeOrder(context);
                },
                text: "Next"),
          ],
        ),
      ],
    );
  }
}
