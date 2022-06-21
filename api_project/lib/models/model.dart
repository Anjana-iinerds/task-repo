class Users{
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final Company company;

  Users({required this.id, required this.name, required this.username, required this.email, required this.address, required this.phone, required this.company});
  factory Users.fromJson(Map<String, dynamic> json){
    return  Users(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      company:Company.fromJson(json['company'])
    );
  }
}
class Address{
  final String street;
  final String suite;
  final String city;

  Address({required this.street, required this.suite, required this.city});
  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city']
    );
  }
}
class Company{
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});
  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs']
    );
  }
}