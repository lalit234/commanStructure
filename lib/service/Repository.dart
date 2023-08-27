import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:dog_medical/screen/treatment/model/ModelAddReport.dart';
import 'package:dog_medical/utility/sharedPref.dart';

import '../utility/Utils.dart';
import 'Service.dart';
import 'package:http/http.dart' as http;

class Repository
{

  final services = Service();

  //base url
  static String baseurl="https://aradhnasaree.com/dog_medical/api";


  static String loginurl="${baseurl}/loginv1";

  static String doctorregistration="${baseurl}/register_doctor";

  static String ownerregistration="${baseurl}/register_owner";

  static String doctordashboard="${baseurl}/doctor_dashboard";

  static String assistantdashboard="${baseurl}/assistant_dashboard";

  static String userdashboard="${baseurl}/user_dashboard";

  static String getpets="${baseurl}/get_pets";

  static String addpetUrl="${baseurl}/add_pet";

  static String getitesmUrl="${baseurl}/get_items";

  static String gettreatmentmtypeUrl="${baseurl}/get_treatment_types";

  static String additemUrl="${baseurl}/add_item";

  static String deleteitemUrl="${baseurl}/item";

  static String edititemUrl="${baseurl}/edit_item";

  static String addassistantUrl="${baseurl}/add_assistant";

  static String getassistantsUrl="${baseurl}/get_assistant";

  static String getappointmentUrl="${baseurl}/get_appointment";

  static String appointmentstatuschangeUrl="${baseurl}/change_appointment_status";

  static String addclinicUrl="${baseurl}/add_clinic";

  static String getclinicUrl="${baseurl}/get_clinics";

  static String getclinicbydoctorUrl="${baseurl}/get_clinics_by_doctor";

  static String addtreatmentUrl="${baseurl}/add_treatment";


  /*============  Login api  ===============*/

  Future<dynamic> login(String username,String password) async
  {
    var map = <String, String>{};
    map['username'] = username;
    map['password'] = password;

    return services.postwithtoken(loginurl,map);
  }


  /*============  doctor registration  ===============*/

  Future<dynamic> doctorRegistration(String name,String phone,String email,String password,String licence_number,String gender,String clinic_address,String area,String city,String state,String pin,String open_time,String close_time,String major_practices,String experience,String refere,String consulting_charge,String address_type,File? profile) async
  {
    var map = <String, String>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['licence_number'] = licence_number;
    map['gender'] = gender;
    map['clinic_address'] = clinic_address;
    map['area'] = area;
    map['city'] = city;
    map['state'] = state;
    map['pin'] = pin;
    map['open_time'] = open_time;
    map['close_time'] = close_time;
    map['major_practices'] = major_practices;
    map['experience'] = experience;
    map['consulting_charge'] = consulting_charge;
    map['address_type'] = address_type;
    map['refere_enabled'] = refere;

    List<http.MultipartFile> multiPart = [];

    if(profile!=null)
    {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('profile',profile.path);
      multiPart.add(multipartFile);
    }

    return services.multiPartRequest(doctorregistration,map,multiPart);
  }

  /*============  owner registration  ===============*/

  Future<dynamic> ownerRegistration(String name,String phone,String email,String password,String age,String gender,String occupation,String address,String area,String city,String state,String pin,File? profile) async
  {
    var map = <String, String>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['age'] = age;
    map['gender'] = gender;
    map['occupation'] = occupation;
    map['address'] = address;
    map['area'] = area;
    map['city'] = city;
    map['state'] = state;
    map['pin'] = pin;
    map['latitude'] = '0.0';
    map['longitude'] = '0.0';

    List<http.MultipartFile> multiPart = [];

    if(profile!=null)
    {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('profile',profile.path);
      multiPart.add(multipartFile);
    }

    return services.multiPartRequest(ownerregistration,map,multiPart);
  }

  /*============  Doctor Dashboard  ===============*/

  Future<dynamic> doctorDashboard() async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);

    return services.postwithouttoken(doctordashboard,map);
  }

  /*============  User Dashboard  ===============*/

  Future<dynamic> userDashboard() async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);

    return services.postwithouttoken(userdashboard,map);
  }


  /*============  get pets  ===============*/

  Future<dynamic> getPets() async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);

    return services.postwithouttoken(getpets,map);
  }

  /*============  add pet api  ===============*/

  Future<dynamic> addPet(String name,String age,String gender,String weight,String type,String breed) async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);
    map['pet_type'] = '11';
    map['name'] = name;
    map['age'] = age;
    map['gender'] = gender;
    map['weight'] = weight;
    map['type'] = type;
    map['breed'] = breed;

    return services.postwithouttoken(addpetUrl,map);
  }

  /*============  get Items  ===============*/

  Future<dynamic> getItems(int pageCode,String keyword,String type) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['offset'] = pageCode.toString();
    map['keyword'] = keyword;
    map['type'] = type;

    return services.postwithouttoken(getitesmUrl,map);
  }

  /*============  Delete Items  ===============*/

  Future<dynamic> deleteItems(String id) async
  {
    var map = <String, String>{};

    return services.deletewithtoken(deleteitemUrl+"/$id",map);
  }

  /*============  Edit Items  ===============*/

  Future<dynamic> editItems(String id,String code,String name,String description,String hsnCode,String unit,String rate,String qty,String gstPercentage,String type) async
  {
    var map = <String, String>{};
    map['code'] = code;
    map['name'] = name;
    map['description'] = description;
    map['hsn_code'] = hsnCode;
    map['unit'] = unit;
    map['rate'] = rate;
    map['qty'] = qty;
    map['gst_percentage'] = gstPercentage;
    map['type'] = type;

    return services.postwithouttoken(edititemUrl+"/$id",map);
  }

  /*============  add item api  ===============*/

  Future<dynamic> addItem(String code,String name,String description,String hsnCode,String unit,String rate,String qty,String gstPercentage,String type) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['code'] = code;
    map['name'] = name;
    map['description'] = description;
    map['hsn_code'] = hsnCode;
    map['unit'] = unit;
    map['rate'] = rate;
    map['qty'] = qty;
    map['gst_percentage'] = gstPercentage;
    map['type'] = type;

    return services.postwithouttoken(additemUrl,map);
  }


  /*============  get assistants  ===============*/

  Future<dynamic> getAssistants(String keyword) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['keyword'] = keyword;

    return services.postwithouttoken(getassistantsUrl,map);
  }

  /*============  add assistant  ===============*/

  Future<dynamic> addAssistant(String name,String phone,String email,String password,String address,String gender,String salary,String shift_start_time,String shift_end_time,String experience,File? profile) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['address'] = address;
    map['gender'] = gender;
    map['salary'] = salary;
    map['shift_start_time'] = shift_start_time;
    map['shift_end_time'] = shift_end_time;
    map['experience'] = experience;

    List<http.MultipartFile> multiPart = [];

    if(profile!=null)
    {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('profile',profile.path);
      multiPart.add(multipartFile);
    }

    return services.multiPartRequest(addassistantUrl,map,multiPart);
  }

  /*============  get appointment  ===============*/

  Future<dynamic> getAppointment(String userType,String status,int offset) async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);
    map['user_type'] = userType;
    map['status'] = status;
    map['offset'] = offset.toString();
    return services.postwithouttoken(getappointmentUrl,map);
  }

  /*============  change appointment status ===============*/

  Future<dynamic> changeAppointmentStatus(String appointment_id,String status) async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);
    map['appointment_id'] = appointment_id;
    map['status'] = status;
    return services.postwithouttoken(appointmentstatuschangeUrl,map);
  }

  /*============  get Items  ===============*/

  Future<dynamic> getItemTreatment() async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);

    return services.postwithouttoken(getitesmUrl,map);
  }

  /*============  get Treatment  ===============*/

  Future<dynamic> getTreatmentType() async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);

    return services.postwithouttoken(gettreatmentmtypeUrl,map);
  }

  /*============  add treatment  ===============*/

  Future<dynamic> addTreatment(String appointmentId,String extraCharge,String subTotal,String sgst,String cgst,String total,String treatmentDetails,String items, List<ModelAddReport> addReportList) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['appointment_id'] = appointmentId;
    map['extra_service_charge'] = extraCharge;
    map['sub_total'] = subTotal;
    map['sgst'] = sgst;
    map['cgst'] = cgst;
    map['total'] = total;
    map['treatment_details'] = treatmentDetails.substring(1, treatmentDetails.length - 1);
    map['items'] = items.substring(1, items.length - 1);

    List<http.MultipartFile> multiPart = [];

    for(int i=0;i<addReportList.length;i++)
    {

      map['report[$i][name]'] = addReportList[i].reportTitle.toString();
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('report[$i][file]',addReportList[i].file!.path);
      multiPart.add(multipartFile);
    }

    return services.multiPartRequest(addtreatmentUrl,map,multiPart);
  }

  /*============  add clinic  ===============*/

  Future<dynamic> addClinic(String clinicName,String clinicAddress,String addressType,String area,String city,String state,String pin,String startTime,String endTime,String latitude,String longitude) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['clinic_name'] = clinicName;
    map['clinic_address'] = clinicAddress;
    map['address_type'] = addressType;
    map['area'] = area;
    map['city'] = city;
    map['state'] = state;
    map['pin'] = pin;
    map['round_start_time'] = startTime;
    map['round_end_time'] = endTime;
    map['latitude'] = latitude;
    map['longitude'] = longitude;

    return services.postwithouttoken(addclinicUrl,map);
  }

  /*============  edit clinic  ===============*/

  Future<dynamic> editClinic(String id,String clinicName,String clinicAddress,String addressType,String area,String city,String state,String pin,String startTime,String endTime,String latitude,String longitude) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['clinic_name'] = clinicName;
    map['clinic_address'] = clinicAddress;
    map['address_type'] = addressType;
    map['area'] = area;
    map['city'] = city;
    map['state'] = state;
    map['pin'] = pin;
    map['round_start_time'] = startTime;
    map['round_end_time'] = endTime;
    map['latitude'] = latitude;
    map['longitude'] = longitude;

    return services.postwithouttoken(addclinicUrl+"/${id}",map);
  }

  /*============  get Clinic  ===============*/

  Future<dynamic> getClinic(int pageCode,String keyword,String latitude,String longitude) async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);
    map['offset'] = pageCode.toString();
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['keyword'] = keyword;

    return services.postwithouttoken(getclinicUrl,map);
  }

  /*============  get Clinic By Doctor  ===============*/

  Future<dynamic> getClinicByDoctor(int pageCode,String keyword) async
  {
    var map = <String, String>{};
    map['doctor_id'] = sharedPref.getStringPref(sharedPref.id);
    map['offset'] = pageCode.toString();
    map['keyword'] = keyword;

    return services.postwithouttoken(getclinicbydoctorUrl,map);
  }

  /*============  Assistant Dashboard  ===============*/

  Future<dynamic> assistantDashboard() async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);

    return services.postwithouttoken(assistantdashboard,map);
  }

  /*============  Add Appointment ===============*/

  Future<dynamic> addAppointment() async
  {
    var map = <String, String>{};
    map['user_id'] = sharedPref.getStringPref(sharedPref.id);

    return services.postwithouttoken(assistantdashboard,map);
  }

}