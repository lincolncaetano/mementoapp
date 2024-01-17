import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mementoapp/main.dart';
import 'package:mementoapp/routes.dart';
import 'package:mementoapp/views/components/button_custom.dart';
import 'package:mementoapp/views/components/text_field_custom.dart';
import 'package:validadores/Validador.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailAddressController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              MyAppColorScheme.tertiaryColor
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'M',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 120,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 570,
                ),
                decoration: BoxDecoration(
                  color: MyAppColorScheme.backgroundSecondary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFieldWidget(
                                texto: "Email",
                                controller: _emailAddressController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (valor) => Validador()
                                    .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                                    .add(Validar.EMAIL, msg: "E-mail invalido")
                                    .valido(valor),
                              ),

                              TextFieldWidget(
                                texto: "Password",
                                controller: _emailAddressController,
                                obscure: true,
                                validator: (valor) => Validador()
                                    .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                                    .valido(valor),
                              ),

                              ElevateButtonWidget(
                                  texto: "Login",
                                  onPress: (){
                                    if(_formKey.currentState!.validate()){
                                      _formKey.currentState!.save();
                                      /*         Usuario u = Usuario();
                              u.email = _email;
                              u.senha = _senha;

                              _loginUsuario(u);*/

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Processing Data')),
                                      );

                                    }
                                  }
                              )
                            ],
                          ),
                        ),

                        // You will have to add an action on this rich text to go to your login page.
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, AppRoutes.cadastro),
                            child: RichText(
                              textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: const [
                                  TextSpan(
                                    text: 'Ainda não tem conta? ',
                                    style: TextStyle( color: Colors.white, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: 'Cadastre aqui',
                                    style: TextStyle( color: MyAppColorScheme.primaryColor , fontSize: 16),
                                  )
                                ],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class CadastrarModel {
  late TextEditingController emailAddressController;

}


