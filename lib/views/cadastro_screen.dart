
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mementoapp/main.dart';
import 'package:mementoapp/views/components/button_custom.dart';
import 'package:mementoapp/views/components/text_field_custom.dart';
import 'package:validadores/Validador.dart';

class CadastroUsuarioScreen extends StatefulWidget {
  const CadastroUsuarioScreen({Key? key}) : super(key: key);

  @override
  _CadastroUsuarioScreenState createState() => _CadastroUsuarioScreenState();
}

class _CadastroUsuarioScreenState extends State<CadastroUsuarioScreen>
    with TickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyAppColorScheme().background,
      appBar: AppBar(
        backgroundColor: MyAppColorScheme().primary,
        title: Text(
          'Cadastro',
          style: Theme.of(context).textTheme.headlineMedium!.apply(
            fontFamily: 'Readex Pro',
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyAppColorScheme().primary,
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
                                  autofillHints: const [AutofillHints.email],
                                  validator: (valor) => Validador()
                                      .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                                      .add(Validar.EMAIL, msg: "Email inválido")
                                      .valido(valor)
                              ),
                              TextFieldWidget(
                                  texto: "Usuario",
                                  autofillHints: const [AutofillHints.username],
                                  validator: (valor) => Validador()
                                      .add(Validar.OBRIGATORIO, msg:  "Campo Obrigatório")
                                      .valido(valor)
                              ),
                              TextFieldWidget(
                                  texto: "Senha",
                                  obscure: true,
                                  autofillHints: const [AutofillHints.password],
                                  validator: (valor) => Validador()
                                      .add(Validar.OBRIGATORIO, msg:  "Campo Obrigatório")
                                      .valido(valor)
                              ),
                              TextFieldWidget(
                                  texto: "Confirmar Senha",
                                  obscure: true,
                                  autofillHints: const [AutofillHints.password],
                                  validator: (valor) => Validador()
                                      .add(Validar.OBRIGATORIO, msg:  "Campo Obrigatório")
                                      .valido(valor)
                              ),
                              ElevateButtonWidget(
                                  texto: "Cadastrar",
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
