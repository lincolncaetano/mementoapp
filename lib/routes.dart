import 'package:flutter/material.dart';
import 'package:mementoapp/views/cadastro_screen.dart';
import 'package:mementoapp/views/login_screen.dart';

class AppRoutes {

  static const String login = '/login';
  static const String cadastro = '/cadastro';
  static const String home = '/home';
  static const String recuperarSenha = '/recuperarSenha';

  static Map<String, WidgetBuilder> routes = {
    '/': (context) => LoginScreen(),
    /*'/login': (context) => LoginScreen(),*/
   /* '/home': (context) => HomeScreen(),*/
    '/cadastro': (context) => CadastroUsuarioScreen(),
    /*'/recuperaSenha': (context) => RecuperaSenhaScreen()*/
  };
}
