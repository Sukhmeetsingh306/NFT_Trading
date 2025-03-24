import 'dart:io';

import 'package:flow/utils/theme/color/color_theme.dart';
import 'package:flow/utils/widget/form/textForm_form.dart';
import 'package:flow/utils/widget/space_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/controllers/register_controllers.dart';
import '../../utils/fonts/google_fonts_utils.dart';
import '../../utils/routes/navigation_routes.dart';
import '../../utils/widget/button_widget_utils.dart';

class RegisterDetailAuthScreen extends StatefulWidget {
  final String email;
  final String password;

  const RegisterDetailAuthScreen(
      {super.key, required this.email, required this.password});

  static String routeName = 'registerDetailPage';
  static String routePath = '/registerDetailPage';

  @override
  State<RegisterDetailAuthScreen> createState() =>
      _RegisterDetailAuthScreenState();
}

class _RegisterDetailAuthScreenState extends State<RegisterDetailAuthScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  final RegisterController _registerController = RegisterController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

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

  Map<String, String>? data;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (data == null) {
      // Extract arguments from ModalRoute safely here
      data = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
      print(
          "Email: ${data?['email']}"); // Debug to confirm data is passed correctly
    }
  }

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _referenceController.dispose();
    _animationController.dispose();
  }

  void reloadWidget() {
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  Widget registerDetailPage(bool isLargeScreen) {
    return SingleChildScrollView(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isLargeScreen ? 500 : double.infinity,
            ),
            child: Container(
              height: isLargeScreen
                  ? MediaQuery.of(context).size.height * 0.8
                  : null,
              padding: EdgeInsets.symmetric(
                horizontal: isLargeScreen ? 50 : 20,
                vertical: isLargeScreen ? 50 : 20,
              ),
              decoration: isLargeScreen
                  ? BoxDecoration(
                      color: ColorTheme.color.primaryBackground,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(20), // Rounded edges
                    )
                  : null,
              child: isLargeScreen
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.7, // Scrollable only on large screens
                      child: SingleChildScrollView(
                        child: formColumn(isLargeScreen),
                      ),
                    )
                  : formColumn(isLargeScreen),
            ),
          ),
        ),
      ),
    );
  }

  Widget formColumn(bool isLargeScreen) {
    return Column(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 18, 20, 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: ColorTheme.color.backgroundBlack,
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
                          sizedBoxH8(),
                          googleInterText(
                            'Upload a photo for us to easily identify you.',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          sizedBoxH15(),
                          textFormField(
                            _nameController,
                            'Your Name',
                            'Enter Name...',
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          sizedBoxH15(),
                          textFormField(
                            _ageController,
                            'Your Age',
                            'Your Age...',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your age';
                              }
                              return null;
                            },
                          ),
                          sizedBoxH15(),
                          IntlPhoneField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: GoogleFonts.getFont(
                                'Inter',
                                color: ColorTheme.color.textWhiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              hintText: 'Your Number',
                              hintStyle: GoogleFonts.getFont(
                                'Inter',
                                color: ColorTheme.color.textWhiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors
                                  .black, // Background color of the input field
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 16),
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            initialCountryCode: 'US',

                            dropdownDecoration: BoxDecoration(
                              color: Colors.black, // Dropdown background color
                              borderRadius: BorderRadius.circular(8),
                            ),

                            dropdownTextStyle: TextStyle(
                              color: Colors.white, // Dropdown text color
                              fontSize: 16,
                            ),

                            dropdownIcon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white, // Dropdown icon color
                            ),

                            onChanged: (phone) {
                              // print(phone.completeNumber);
                            },

                            validator: (phone) {
                              if (phone == null || phone.number.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },

                            // Customize the popup menu using theme
                            style: TextStyle(color: Colors.white),
                          ),
                          sizedBoxH15(),
                          textFormField(
                            _referenceController,
                            'Reference Code (Optional)',
                            'i.e: RY23VG',
                            (value) {
                              if (value != null && value.isNotEmpty) {
                                RegExp regex = RegExp(
                                    r'^[A-Z0-9]{6,10}$'); // Example format
                                if (!regex.hasMatch(value)) {
                                  return 'Enter a valid reference code (6-10 alphanumeric characters)';
                                }
                              }
                              return null; // No validation error if empty
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBoxH15(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: elevatedButton(
                            'Create Account',
                            () async {
                              if (_formKey.currentState!.validate()) {
                                await _registerController.registerUser(
                                  context: context,
                                  name: _nameController.text,
                                  password: widget.password,
                                  email: widget.email,
                                );
                                setState(() {
                                  _formKey.currentState!.reset();
                                });

                                reloadWidget();
                                materialNamedRouteNavigator(
                                  context,
                                  '/loginPage',
                                );
                              }
                            },
                          ),
                        ),
                        sizedBoxH10(),
                        Opacity(
                          opacity: 0.9,
                          child: InkWell(
                            onTap: () async {},
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_rounded,
                                    color:
                                        ColorTheme.color.buttonBackgroundColor,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 24, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        if (Navigator.of(context).canPop()) {
                                          pop(context);
                                        } else {
                                          pushNamedAndRemoveUntil(
                                            context,
                                            '/registerPage',
                                          );
                                        }
                                      },
                                      child: googleInterText(
                                        'Preview',
                                        color: ColorTheme
                                            .color.buttonBackgroundColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  googleInterText(
                                    'Preview email detail!',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth > 900;

        return Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/png/backgroundImageFlip.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: isLargeScreen
                  ? Container(
                      color: Colors.black38,
                      child: Center(child: registerDetailPage(isLargeScreen)))
                  : Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 50, 0, 20),
                      child: registerDetailPage(isLargeScreen)),
            ),
          ],
        );
      }),
    );
  }
}
