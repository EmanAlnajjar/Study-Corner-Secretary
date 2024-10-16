class AllHall{
  var id;
  var name;
  var seats_number;
  var has_meeting_table;
  var has_board;
  var price_hour_hall;


  AllHall({
   this.name,
    this.id,
    this.has_board,
    this.has_meeting_table,
    this.price_hour_hall,
    this.seats_number,


});
  factory AllHall.fromJson(Map<String, dynamic> json) {
    return AllHall(
      name: json['name'] ?? '',
      seats_number: json['seats_number'] ?? '',
      id: json['id'] ?? '',
      has_board: json['has_board'] ?? '',
      has_meeting_table: json['has_meeting_table'] ?? '',
      price_hour_hall: json['price_hour_hall'] ?? '',


    );
  }
}