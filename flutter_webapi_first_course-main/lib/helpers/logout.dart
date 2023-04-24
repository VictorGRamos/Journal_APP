import 'package:flutter/material.dart';

import '../services/auth_service.dart';

logout(BuildContext context) {
    AuthService auth = AuthService();
    auth.deleteUserInfos();
    Navigator.pushReplacementNamed(context, "login");
  }