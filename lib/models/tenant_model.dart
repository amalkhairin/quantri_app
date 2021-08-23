class Tenant {
  int? tenantID;
  String? tenantName;
  String? address;
  double? latitude;
  double? longitude;
  String? photo;
  String? description;
  String? village;
  String? district;
  String? city;
  String? province;
  String? operationalDay;
  String? operationalTime;

  Tenant({
    this.tenantID,
    this.tenantName,
    this.address,
    this.latitude,
    this.longitude,
    this.photo,
    this.description,
    this.village,
    this.district,
    this.city,
    this.province,
    this.operationalDay,
    this.operationalTime
  });

  factory Tenant.fromJson(Map<String, dynamic> jsonData){
    return Tenant(
      tenantID: jsonData['ID_Tenant'],
      tenantName: jsonData['Nama_Tenant'],
      address: jsonData['Alamat'],
      latitude: jsonData['Latitude'],
      longitude: jsonData['Longitude'],
      photo: jsonData['Foto'],
      description: jsonData['Deskripsi'],
      village: jsonData['Kode_Kelurahan'],
      district: jsonData['Kode_Kecamatan'],
      city: jsonData['Kode_Kota_Kabupaten'],
      province: jsonData['Kode_Provinsi'],
      operationalDay: jsonData['Hari_Layanan'],
      operationalTime: jsonData['Jam_Layanan'],
    );
  }
}