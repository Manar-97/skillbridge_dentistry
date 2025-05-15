import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/register/UI/widget/consultant_signup_button.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/register/VM/consultant_register_event.dart';
import '../../../../../di/di.dart';
import '../../../../utils/core/assets_manager.dart';
import '../../../../utils/validators.dart';
import '../../../../utils/widgets/apptextfield.dart';
import '../../../../utils/widgets/dialogs.dart';
import '../../../Auth/presentation/login/UI/login.dart';
import '../VM/consultant_register_cubit_state.dart';
import '../VM/consultant_register_vm.dart';

class ConsultantRegister extends StatefulWidget {
  const ConsultantRegister({super.key});
  static const String routeName = 'consultantRegister';

  @override
  State<ConsultantRegister> createState() => _ConsultantRegisterState();
}

class _ConsultantRegisterState extends State<ConsultantRegister> {
  final RegisterConsultantCubit registerConsultantCubit =
      getIt.get<RegisterConsultantCubit>();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerConsultantCubit,
      child: BlocConsumer(
          listener: (context, state) {
            if (state is FailReg) {
              Dialogs.alertDialog(
                  message: state.error ?? "",
                  animation: Lottie.asset(AnimationAssets.error),
                  negativeAction: () {
                    Navigator.pop(context);
                  },
                  negativeFeedback: 'OK',
                  context: context);
            } else if (state is NavigateToLogin) {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) => Login()));
            } else if (state is SuccessReg) {
              Dialogs.successDialog(context: context);
            } else if (state is HideLoadingDialog) {
              Navigator.pop(context);
            } else if (state is LoadingReg) {
              Dialogs.loading(context: context);
            }
          },
          builder: (context, state) => Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Form(
                      key: registerConsultantCubit.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          Text(
                            'Register',
                            style: GoogleFonts.getFont('Inter',
                                color: const Color(0xFF5D9F99),
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(
                            'Create your new account',
                            style: GoogleFonts.getFont('Inter',
                                color: const Color(0xFF898989),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          BuildTextField(
                            hint: 'enter your email',
                            label: 'E-mail',
                            textInputType: TextInputType.emailAddress,
                            validation: AppValidators.validateEmail,
                            controller: registerConsultantCubit.email,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          BuildTextField(
                            hint: 'enter your password',
                            label: 'Password',
                            textInputType: TextInputType.visiblePassword,
                            validation: AppValidators.validatePassword,
                            controller: registerConsultantCubit.password,
                            isObscured: true,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          BuildTextField(
                            hint: 'confirm your password',
                            label: 'Re_enter Password',
                            textInputType: TextInputType.visiblePassword,
                            validation: AppValidators.validatePassword,
                            controller: registerConsultantCubit.rePassword,
                            isObscured: true,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          BuildTextField(
                            hint: 'enter your full name',
                            label: 'Full Name',
                            textInputType: TextInputType.text,
                            validation: AppValidators.validateFullName,
                            controller: registerConsultantCubit.fullName,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          BuildTextField(
                            hint: 'Years of Experience',
                            label: 'Years of Experience',
                            textInputType: TextInputType.number,
                            validation: AppValidators.validateEmail,
                            controller:
                                registerConsultantCubit.yearOfExperience,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text('Department/Specialization',
                                style: GoogleFonts.inter(
                                    fontSize: 14, color: Colors.grey[700])),
                          ),
                          DropdownButtonFormField<String>(
                            style: const TextStyle(color: Colors.black54)
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                            value: registerConsultantCubit.department,
                            items: [
                              'Periodontics',
                              'Orthodontics',
                              'Pathology Dentistry',
                              'Oral Surgery',
                              'Operative Dentistry',
                              'Other'
                            ]
                                .map((dep) => DropdownMenuItem(
                                    value: dep, child: Text(dep)))
                                .toList(),
                            onChanged: (value) => setState(() =>
                                registerConsultantCubit.department = value!),
                            validator: (value) => value == null
                                ? 'Please select a department'
                                : null,
                            decoration: InputDecoration(
                                filled: true,
                                hintText: 'Select your department',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                hintStyle: const TextStyle(color: Colors.grey)
                                    .copyWith(fontSize: 14)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          GestureDetector(
                            onTap: () {
                              _pickResume();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Resume link'),
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      registerConsultantCubit.resumePath != null
                                          ? registerConsultantCubit
                                              .resumePath.path
                                              .split('/')
                                              .last
                                          : 'No file selected',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          GestureDetector(
                            onTap: () {
                              _pickPhoto();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('choose profile photo'),
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      registerConsultantCubit.photoPath != null
                                          ? registerConsultantCubit
                                              .photoPath.path
                                              .split('/')
                                              .last
                                          : 'No file selected',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          BuildTextField(
                            hint: 'Tell us about yourself briefly',
                            label: 'Short Biography',
                            textInputType: TextInputType.text,
                            validation: AppValidators.validateEmail,
                            controller: registerConsultantCubit.biography,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          const SignUpButton(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: GoogleFonts.getFont('Inter',
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  registerConsultantCubit
                                      .doEvent(SignInClicked());
                                },
                                child: Text(
                                  ' Sign in',
                                  style: GoogleFonts.getFont('Inter',
                                      color: const Color(0xFF5D9F99),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  // اختيار صورة الملف الشخصي
  Future<void> _pickPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        registerConsultantCubit.photoPath = File(image.path);
      });
    }
  }

  // اختيار ملف السيرة الذاتية
  Future<void> _pickResume() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'pdf',
      'docx',
      'doc',
    ]);
    if (result != null) {
      setState(() {
        registerConsultantCubit.resumePath = File(result.files.single.path!);
      });
    }
  }
}
