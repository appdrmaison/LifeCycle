import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifecyclemed/Home.dart';
import 'model/Usuarios.dart';


class CadastroGeral extends StatefulWidget {
  @override
  _CadastroGeralState createState() => _CadastroGeralState();
}

class _CadastroGeralState extends State<CadastroGeral> {

  //controladores
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSobreNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPw = TextEditingController();
  TextEditingController _controllerNumCel = TextEditingController();
  TextEditingController _controllerCPF = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerEnd = TextEditingController();
  TextEditingController _controllerNasc = TextEditingController();
  String _mensagemErro = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
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
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Nome* ",
                                hintText: "Ex: Maria Lidia",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.contains("@"))
                                  return "Caracters como !@#&*()? não são permitidos";
                                if (value.length < 2)
                                  return "O Campo deverá conter Nome ";

                                return null;
                              },

                            ),
                            TextFormField(

                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Sobrenome* ",
                                hintText: "Ex: da Silva",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 5)
                                  return "O Campo deverá conter o seu Sobrenome";
                                return null;
                              },

                            ),

                            TextFormField(

                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "CPF* ",
                                hintText: "Ex: 30903930220",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 11)
                                  return "O Campo deverá conter o seu CPF";
                                return null;
                              },

                            ),
                            TextFormField(

                              keyboardType: TextInputType.datetime,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Data de nascimento ",
                                hintText: "Ex: 20/02/1983",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 5)
                                  return "O Campo deverá conter a data do seu aniversário";
                                return null;
                              },

                            ),

                            TextFormField(

                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "E-mail ",
                                hintText: "Ex: maria.lidia@gmail.com",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 5)
                                  return "O Campo deverá conter e-mail";
                                return null;
                              },

                            ),
                            TextFormField(

                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Número de Celular",
                                hintText: "Ex:(11)989898999 ",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 5)
                                  return "O Campo deverá conter número de celular";
                                return null;
                              },

                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Endereço",
                                hintText: "Rua Majorica,219",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo está vazio";
                                if (value.length < 5)
                                  return "O Campo deverá conter o seu endereço";
                                return null;
                              },

                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Estado",
                                hintText: "Sao Paulo",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 5)
                                  return "O Campo deverá conter o seu estado";
                                return null;
                              },

                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "UF",
                                hintText: "SP",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 2)
                                  return "O Campo deverá conter o UF do estado";
                                return null;
                              },

                            ),
                            TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Crie uma Senha",
                                hintText: "",
                                labelStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 19),

                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 9)
                                  return "O Campo deverá conter uma senha";
                                return null;
                              },


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
                              validator: (value) {
                                if (value.isEmpty)
                                  return "O Campo é obrigatório";
                                if (value.length < 9)
                                  return "O Campo deverá conter uma senha";
                                return null;
                              },


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


  validarCampos() {
    //recuperar dados dos campos

    String nome = _controllerNome.text;
    String sobrenome = _controllerSobreNome.text;
    String email = _controllerEmail.text;
    String pw = _controllerPw.text;
    String numcel = _controllerNumCel.text;
    String numCPF = _controllerCPF.text;
    String city = _controllerCity.text;
    String endereco = _controllerEnd.text;
    String dataNascimento = _controllerNasc.text;

    setState(() {
      _mensagemErro = "";
    });

    Usuarios usuarios = Usuarios();
    usuarios.nome = nome;
    usuarios.email = email;
    usuarios.pw = pw;

    CadastrarUsuarioBD(usuarios);
  }

  CadastrarUsuarioBD(Usuarios usuarios) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
        email: usuarios.email,
        password: usuarios.pw
    ).then((firebaseUser) {

    }).catchError((error) {
      print("erro app: " + error.toString());
      setState(() {
        _mensagemErro =
        "Erro ao cadastrar usuário, verifique os campos e tente novamente!";
      });
    });
  }

  final _formKey = GlobalKey<FormState>();

}
