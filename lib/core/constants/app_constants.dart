// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class AppConstant{
  static String? USER_TOKEN;
  static String? USER_EMAIL;
  static String? USER_ID;
  static String? TOKEN_EXPIRE;
  static String? REFRESH_TOKEN;


  static void clearData() {
    TOKEN_EXPIRE = null;
    USER_ID = null;
    USER_EMAIL = null;
    USER_TOKEN = null;

  }
  
}