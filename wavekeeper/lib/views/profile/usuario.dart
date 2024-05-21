class Usuario {
  int? id;
  String nome;
  String nomeArtistico;
  String email;
  String senha;

  Usuario({
    this.id,
    required this.nome,
    required this.nomeArtistico,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'nomeArtistico': nomeArtistico,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      nomeArtistico: map['nomeArtistico'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}
