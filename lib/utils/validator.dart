import 'package:iquest_unizik/data/models/auth_request_dto.dart';

class Validator {

  static bool validateCreateProfileInput(AuthRequestDto authRequestDto) {
    if (authRequestDto.username.isEmpty) {
      return false;
    } else if (authRequestDto.facultyId == '0') {
      return false;
    } else if (authRequestDto.level == 'Level') {
      return false;
    } else if (authRequestDto.currentSemester == 'Semester') {
      return false;
    } else {
      return true;
    }
  }

  static bool validateMobileNo(String mobileNo) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (mobileNo.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(mobileNo)) {
      return false;
    }
    return true;
  }
}