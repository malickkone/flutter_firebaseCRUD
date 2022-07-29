class User {
  String id;
  String name;
  int age;
  
  User({this.id='', required this.name, required this.age});

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'age' : age
    };
  }

  factory User.fromJson(Map<String, dynamic> json){
    return (User(id:json['id'], name:json['name'], age: json['age']));
  }
}