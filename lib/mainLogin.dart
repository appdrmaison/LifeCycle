import 'package:flutter/material.dart';
import 'package:lifecyclemed/CadastroPaciente.dart';
import 'package:lifecyclemed/cadastropaciente3.dart';




class mainLogin extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<mainLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (body: Container(
      decoration: BoxDecoration(color: Color(0xff380A17)),
        padding: EdgeInsets.all(16),
         child: Center(
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("imagens/logobordolifecyclemed.PNG",
                    width: 230,
                    height: 150,
                  ),
                ),
                 Padding(

                   padding: EdgeInsets.only(bottom: 8),

                     //Campo de Email
                     child: TextField(
                                      autofocus: true,
                                         keyboardType: TextInputType.emailAddress,
                                           style: TextStyle(fontSize: 20),
                                              decoration: InputDecoration(
                                                 contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                                    hintText: "E-mail",
                                                      filled: true,
                                                         fillColor: Colors.white,
                                                            border: OutlineInputBorder(
                                                               borderRadius: BorderRadius.circular(32)
                                                            )
                                              )
                     ),
                 ),

                 //Campo de Senha
                 TextField(
                     keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20),
                             decoration: InputDecoration(
                               contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                  hintText: "Senha",
                                    filled: true,
                                      fillColor: Colors.white,
                                         border: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(32)
                         )
                     )
                 ),
                 //botão enviar

                 Padding(
                   padding: EdgeInsets.only(top: 16, bottom: 10),
                   child: RaisedButton(
                     child: Text("Entrar",
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

                 Padding(
                   padding: EdgeInsets.only(top: 16, bottom: 10),
                   child: RaisedButton(
                       child: Text("Cadastre-se",
                         style: TextStyle(color: Colors.white, fontSize:20),
                       ),
                       color: Colors.indigoAccent,
                       padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(32)
                       ),
                       onPressed: (){

                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => CadastroGeral()
                               )
                           );

                       }
                   ),

                 ),
                 Center(
                   child: GestureDetector(
                     child: Text(
                       "Esqueceu a Senha? Clique aqui!",
                       style: TextStyle(
                            color: Colors.white
                       ),
                     ),
                     onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroPaciente()
                           )
                        );
                     },
                   ),
                 ),


               ],
            ),
          ),
        ),
    )
    );
  }
}
