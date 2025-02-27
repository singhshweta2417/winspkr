import 'package:flutter/material.dart';
import 'package:fomoplay/constants/gradient_app_bar.dart';
import 'package:fomoplay/constants/app_button.dart';
import 'package:fomoplay/constants/app_colors.dart';
import 'package:fomoplay/constants/custom_text_field.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';
import 'package:fomoplay/utils/utils.dart';
import 'package:fomoplay/view_modal/forget_pass_view_modal.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool hideSetPassword = true;
  bool hideConfirmPassword = true;

  TextEditingController phoneCon = TextEditingController();
  TextEditingController newPasswordCon = TextEditingController();
  TextEditingController confirmPasswordCon = TextEditingController();
  TextEditingController verifyCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgetPassViewModel = Provider.of<ForgetPassViewModel>(context);

    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
          ),
        ),
        title: const Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w900, color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill)),
          child: !forgetPassViewModel.showPasswordFields ? sendOtp(forgetPassViewModel) : createNewPassword(forgetPassViewModel),
        ),
      ),
    );
  }

  Widget sendOtp(ForgetPassViewModel forgetPassViewModel) {
    return Column(
      children: [
        SizedBox(height: height * 0.02),
        Padding(
          padding: EdgeInsets.only(right: width * 0.50),
          child: const Text(
            'Phone Number',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        CustomTextField(
          margin: const EdgeInsets.all(5),
          onChanged: (value) {},
          keyboardType: TextInputType.number,
          controller: phoneCon,
          maxLength: 10,
          hintText: 'Enter Mobile number',
          cursorColor: AppColors.whiteColor,
          hintColor: Colors.grey,
        ),
        if (forgetPassViewModel.isOtpSend)
          CustomTextField(
            controller: verifyCode,
            prefixIcon: const Icon(Icons.verified_user, color: Colors.red),
            maxLines: 1,
            hintText: 'Verification code',
            onChanged: (value) {
              if (value.length == 4) {
                  forgetPassViewModel.verifyOtp(
                    phoneCon.text,
                    verifyCode.text,
                    newPasswordCon.text,
                    context,
                  );
                  forgetPassViewModel.setShowPasswordFields(true);
              }

            },
          )
        else
          const SizedBox(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: AppBtn(
            onTap: () {
              if(phoneCon.text.length == 10){
                forgetPassViewModel.sendOtp(phoneCon.text, context);
              }else{
                Utils.flushBarErrorMessage("Enter a valid mobile number", context);
              }
            },
            title: "Send Otp",
            titleColor: Colors.white,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget createNewPassword(ForgetPassViewModel forgetPassViewModel) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'OTP Has Been Sent To your Phone Number,\n Please Enter New Password',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 15, color: AppColors.whiteColor),
          ),
        ),
        CustomTextField(
          controller: phoneCon,
          maxLines: 1,
          hintText: 'Phone number',
          fieldRadius: BorderRadius.circular(30),
          margin: const EdgeInsets.all(10),
          enabled: false,
        ),
        CustomTextField(
          obscureText: hideSetPassword,
          controller: newPasswordCon,
          maxLines: 1,
          margin: const EdgeInsets.all(10),
          fieldRadius: BorderRadius.circular(30),
          hintText: 'New Password',
          cursorColor: AppColors.whiteColor,
          hintColor: Colors.grey,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hideSetPassword = !hideSetPassword;
              });
            },
            icon: Icon(hideSetPassword ? Icons.visibility_off : Icons.visibility, size: 20, color: AppColors.whiteColor),
          ),
        ),
        CustomTextField(
          obscureText: hideConfirmPassword,
          controller: confirmPasswordCon,
          maxLines: 1,
          margin: const EdgeInsets.all(10),
          hintText: 'Confirm New Password',
          cursorColor: AppColors.whiteColor,
          hintColor: Colors.grey,
          fieldRadius: BorderRadius.circular(30),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hideConfirmPassword = !hideConfirmPassword;
                });
              },
              icon: Icon(hideConfirmPassword ? Icons.visibility_off : Icons.visibility, size: 20, color: AppColors.whiteColor)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: AppBtn(
            loading: forgetPassViewModel.loadingTwo,
            title: 'Submit',
            fontSize: 20,
            onTap: () {
              if(phoneCon.text.isEmpty || phoneCon.text.length!=10){
                Utils.flushBarErrorMessage("Enter phone number", context);
              }else if(newPasswordCon.text.isEmpty){
                Utils.flushBarErrorMessage("Enter new password", context);
              }else if(confirmPasswordCon.text.isEmpty){
                Utils.flushBarErrorMessage("Enter confirm password", context);
              }else{
                forgetPassViewModel.forgetPassApi(
                  phoneCon.text,
                  newPasswordCon.text,
                  confirmPasswordCon.text,
                  context,
                );
              }
            },
            hideBorder: true,
            titleColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

