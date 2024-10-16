class Feedbacks{
  late int id ;
  var details;
  var  response;

  Feedbacks({
    required this.id,
    this.details,
    this.response,

});

  factory Feedbacks.fromJson(Map<String, dynamic> json) {
    return Feedbacks(
      details: json['details'] ?? '',
      response: json['response'] ?? '',
      id: json['id'] ?? '',
    );
  }


}