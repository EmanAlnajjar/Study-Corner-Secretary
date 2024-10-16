class CourseModel{
  var name;
  var category;
  var price;
  var teacher_name;
  var hours;
  var slideUrl;
  var start_date;
  var end_date;
  var start_hour;
  var end_hour;

  var monday;
  var tuesday;
  var wednesday;
  var thursday;
  var friday;
  var saturday;
  var sunday;
   var id;

  CourseModel({
     this.name,
     this.category,
    this.price,
    this.teacher_name,
    this.hours,
    this.slideUrl,
    this.start_date,
    this.end_date,
    this.start_hour,
    this.end_hour,

     this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
     this.id,

  });


  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? '',
      teacher_name: json['teacher_name'] ?? '',
      hours: json['hours'] ?? '',
      slideUrl: json['slideUrl'] ?? '',
      start_date: json['start_date'] ?? '',
      end_date: json['end_date'] ?? '',
      start_hour: json['start_hour'] ?? '',
      end_hour: json['end_hour'] ?? '',

      monday: json['monday'] ?? '',
      tuesday: json['tuesday'] ?? '',
      wednesday: json['wednesday'] ?? '',
      thursday: json['thursday'] ?? '',
      friday: json['friday'] ?? '',
      saturday: json['saturday'] ?? '',
      sunday: json['sunday'] ?? '',
       id: json['id'] ?? '',


    );
  }
}