class AuthRequestDto {
  late String _username;
  late String _phoneNo;
  late String _facultyId;
  late String _department;
  late String _level;
  late String _currentSemester;
  late String _token;
  String? _playerId;
  late String _uid;
  String? _deviceId;
  String? _imageUrl;

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get phone => _phoneNo;

  String? get imageUrl => _imageUrl;

  set imageUrl(String? value) {
    _imageUrl = value;
  }

  String? get deviceId => _deviceId;

  set deviceId(String? value) {
    _deviceId = value;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  String? get playerId => _playerId;

  set playerId(String? value) {
    _playerId = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get currentSemester => _currentSemester;

  set currentSemester(String value) {
    _currentSemester = value;
  }

  String get level => _level;

  set level(String value) {
    _level = value;
  }

  String get department => _department;

  set department(String value) {
    _department = value;
  }

  String get facultyId => _facultyId;

  set facultyId(String value) {
    _facultyId = value;
  }

  set phone(String value) {
    _phoneNo = value;
  }

  @override
  String toString() {
    return 'AuthRequestDto{_username: $_username, _phoneNo: $_phoneNo, _facultyId: $_facultyId, _department: $_department, _level: $_level, _currentSemester: $_currentSemester, _token: $_token, _playerId: $_playerId, _uid: $_uid, _deviceId: $_deviceId, _imageUrl: $_imageUrl}';
  }
}