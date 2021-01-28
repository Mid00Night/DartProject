import 'dart:io';

int id;
String location;
int passengerlimit;
String date;
double price;
List<Trips> myList = List<Trips>();
main(List<String> args) {
  int input;
  while (true) {
    print('If you want to:');
    print('\n');
    stdout.write('Add trip press 1 ' + '           ');
    stdout.write('Edit trip press 2');
    print('\n');
    stdout.write('Delete trip press 3 ' + '        ');
    stdout.write('Search for a trip by price press 4');
    print('\n');
    stdout.write('View trips press 5 ' + '         ');
    stdout.write('Reserve a trip press 6 ' + '     ');
    print('\n');
    stdout.write('view passengers press 7' + '     ');
    stdout.write('Exit press 8');
    print('\n');
    input = int.parse(stdin.readLineSync());
    TravelAgency ta = TravelAgency();
    if (input == 1) {
      print('Enter ID : ');
      id = int.parse(stdin.readLineSync());
      print('Enter Location : ');
      location = stdin.readLineSync();
      print('Enter Passenger Limit : ');
      passengerlimit = int.parse(stdin.readLineSync());
      print('Enter Date : ');
      date = stdin.readLineSync();
      print('Enter Price \$ : ');
      price = double.parse(stdin.readLineSync());

      ta.AddTrip(id, location, passengerlimit, price, date);
    } else if (input == 2) {
      print('If you want to edit : ' +
          '\n' +
          'ID press 1' +
          '\n' +
          'Location press 2' +
          '\n' +
          'Passenger limit press 3' +
          '\n' +
          'Date press 4' +
          '\n' +
          'Price press 5');
      int input1 = int.parse(stdin.readLineSync());
      if (input1 == 1) {
        print('Enter the new ID');
        int input1 = int.parse(stdin.readLineSync());
        ta.EditTrip(id, location, passengerlimit, price, date);
      } else if (input1 == 2) {
        print('Enter the new Location');
        String location = stdin.readLineSync();
        ta.EditTrip(id, location, passengerlimit, price, date);
      } else if (input1 == 3) {
        print('Enter the new Passenger Limit');
        int passengerlimit = int.parse(stdin.readLineSync());
        ta.EditTrip(id, location, passengerlimit, price, date);
      } else if (input1 == 4) {
        print('Enter the new Date');
        String date = stdin.readLineSync();
        ta.EditTrip(id, location, passengerlimit, price, date);
      } else {
        print('Enter the new Price');
        double price = double.parse(stdin.readLineSync());
        ta.EditTrip(id, location, passengerlimit, price, date);
      }
    } else if (input == 3) {
      print('Enter ID');
      int id1 = int.parse(stdin.readLineSync());
      ta.DeleteTrip(id1);
    } else if (input == 4) {
      print('Enter the price');
      double p = double.parse(stdin.readLineSync());
    } else if (input == 5) {
      ta.ViewTrips();
    } else if (input == 6) {
    } else if (input == 7) {
    } else if (input == 8) {
      exit(0);
    }
    print('Do you want to continue ?  y/n');
    String c = stdin.readLineSync();
    if(c == 'n')
    {
      exit(0);
    }
    else{
      continue;
    }
  }
}

class TravelAgency {
  int ID;
  String Location;
  int PassengerLimit;
  String Date;
  double Price;



  AddTrip(
      int ID, String Location, int PassengerLimit, double Price, String Date) {
    Trips t1 = Trips();
    t1.ID = ID;
    t1.Location = Location;
    t1.PassengerLimit = PassengerLimit;
    t1.Price = Price;
    t1.Date = Date;

    myList.add(t1);
  }

  EditTrip(
      int ID, String Location, int PassengerLimit, double Price, String Date) {
    Trips t1 = Trips();
    t1.ID = ID;
    t1.Location = Location;
    t1.PassengerLimit = PassengerLimit;
    t1.Price = Price;
    t1.Date = Date;
    myList.add(t1);
  }

  DeleteTrip(int ID) {
    for (int i = 0; i <= myList.length; i++) {
      if (ID == myList[i].ID) {
        myList.removeAt(i);
      }
    }
  }

  ViewTrips() {
    print('ID' +
        '       ' +
        'Location' +
        '       ' +
        'PassengerLimit' +
        '       ' +
        'Price' +
        '       ' +
        'Date');
    for (int i = 0; i < myList.length; i++) {
      print('${myList[i].ID}' +
          '    ' +
          '${myList[i].Location}' +
          '    ' +
          '${myList[i].PassengerLimit}' +
          '    ' +
          '${myList[i].Price}' +
          '    ' +
          '${myList[i].Date}');
    }
  }

  SearchTrip(double Price) {
    for (int i = 0; i < myList.length; i++) {
      if (Price == myList[i].Price) {
        myList[i].print();
      }
    }
  }

  Reverse(int ID) {}
}

class Trips {
  int _ID;

  int get ID => _ID;

  set ID(int value) {
    _ID = value;
  }

  String _Location;
  int _PassengerLimit;
  String _Date;
  double _Price;
  List<Passengers> p = List<Passengers>();

  String get Location => _Location;

  set Location(String value) {
    _Location = value;
  }

  int get PassengerLimit => _PassengerLimit;

  set PassengerLimit(int value) {
    _PassengerLimit = value;
  }

  String get Date => _Date;

  set Date(String value) {
    _Date = value;
  }

  double get Price => _Price;

  set Price(double value) {
    _Price = value;
  }
  void print([String s]){
    print('${this.ID} + ${this.Location} + ${this.PassengerLimit} + ${this.Date} + ${this.Price}');
  }

}
class Passengers {
  String name;
  int PhoneNumber;
  String Address;

  setPassenger(String name , int PhoneNumber ,String Address )
  {
    this.name = name;
    this.PhoneNumber = PhoneNumber;
    this.Address = Address;
  }
}