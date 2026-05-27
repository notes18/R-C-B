// Copy From Here

List<int?> bills = [5000, null, -1200, 3000, 7000, null, 2500];
List<String> departments = ["Cardiology", "Neurology", "Orthopedic"];

class Patient {

  static String hospitalName = "City Hospital";

  String name;
  int patientId;

  double _healthScore;

  String? city;

  Patient(this.name, this.patientId, this._healthScore, this.city);

  // Getter
  double get healthScore => _healthScore;

  // Setter
  set healthScore(double value) {

    if(value >= 0 && value <= 10){
      _healthScore = value;
    }

  }

}

class VIPPatient extends Patient {

  double insuranceAmount;

  VIPPatient(
    String name,
    int patientId,
    double healthScore,
    String? city,
    this.insuranceAmount,

  ) : super(name, patientId, healthScore, city);

}

abstract class MedicalReport {

  String reportStatus();

}

class DoctorReport extends MedicalReport {

  @override
  String reportStatus() {
    return "Report Generated";
  }

}

mixin Emergency {

  String emergencyService() {
    return "Emergency Service Active";
  }

}

mixin Ambulance {

  String ambulanceService() {
    return "Ambulance Ready";
  }

}

class Hospital with Emergency, Ambulance {}

Patient p1 = Patient("Harsh", 201, 8.5, null);


// Q1 Return hospital name using static variable
String hospitalNameDemo() {

  return Patient.hospitalName;

}


// Q2 Return patient city
String patientCity(Patient p) {

  return p.city ?? "City Not Available";

}


// Q3 Use getter method to return healthScore
double getterDemo(Patient p) {

  return p.healthScore;

}


// Q4 Use setter method to update healthScore to 9.2
double setterDemo(Patient p) {

  p.healthScore = 9.2;

  return p.healthScore;

}


// Q5 Return all valid bills
List<int> validBills(List<int?> arr) {

  return arr
      .where((bill) => bill != null)
      .map((bill) => bill! < 0 ? -bill : bill)
      .toList();

}


// Q6 Return total bill amount
int totalBills(List<int?> arr) {

  return arr
      .where((bill) => bill != null)
      .map((bill) => bill! < 0 ? -bill : bill)
      .reduce((a,b) => a + b);

}


// Q7 Create VIPPatient object
double insuranceDetails() {

  VIPPatient vip = VIPPatient(
    "Rahul",
    301,
    9.5,
    "Delhi",
    100000
  );

  return vip.insuranceAmount;

}


// Q8 Use abstract class implementation
String reportDemo() {

  DoctorReport report = DoctorReport();

  return report.reportStatus();

}


// Q9 Use multiple mixins
String hospitalServices() {

  Hospital h = Hospital();

  return "${h.emergencyService()} & ${h.ambulanceService()}";

}


// Q10 Future
void hospitalReport(List<int?> arr) {

  Future.delayed(Duration(seconds: 2), () {

    int total = totalBills(arr);

    if(total > 15000){
      return "Hospital Running Successfully";
    }
    else{
      return "Low Revenue";
    }

  }).then((value) {

    print("Q10: ${value.toLowerCase()}");

  });

}



// DRIVER FUNCTION DO NOT MODIFY
void driver() {

  print("Q1: ${hospitalNameDemo()}");
  print("Q2: ${patientCity(p1)}");
  print("Q3: ${getterDemo(p1)}");
  print("Q4: ${setterDemo(p1)}");
  print("Q5: ${validBills(bills)}");
  print("Q6: ${totalBills(bills)}");
  print("Q7: ${insuranceDetails()}");
  print("Q8: ${reportDemo()}");
  print("Q9: ${hospitalServices()}");

  hospitalReport(bills);

}

void main() {

  driver();

}

// Copy Till Here