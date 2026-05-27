// ==========================
// DART SOLVED FILE
// ==========================

List<int?> bills = [
  5000,
  null,
  -1200,
  3000,
  7000,
  null,
  2500
];

List<String> departments = [
  "Cardiology",
  "Neurology",
  "Orthopedic"
];

class Patient {

  static String hospitalName =
      "City Hospital";

  String name;
  int patientId;

  double _healthScore;

  String? city;

  Patient(
    this.name,
    this.patientId,
    this._healthScore,
    this.city
  );

  // Getter
  double get healthScore =>
      _healthScore;

  // Setter
  set healthScore(double value){

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

  ) : super(
        name,
        patientId,
        healthScore,
        city
      );

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

  String emergencyService(){

    return
      "Emergency Service Active";

  }

}


mixin Ambulance {

  String ambulanceService(){

    return "Ambulance Ready";

  }

}


class Hospital
    with Emergency, Ambulance {}

Patient p1 =
    Patient("Harsh", 201, 8.5, null);


// Q1
String hospitalNameDemo(){

  return Patient.hospitalName;

}


// Q2
String patientCity(Patient p){

  return p.city
      ?? "City Not Available";

}


// Q3
double getterDemo(Patient p){

  return p.healthScore;

}


// Q4
double setterDemo(Patient p){

  p.healthScore = 9.2;

  return p.healthScore;

}


// Q5
List<int> validBills(List<int?> arr){

  return arr
      .where((bill)=> bill != null)
      .map((bill)=>
          bill! < 0 ? -bill : bill)
      .toList();

}


// Q6
int totalBills(List<int?> arr){

  return arr
      .where((bill)=> bill != null)
      .map((bill)=>
          bill! < 0 ? -bill : bill)
      .reduce((a,b)=> a+b);

}


// Q7
double insuranceDetails(){

  VIPPatient vip = VIPPatient(
    "Rahul",
    301,
    9.5,
    "Delhi",
    100000
  );

  return vip.insuranceAmount;

}


// Q8
String reportDemo(){

  DoctorReport report =
      DoctorReport();

  return report.reportStatus();

}


// Q9
String hospitalServices(){

  Hospital h = Hospital();

  return
      "${h.emergencyService()} "
      "& "
      "${h.ambulanceService()}";

}


// Q10
void hospitalReport(List<int?> arr){

  Future.delayed(
    Duration(seconds: 2),

    (){

      int total = totalBills(arr);

      if(total > 15000){

        return
          "Hospital Running Successfully";

      }
      else{

        return "Low Revenue";

      }

    }

  ).then((value){

    print(
      "Q10: ${value.toLowerCase()}"
    );

  });

}


// DRIVER CODE
void driver(){

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


void main(){

  driver();

}