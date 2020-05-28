import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CadastroPaciente extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();

  //controladores
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPw = TextEditingController();
  TextEditingController _controllerNumCel = TextEditingController();
  TextEditingController _controllerCPF = TextEditingController();
  TextEditingController _controllerCountry = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerEnd= TextEditingController();

  validarCampos(){

     //recuperar dados dos campos

    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerPw.text;
    String numCelular = _controllerNumCel.text;
    String numCPF = _controllerCPF.text;
    String countrypais = _controllerCountry.text;
    String cidade = _controllerCity.text;
    String endereco = _controllerEnd.text;

  }


}

class _CadastroState extends State<CadastroPaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),

      ),
      body:Container(
        decoration: BoxDecoration(color: Color(0xff380A17)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("imagens/logoPaciente.png",
                    width: 140,
                    height: 120,
                  ),
                ),
                Padding( //Nome Completo

                  padding: EdgeInsets.only(bottom: 8),

                  child: TextField (


                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 17),

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                          labelText:"Nome Completo:",
                          labelStyle: TextStyle(color: Colors.indigo),
                          hintText: "Ex: Maria Lidia da Silva",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      )
                  ),
                ),

                Padding(   //E-Mail

                  padding: EdgeInsets.only(bottom: 8),

                  child: TextField(

                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 17),

                      decoration: InputDecoration(

                          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                          labelText:"Nome Completo:",
                          labelStyle: TextStyle(color: Colors.indigo),
                          hintText: "Digite_seu_email@dominio.com",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      )
                  ),

                ),



                Padding( //Senha

                  padding: EdgeInsets.only(bottom: 8),


                  child: TextField(

                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                          labelText:"Senha:",
                          labelStyle: TextStyle(color: Colors.indigo),
                          hintText: "Digite uma Senha",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      )
                  ),
                ),

                Padding( //Numero de Celular

                  padding: EdgeInsets.only(bottom: 8),


                  child: TextField(

                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                          labelText:"Número Celular:",
                          labelStyle: TextStyle(color: Colors.indigo),
                          hintText: "Ex: 11999933282",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      )
                  ),
                ),

                Padding( //CPF

                  padding: EdgeInsets.only(bottom: 8),


                  child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                          labelText:"Número do seu CPF:",
                          labelStyle: TextStyle(color: Colors.indigo),
                          hintText: "ex: 33032031020",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      )
                  ),
                ),
                Padding( //Estado

                  padding: EdgeInsets.only(bottom: 8),


                  child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                          labelText:"Cidade-UF:",
                          labelStyle: TextStyle(color: Colors.indigo),
                          hintText: "Ex: São Paulo-SP",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      )
                  ),
                ),

                //botão enviar

                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text("Salvar Cadastro",
                        style: TextStyle(color: Colors.white, fontSize:20),
                      ),
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      ),
                      onPressed: (){


                      }
                  ),

                ),


              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
