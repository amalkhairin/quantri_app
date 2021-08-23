class User {
  String? userID;
  String? password;
  String? name;
  String? email;
  String? address;
  String? phoneNumber;
  String? ktpNumber;
  String? ktpPhoto;
  String? photo;
  bool? verificationFlag;
  String? village;
  String? district;
  String? city;
  String? province;

  static String? _userID;
  static String? _password;
  static String? _name;
  static String? _email;
  static String? _address;
  static String? _phoneNumber;
  static String? _ktpNumber;
  static String? _ktpPhoto;
  static String? _photo;
  static bool? _verificationFlag;
  static String? _village;
  static String? _district;
  static String? _city;
  static String? _province;

  static final User instance = User._internal();

  factory User(Map<String, dynamic> jsonData) {
    _userID = jsonData['UserID'];
    _password = jsonData['Password'];
    _name = jsonData['Nama'];
    _email = jsonData['Email'];
    _address = jsonData['Alamat'];
    _phoneNumber = jsonData['No_HP'];
    _ktpNumber = jsonData['No_KTP'];
    _ktpPhoto = jsonData['Foto_KTP'];
    _photo = jsonData['Foto'];
    _verificationFlag = jsonData['Flag_Verifikasi'];
    _village = jsonData['Kode_kelurahan'];
    _district = jsonData['Kode_Kecamatan'];
    _city = jsonData['Kode_Kota_Kabupaten'];
    _province = jsonData['Kode_Provinsi'];
    
    return instance;
  }

  User._internal(){
    this.userID = _userID;
    this.password = password;
    this.email = _email;
    this.address = _address;
    this.phoneNumber = _phoneNumber;
    this.ktpNumber = _ktpNumber;
    this.ktpPhoto = _ktpPhoto;
    this.photo = _photo;
    this.verificationFlag = _verificationFlag;
    this.village = _village;
    this.district = _district;
    this.city = _city;
    this.province = _province;
  }
}