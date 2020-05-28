import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifecyclemed/Home.dart';
import 'model/Usuarios.dart';
import 'package:cpfcnpj/cpfcnpj.dart';




class CadastroGeral extends StatefulWidget {
  @override
  _CadastroGeralState createState() => _CadastroGeralState();
}

class _CadastroGeralState extends State<CadastroGeral> {

  //controladores
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerSobreNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();
  final TextEditingController _controllerPwConfirm= TextEditingController();
  final TextEditingController _controllerNumCel = TextEditingController();
  final TextEditingController _controllerCPF = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerEnd = TextEditingController();
  final TextEditingController _controllerNasc = TextEditingController();
  final TextEditingController _controllerUF = TextEditingController();
  String _mensagemErro = "";

//Metodo para validar caracteres especiais em nome
  String _validarCampoNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Digite o seu primeiro nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deverá conter apenas letras";
    }
    return null;
  }
  //Metodo para validar caracteres especiais em sobrenome
  String _validarCampoSobreNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Digite o seu primeiro nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deverá conter apenas letras";
    }
    return null;
  }

  //Validar celular teste
  String _validarCampoCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length != 11){
      return "Deverá 11 Digitos incluindo ddd Ex:11999999999";
    }else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;

  }


//validar email
  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
        r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

//Validar CPF
  String _validarCPF(String value) {

    // Validar CPF
    if (CPF.isValid(value)) {
      return("CPF Verificado");
    } else {
      return("Este CPF é inválido.");

    }

  }

  validarCampos() {
    //recuperar dados dos campos

    String nome = _controllerNome.text;
    String sobrenome = _controllerSobreNome.text;
    String email = _controllerEmail.text;
    String pw = _controllerPw.text;
    String pwConfirm = _controllerPwConfirm.text;
    String numcel = _controllerNumCel.text;
    String numCPF = _controllerCPF.text;
    String city = _controllerCity.text;
    String endereco = _controllerEnd.text;
    String dataNascimento = _controllerNasc.text;
    String estado = _controllerUF.text;



    setState(() {
      _mensagemErro = "";
    });

    Usuarios usuarios = Usuarios();
    usuarios.nome = nome;
    usuarios.email = email;
    usuarios.pw = pw;
    usuarios.pwConfirm = pwConfirm;
    usuarios.SobreNome = sobrenome;
    usuarios.numcel = numcel;
    usuarios.numCPF = numCPF;
    usuarios.city = city;
    usuarios.endereco = endereco;
    usuarios.dataNacimento = dataNascimento;
    usuarios.estado = estado;


    CadastrarUsuarioBD(usuarios);
  }

  CadastrarUsuarioBD(Usuarios usuarios) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
        email: usuarios.email,
        password: usuarios.pw,
    ).then((firebaseUser){

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );

    }).catchError((error){
      print("erro app: " + error.toString() );
      setState(() {
        _mensagemErro = "Erro ao cadastrar usuário, verifique os campos e tente novamente!";
      });

    });

  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Paciente"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xffffffff)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _controllerNome,
                              maxLength: 15,
                              validator: _validarCampoNome,
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                              color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                              labelText: "Nome",
                              hintText: "Ex: Maria Lidia",

                              labelStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 19),

                            ),

                            ),
                            TextFormField(
                              controller: _controllerSobreNome,
                              maxLength: 35,
                              validator: _validarCampoSobreNome,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Sobrenome",
                                hintText: "Ex: da Silva",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                            ),

                            ),

                            TextFormField(

                              controller: _controllerCPF,
                              //maxLength: 11,
                              keyboardType: TextInputType.number,
                              validator: _validarCPF,
                              style: TextStyle(
                              color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                              labelText: "CPF",
                              hintText: "Ex: 30903930220",
                              labelStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 19),
                              ),

                            ),
                            TextFormField(
                              controller: _controllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              validator: _validarEmail,
                              style: TextStyle(
                               color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "E-mail ",
                                hintText: "Ex: seuemail@dominio.com",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),


                              )),


                            TextFormField(
                              controller: _controllerNumCel,
                                maxLength: 11,
                              keyboardType: TextInputType.phone,
                              validator: _validarCampoCelular,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Número de Celular",
                                hintText: "Ex: 11989898999 ",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              )),

                            TextFormField(
                              controller: _controllerCity,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Cidade",
                                hintText: "Sao Paulo",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),
                              )),
                            TextFormField(
                              controller: _controllerUF,
                                maxLength: 2,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "UF",
                                hintText: "EX: SP",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),


                              )),

                            TextFormField(
                              controller: _controllerPw,

                              obscureText: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Crie uma Senha",
                                hintText: "",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),


                              )



                            ),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Colors.indigo, fontSize: 20),
                            decoration: InputDecoration(
                              labelText: "Confirme a Senha",
                              hintText: "",
                              labelStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 19),

                            ),


                          ),

                            Padding(

                              padding: EdgeInsets.only(top: 16, bottom: 10),
                              child: RaisedButton(
                                  child: Text("Salvar Cadastro",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  color: Colors.indigoAccent,
                                  padding: EdgeInsets.fromLTRB(
                                      20, 10, 20, 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)
                                  ),
                                  onPressed: () {
                                    validarCampos();

                                    if (_formKey.currentState.validate()) {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Enviando dados..."),
                                            duration: Duration(seconds: 3),
                                          ));
                                    }
                                  }
                              ),

                            ),

                          ],
                        ),
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }




}
