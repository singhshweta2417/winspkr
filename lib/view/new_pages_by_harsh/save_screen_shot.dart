import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fomoplay/constants/app_button.dart';
import 'package:fomoplay/constants/app_colors.dart';
import 'package:fomoplay/constants/gradient_app_bar.dart';
import 'package:fomoplay/constants/text_widget.dart';
import 'package:fomoplay/main.dart';
import 'package:image_picker/image_picker.dart';

class SaveScreenShot extends StatefulWidget {
  final String amount;

  const SaveScreenShot({super.key, required this.amount});
  @override
  State<SaveScreenShot> createState() => _SaveScreenShotState();
}

class _SaveScreenShotState extends State<SaveScreenShot> {
  String imagePath = "";
  String uploadedImageUrl = "";
  String qrCodeUrl = "";
  String walletAddress = "";

  final ImagePicker _picker = ImagePicker();

  bool loader = false;

  @override
  void initState() {
    super.initState();
    // fetchQrData();
  }

  // Future<void> fetchQrData() async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(ApiUrl.depositQR),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({"type": "1"}),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       var jsonResponse = jsonDecode(response.body);
  //       if (jsonResponse["data"] != null && jsonResponse["data"].isNotEmpty) {
  //         var data = jsonResponse["data"][0];
  //
  //         setState(() {
  //           qrCodeUrl = data["qr_code"] ?? '';
  //           walletAddress = data["wallet_address"] ?? '';
  //         });
  //       } else {
  //         setState(() {
  //           qrCodeUrl = '';
  //           walletAddress = '';
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Error fetching QR data: $e");
  //     }
  //     setState(() {
  //       qrCodeUrl = '';
  //       walletAddress = '';
  //     });
  //   }
  // }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  // UserViewProvider userProvider = UserViewProvider();

  Future<void> _uploadImage(File imageFile) async {
    setState(() {
      loader = true;
    });

    // UserModel user = await userProvider.getUser();
    //   String userid = user.id.toString();
    //   try {
    //     List<int> imageBytes = await imageFile.readAsBytes();
    //     String base64Image = base64Encode(imageBytes);
    //
    //     print(base64Image);
    //
    //     var body = {
    //       "user_id": userid,
    //       "cash": widget.amount,
    //       "type": "1",
    //       "screenshot": base64Image,
    //     };
    //
    //     var response = await http.post(
    //       Uri.parse(ApiUrl.usdtpayinNew),
    //       headers: {
    //         "Content-Type": "application/json",
    //       },
    //       body: jsonEncode(body),
    //     );
    //
    //     if (response.statusCode == 200) {
    //       setState(() {
    //         loader=false;
    //       });
    //
    //       var responseData = jsonDecode(response.body);
    //       print(base64Image);
    //       print("base64Image");
    //       String message = responseData["message"];
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text(message)),
    //       );
    //       Navigator.pop(context);
    //     } else {
    //       setState(() {
    //         loader=false;
    //       });
    //       if (kDebugMode) {
    //         print("Image upload failed with status code: ${response.statusCode}");
    //       }
    //     }
    //   } catch (e) {
    //     setState(() {
    //       loader=false;
    //     });
    //     if (kDebugMode) {
    //       print("Error uploading image: $e");
    //     }
    //   }
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: const Text("Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: const Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: Text(
          'Upload ScreenShot',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.whiteColor),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text("Total amount: ${widget.amount}",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // Center(
          //   child: qrCodeUrl.isNotEmpty
          //       ? Image.network(qrCodeUrl.toString(),
          //           height: 250, width: 250, fit: BoxFit.cover)
          //       : const CircularProgressIndicator(),
          // ),
          Center(
            child: Container(
              height: 300, width: 300,color: Colors.blue,),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                  title: walletAddress.isNotEmpty
                      ? walletAddress
                      : 'Fetching Wallet Address...',
                  fontSize: 12,
                  color: AppColors.blackColor),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: walletAddress.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Wallet Address Copied!")),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blackColor,
                  ),
                  child: const TextWidget(
                      title: "Copy", fontSize: 15, color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: uploadedImageUrl.isNotEmpty
                ? Image.network(uploadedImageUrl,
                    height: 150, width: 150, fit: BoxFit.cover)
                : imagePath.isNotEmpty
                    ? Image.file(File(imagePath),
                height: 150, width: 150, fit: BoxFit.cover)
                    : const Text("No image selected"),
          ),
          const SizedBox(height: 20),
          Center(
            child: AppBtn(
              width: 200,
              onTap: () => _settingModalBottomSheet(context),
              title: "Upload Screenshot",
              titleColor: Colors.white,
              gradient: AppColors.appBarGradient2,
            ),
          ),
          const SizedBox(height: 20),
          AppBtn(
            loading: loader,
            onTap: () {
              if (uploadedImageUrl.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Image uploaded successfully!")),
                );
              } else if (imagePath.isNotEmpty) {
                _uploadImage(File(imagePath)).then((_) {}).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error uploading image: $e")),
                  );
                });
              } else {
                // Show a SnackBar if no image is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Please select an image first.")),
                );
              }
            },
            title: "Confirm",
          )
        ],
      ),
    );
  }
}
