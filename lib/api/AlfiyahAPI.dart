
import 'package:dio/dio.dart';

class AlfiyahAPI {
  static String BASE_URL = "http://alfiyahgroup.mataramsoftware-id.com/";

  static String getLogin(String user, String password) {
    return  "api/login" + "/" + user + "/" + password;
  }

  static String getAllJob(String id_user) {
    return  "api/job/" + id_user;
  }

  static String getJobByStatus(String id_user, String status) {
    return  "api/status/" + id_user + "/" + status;
  }

  static String getJobDetail(String id_job, String id_user) {
    return  "api/detail_job/" + id_job + "/" + id_user;
  }

  static String getStepOperasi(String id_job, String id_user, String id_level) {
    return
      "api/step_operasi/" +
        id_user +
        "/" +
        id_job +
        "/" +
        id_level;
  }

  static String getCariJob(String id_user, String kata) {
    return  "api/cari_job/" + id_user + "/" + kata;
  }

  static String getUploadURL(String id_job, String id_step) {
    return  "api/simpan_histori/" + id_job + "/" + id_step;
  }

  static String getUpdateURL(String id_job, String id_step) {
    return  "api/update_histori/" + id_job + "/" + id_step;
  }

  static String getUbahPasswordURL(String id_user) {
    return  "api/ubah_password/" + id_user;
  }

  static String getHistory(String id_job, String id_step_operasi) {
    return  "api/histori/" + id_job + "/" + id_step_operasi;
  }

  static String getHistoryAll(String id_job, String id_petugas) {
    return  "api/histori_all/" + id_job + "/" + id_petugas;
  }

  static String getPetugas(String id_job) {
    return  "api/petugas/" + id_job;
  }

  static BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
      });
  static Dio dio = Dio(options);

}
