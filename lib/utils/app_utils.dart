import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import 'constants.dart';

class AppUtils {
  static List<String> faculties = [
    'Agriculture',
    'Arts',
    'Basic Medical Sciences',
    'Bio-Science',
    'Education',
    'Engineering',
    'Environmental Sciences',
    'Health Sciences and Technology',
    'Law',
    'Management Sciences',
    'Medicine',
    'Pharmaceutical Sciences',
    'Physical Sciences',
    'Social Sciences'
  ];

  static List<String> agricultureDepartments = [
    'Agricultural Economics and Extension',
    'Crop Science and Horticulture',
    'Food Science and Technology',
    'Agricultural Economics and Extension',
    'Fisheries and Aquaculture',
    'Forestry and wildlife Management',
    'Soil Science and Land Resources Management'
  ];

  static List<String> artsDepartments = [
    'Igbo, Asian and African Languages',
    'History and International Studies',
    'Linguistics',
    'Music',
    'Modern European Languages',
    'Philosophy',
    'Religious Studies',
    'Theatre Arts'
  ];

  static List<String> basicMedicalScienceDepartments = [
    'Anatomy',
    'Human Biochemistry',
    'Human Physiology'
  ];

  static List<String> bioScienceDepartments = [
    'Applied Bio-chemistry',
    'Botany',
    'MicroBiology',
    'Parasitology and Entomology',
    'Zoology'
  ];

  static List<String> educationDepartments = [
    'Adult and Continuing Education',
    'Education Management and Policy',
    'Early Childhood and Primary Education',
    'Educational foundation',
    'Guidance and Counselling',
    'Human Kinetics and Health Education',
    'Library and Information Science',
    'Science Education',
    'Technology and Vocational Education'
  ];

  static List<String> engineeringDepartments = [
    'Agriculture/BioResources Engineering',
    'Civil Engineering',
    'Chemical Engineering',
    'Electrical Engineering',
    'Electronics/Computer Engineering',
    'Industrial/Production Engineering',
    'Metallurgical Engineering',
    'Mechanical Engineering',
    'Polymer/Textile Engineering'
  ];

  static List<String> environmentalScienceDepartments = [
    'Architecture',
    'Building',
    'Environmental Management',
    'Estate Management',
    'Fine and Applied Arts',
    'Geography and Meteorology',
    'Quantity Surveying',
    'Surveying and Geo-Informatics'
  ];

  static List<String> healthScienceAndTechDepartments = [
    'Medical Lab Science',
    'Nursing Science',
    'Environmental Health Science',
    'Radiography',
    'Medical Rehabilitation'
  ];

  static List<String> lawDepartments = [
    'Law',
  ];

  static List<String> managementScienceDepartments = [
    'Accountancy/Accounting',
    'Banking and Finance',
    'Business Administration',
    'Cooperative Economics and Management',
    'Marketing',
    'Public Administration',
    'Entrepreneurship'
  ];

  static List<String> medicineDepartments = [
    'Medicine',
  ];

  static List<String> pharmaceuticalScienceDepartments = [
    'Pharmacy',
  ];

  static List<String> physicalScienceDepartments = [
    'Computer Science',
    'Industrial Physics',
    'Industrial Chemistry',
    'Geological Science',
    'Statistics',
    'GeoPhysics'
  ];

  static List<String> socialScienceDepartments = [
    'Economics',
    'Mass Communication',
    'Political Science',
    'Psychology',
    'Sociology and Anthropology'
  ];

  static List<String> semesters = [
    'First semester',
    'Second semester'
  ];

  static List<String> levels = [
    '100 level',
    '200 level',
    '300 level',
    '400 level',
    '500 level',
  ];

  static List<String>?setupDepartments(String faculty) {
    switch (faculty) {
      case Constants.ARTS:
        return artsDepartments;
      case Constants.BASIC_MEDICAL_SCIENCES:
        return basicMedicalScienceDepartments;
      case Constants.BIO_SCIENCES:
        return bioScienceDepartments;
      case Constants.EDUCATION:
        return educationDepartments;
      case Constants.ENGINEERING:
        return engineeringDepartments;
      case Constants.ENVIRONMENTAL_SCIENCES:
        return environmentalScienceDepartments;
      case Constants.MANAGEMENT_SCIENCES:
        return managementScienceDepartments;
      case Constants.MEDICINE:
        return medicineDepartments;
      case Constants.PHARMACEUTICAL_SCIENCE:
        return pharmaceuticalScienceDepartments;
      case Constants.PHYSICAL_SCIENCES:
        return physicalScienceDepartments;
      case Constants.SOCIAL_SCIENCES:
        return socialScienceDepartments;
      case Constants.HEALTH_SCIENCES_AND_TECH:
        return healthScienceAndTechDepartments;
      case Constants.AGRICULTURE:
        return agricultureDepartments;
      case Constants.LAW:
        return lawDepartments;
      default:
        return List.empty();
    }
  }

  static String getFacultyIdFromName(String faculty) {
    switch (faculty) {
      case Constants.ARTS:
        return '1';
      case Constants.BASIC_MEDICAL_SCIENCES:
        return '2';
      case Constants.BIO_SCIENCES:
        return '3';
      case Constants.EDUCATION:
        return '4';
      case Constants.ENGINEERING:
        return '5';
      case Constants.ENVIRONMENTAL_SCIENCES:
        return '6';
      case Constants.MANAGEMENT_SCIENCES:
        return '7';
      case Constants.MEDICINE:
        return '8';
      case Constants.PHARMACEUTICAL_SCIENCE:
        return '9';
      case Constants.PHYSICAL_SCIENCES:
        return '10';
      case Constants.SOCIAL_SCIENCES:
        return '11';
      case Constants.HEALTH_SCIENCES_AND_TECH:
        return '12';
      case Constants.AGRICULTURE:
        return '13';
      case Constants.LAW:
        return '14';
      default:
        return '0';
    }
  }

  static String getNoValueOfSemester(String currentSemester) {
    if (currentSemester == 'First semester') {
      return Constants.FIRST_SEMESTER;
    } else {
      return Constants.SECOND_SEMESTER;
    }
  }

  static showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static ProgressDialog showProgressDialog(BuildContext context, String message) {
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog = ProgressDialog(
        context,
        type: ProgressDialogType.normal,
        isDismissible: true
    );
    progressDialog.style(
        message: message,
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: const CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    progressDialog.show();
    return progressDialog;
  }

  static Future<String?> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId!;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor!;
    } else {
      return null;
    }
  }
}