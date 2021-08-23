class Queue {
  int? queueID;
  String? date;
  String? time;
  String? tenantID;
  String? userID;
  int? queueNumber;
  String? startTime;
  String? endTime;

  Queue({
    this.queueID,
    this.date,
    this.time,
    this.tenantID,
    this.userID,
    this.queueNumber,
    this.startTime,
    this.endTime
  });

  factory Queue.fromJson(Map<String, dynamic> jsonData){
    return Queue(
      queueID: jsonData['ID_Antrian'],
      date: jsonData['Tanggal'],
      time: jsonData['Jam_Antrian'],
      tenantID: jsonData['ID_Tenant'],
      userID: jsonData['UserID'],
      queueNumber: jsonData['No_Antrian'],
      startTime: jsonData['Jam_Layanan_Mulai'],
      endTime: jsonData['Jam_Layanan_Selesai']
    );
  }
}