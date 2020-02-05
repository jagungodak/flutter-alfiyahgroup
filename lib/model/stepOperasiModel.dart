class StepOperasiModel {
 
  final String status, ket, tugas, type, ket_step_operasi,id_petugas, id_level_tugas, id_job, id_user;

  StepOperasiModel(
      {this.id_petugas,
      this.id_level_tugas,
      this.id_job,
      this.id_user,
      this.status,
      this.ket,
      this.ket_step_operasi,
      this.tugas,
      this.type});

  factory StepOperasiModel.fromJson(Map<String, dynamic> parsedJson) {
    Map<String, dynamic> json = parsedJson['step_operasi'];
    return StepOperasiModel(
      id_petugas: json['id_petugas'],
      id_level_tugas: json['id_level_tugas'].toString(),
      id_job: json['id_job'].toString(),
      id_user : json['id_user'].toString(),
      status: json['status'],
      ket: json['ket'],
      ket_step_operasi: json['ket_step_operasi'],
      tugas : json['tugas'],
      type: json['type'],
      
    );
  }
}
