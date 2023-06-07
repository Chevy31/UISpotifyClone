class model {
  model({
    required this.judul,
    required this.artis,
    required this.id,
  });

  String judul;
  String artis;
  String id;

  factory model.fromJson(Map<String, dynamic> json){
    return model(
      judul: json["judul"],
      artis: json["artis"],
      id: json["id"],
    );
  }
}