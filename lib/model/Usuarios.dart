

class Usuarios {
  String _nome;
  String _SobreNome;
  String _email;
  String _pw;
  String _pwConfirm;
  String _numcel;
  String _numCPF;
  String _city;
  String _endereco;
  String _dataNacimento;
  String _estado;

  Usuarios();

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
  }

  String get dataNacimento => _dataNacimento;

  set dataNacimento(String value) {
    _dataNacimento = value;
  }

  String get endereco => _endereco;

  set endereco(String value) {
    _endereco = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get numCPF => _numCPF;

  set numCPF(String value) {
    _numCPF = value;
  }

  String get numcel => _numcel;

  set numcel(String value) {
    _numcel = value;
  }

  String get pw => _pw;

  set pw(String value) {
    _pw = value;
  }

  String get pwConfirm => _pwConfirm;

  set pwConfirm(String value) {
    _pwConfirm = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get SobreNome => _SobreNome;

  set SobreNome(String value) {
    _SobreNome = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}
