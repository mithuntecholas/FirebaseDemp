class Employee
{
  Employee(this._name,this._age,this._adress);
  String? _name;
  String? get name => _name;
  int? _age;
  String? _adress;
  int? get age => _age;
  String? get adress => _adress;

  Employee.frommapto(json){
    this._name=json['name'];
    this._age=json['age'];
    this._adress=json['adress'];
  }


}
