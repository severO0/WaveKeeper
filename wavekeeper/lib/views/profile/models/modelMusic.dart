class ModelMusic {
  late String id;
  late String nome;
  late String nomeArtistico;
  late DateTime dataNegociacao;
  late String nome2;
  
  late String? urlCapa;

  ModelMusic ({
    required this.id,
    required this.nome,
    required this.nomeArtistico,
    required this.dataNegociacao,
    required this.nome2,
  });

ModelMusic.fromMap(Map<String, dynamic>map) 
  : id = map["id"], 
  nome = map["nome"], 
  nomeArtistico = map["nomeArtistico"],
  dataNegociacao = map["dataNegociacao"],
  nome2 = map["nome2"],
  urlCapa = map["urlMapa"];

Map<String, dynamic> toMap() {
  return{
    "id": id,
    "nome": nome,
    "nomeArtistico": nomeArtistico,
    "dataNegociacao": dataNegociacao,
    "nome2": nome2,
    "urlCapa": urlCapa
  };
}
}