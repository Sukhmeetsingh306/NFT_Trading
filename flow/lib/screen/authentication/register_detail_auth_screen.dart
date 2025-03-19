import 'dart:io';

import 'package:flow/utils/theme/color/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/fonts/google_fonts_utils.dart';

class RegisterDetailAuthScreen extends StatefulWidget {
  const RegisterDetailAuthScreen({super.key});

  static String routeName = 'registerDetailPage';
  static String routePath = '/registerDetailPage';

  @override
  State<RegisterDetailAuthScreen> createState() =>
      _RegisterDetailAuthScreenState();
}

class _RegisterDetailAuthScreenState extends State<RegisterDetailAuthScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the gallery

  Future<void> _pickImage() async {
    if (Platform.isAndroid) {
      var status = await Permission.photos.request(); // For Android 13+
      if (status.isDenied || status.isPermanentlyDenied) {
        print('Permission denied');
        openAppSettings(); // Open app settings if denied
        return;
      }
    } else if (Platform.isIOS) {
      var status = await Permission.photos.request();
      if (status.isDenied) {
        print('Permission denied');
        openAppSettings(); // Open app settings if denied
        return;
      }
    }

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
  }

  void reloadWidget() {
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/png/backgroundImageFlip.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 50, 0, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 25, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            googleReadexProText(
                              'Complete Profile',
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 18, 20, 0),
                              child: Form(
                                key: _formKey,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorTheme.color.backgroundBlack,
                                    radius: 45,
                                    backgroundImage: _imageFile != null
                                        ? FileImage(_imageFile!)
                                        : null,
                                    child: GestureDetector(
                                      onTap:
                                          _pickImage, // Allow user to pick image even after it's set
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                              offset: Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: _imageFile == null
                                            ? const Icon(
                                                Icons.person_add_alt_1_outlined,
                                                size: 50,
                                                color: Colors.grey,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
