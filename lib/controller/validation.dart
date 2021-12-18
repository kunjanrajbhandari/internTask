mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;

  // bool isEmailValid(String email) {
  //   RegExp regex = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //   return regex.hasMatch(email);
  // } 

  bool isNameValidate(String name){
    RegExp regName = new RegExp(r"^[a-zA-Z ]+$");
    return regName.hasMatch(name);
  } 
   bool isPhoneNumberValidate(String phoneNumber){
    RegExp regphoneNumber = new RegExp(r"^[+]*[0-9]+$");
    return regphoneNumber.hasMatch(phoneNumber);
  } 
  bool isAddressValidate(String address){
    RegExp regaddress = new RegExp(r"^[A-Za-z0-9 ,]*$");
    return regaddress.hasMatch(address);
  } 
  
}