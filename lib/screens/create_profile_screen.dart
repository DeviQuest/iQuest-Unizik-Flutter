import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iquest_unizik/data/local/shared_pref_util.dart';
import 'package:iquest_unizik/data/models/auth_request_dto.dart';
import 'package:iquest_unizik/utils/app_utils.dart';
import 'package:iquest_unizik/utils/constants.dart';
import 'package:iquest_unizik/utils/utils.dart';
import 'package:iquest_unizik/widgets/bottom_sheet_trigger.dart';
import 'package:iquest_unizik/widgets/widget.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '/utils/colors.dart' as color;

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

late final ProgressDialog _progressDialog;
final AuthRequestDto authRequestDto = AuthRequestDto();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
);

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  String faculty = 'Faculty';
  String department = 'Department';
  String level = 'Level';
  String semester = 'Semester';
  
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    //_googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Create an account to continue',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 37),
                MyTextField(
                  hintText: 'Username',
                  inputType: TextInputType.text,
                  textEditingController: _usernameController,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hintText: 'Phone no',
                  inputType: TextInputType.phone,
                  textEditingController: _phoneNoController,
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: BottomSheetTrigger(text: faculty),
                  onTap: () => setState(() {
                    _openBottomSheetDialog(context, listType: Constants.FACULTIES);
                  }),
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: BottomSheetTrigger(text: department),
                  onTap: () => setState(() {
                    if (faculty == 'Faculty') {
                      AppUtils.showSnackBar(context, 'Kindly select you faculty');
                    } else {
                      _openBottomSheetDialog(context, listType: Constants.DEPARTMENTS);
                    }
                  }),
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: BottomSheetTrigger(text: level),
                  onTap: () => setState(() {
                    _openBottomSheetDialog(context, listType: Constants.LEVEL);
                  }),
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: BottomSheetTrigger(text: semester),
                  onTap: () => setState(() {
                    _openBottomSheetDialog(context, listType: Constants.CURRENT_SEMESTER);
                  }),
                ),
                const SizedBox(height: 30),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: color.AppColors.accent)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/google.png'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Sign Up With Google',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: color.AppColors.accent
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => setState(() {
                    authRequestDto.username = _usernameController.text;
                    authRequestDto.phone = _phoneNoController.text;
                    authRequestDto.facultyId = AppUtils.getFacultyIdFromName(faculty);
                    authRequestDto.department = department;
                    authRequestDto.level = level;
                    authRequestDto.currentSemester = AppUtils.getNoValueOfSemester(semester);

                    if (!Validator.validateMobileNo(authRequestDto.phone)) {
                      AppUtils.showSnackBar(context, 'Phone no entered is not valid');
                    } else if (!Validator.validateCreateProfileInput(authRequestDto)) {
                      AppUtils.showSnackBar(context, 'Every field needs to be entered');
                    } else {
                      _startGoogleSignIn();
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _openBottomSheetDialog(BuildContext context, {required String listType}) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(
                listType,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: _getListOfItemsByType(listType).length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Text(
                          '•',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: color.AppColors.accent
                          ),
                        ),
                        title: Text(
                          _getListOfItemsByType(listType).elementAt(index),
                          style: const TextStyle(
                              fontSize: 15
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(right: 20, left: 20),
                        onTap: () => setState(() {
                          switch(listType) {
                            case Constants.FACULTIES: {
                              faculty = _getListOfItemsByType(listType).elementAt(index);
                              department = AppUtils.setupDepartments(faculty)!.elementAt(0);
                              break;
                            }
                            case Constants.DEPARTMENTS: {
                              department = _getListOfItemsByType(listType).elementAt(index);
                              break;
                            }
                            case Constants.CURRENT_SEMESTER: {
                              semester = _getListOfItemsByType(listType).elementAt(index);
                              break;
                            }
                            case Constants.LEVEL: {
                              level = _getListOfItemsByType(listType).elementAt(index);
                              break;
                            }
                          }
                          Navigator.pop(context);
                        }),
                      );
                    }
                ),
              )
            ],
          );
        }
    );
  }

  List<String> _getListOfItemsByType(String listType) {
    switch(listType) {
      case Constants.FACULTIES: {
        return AppUtils.faculties;
      }
      case Constants.DEPARTMENTS: {
        return AppUtils.setupDepartments(faculty)!;
      }
      case Constants.CURRENT_SEMESTER: {
        return AppUtils.semesters;
      }
      case Constants.LEVEL: {
        return AppUtils.levels;
      }
      default: {
        return [];
      }
    }
  }

  Future<void> _startGoogleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();
      final authentication = await result?.authentication;

      _progressDialog = AppUtils.showProgressDialog(context, 'Please wait...');
      _firebaseAuthWithGoogle(authentication);
    } catch(e) {
      print(':::::: SIGN_IN_EXCEPTION :::::: $e');
    }
  }
}

Future<void> _firebaseAuthWithGoogle(GoogleSignInAuthentication? authentication) async {
  try {
    final String? idToken = authentication?.idToken;
    final String? accessToken = authentication?.accessToken;

    var credential = GoogleAuthProvider.credential(idToken: idToken, accessToken: accessToken);
    var signedInUser = await _firebaseAuth.signInWithCredential(credential);
    var tokenResult = await signedInUser.user?.getIdTokenResult(true);
    var token = tokenResult?.token;

    sendSignInDataToServer(token, signedInUser);
    _googleSignIn.disconnect();
  } catch(e) {
    print(':::::: FIREBASE_AUTH_WITH_GOOGLE_EXCEPTION :::::: $e');
  }
}

Future<void> sendSignInDataToServer(String? token, UserCredential signedInUser) async {
  authRequestDto.token = token!;
  authRequestDto.imageUrl = signedInUser.user?.photoURL;
  authRequestDto.uid = signedInUser.user!.uid;
  authRequestDto.deviceId = await AppUtils.getDeviceID();

  _progressDialog.hide();
  print('TOKEN::::::::: $token');
  print('IMAGE::::::::: ${authRequestDto.imageUrl}');
  print('UID::::::::: ${authRequestDto.uid}');
  print('DEVICE::::::::: ${authRequestDto.deviceId}');
}
