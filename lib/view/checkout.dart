import 'package:flutter/material.dart';
import 'package:intern_task/controller/firebase/checkout.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/controller/validation.dart';
import 'package:intern_task/view/main_screen.dart';
import 'package:provider/provider.dart';


class CheckOut extends StatefulWidget {
  const CheckOut({ Key? key }) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> with InputValidationMixin{
  final checkOutFormKey = GlobalKey<FormState>();
  String? name;
  String? phoneNumber;
  String? billingAddress;
  String? deliveryAddress;
  //final dateTimeNow = Provider.of<TimeStampConverter>(context,listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: checkOutFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
              const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name"
                      ),
                      validator: (value) {
                        if(value!.isEmpty || !isNameValidate(value)){
                          return  "enter a valid Name";}
                        else {return null;}
                      },
                      onChanged: (value){
                        name = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Phone Number"
                      ),
                      validator: (value) {
                        if(value!.isEmpty || !isPhoneNumberValidate(value)){
                          return  "enter a valid Phone number";}
                        else {return null;}
                      },
                      onChanged: (value){
                        phoneNumber = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Billing Address"
                      ),
                      validator: (value) {
                        if(value!.isEmpty || !isAddressValidate(value)){
                          return  "enter a valid address";}
                        else {return null;}
                      },
                      onChanged: (value){
                        billingAddress=value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Delivery Address"
                      ),
                      validator: (value) {
                        if(value!.isEmpty || !isAddressValidate(value)){
                          return  "enter a valid address";}
                        else {return null;}
                      },
                      onChanged: (value){
                        deliveryAddress = value;
                      },
                    ),
                    
                    const SizedBox(height: 33),
            
                      Center(
                        child: Consumer<TimeStampConverter>(
                          builder: (context, provider, child){
                            return GestureDetector(
                              onTap: (){
                                provider.pickDate(context);
                              },
                              child: Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width-22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey.withOpacity(0.2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${provider.dateTime != null?provider.dateTime : "Date and Time"}"),
                                        Icon(Icons.calendar_today)
                                      ],
                                    ),
                                  ),
                              ),
                            );
                          }
                        )
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "Current Date",
                      //   ),
                      //   //maxLength: 6,
                      //   validator: (password) {
                      //     // if(password == '') return 'please enter your password';
                      //     // if (isPasswordValid(password!)) return null;
                      //     // else return 'Enter a valid password';
                      //   },
                      // ),
                      // Image(image: NetworkImage("sdfsddf"),)
                      const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (checkOutFormKey.currentState!.validate()) {
                              checkOutFormKey.currentState!.save();
                              Checkout checkout = Checkout();
                              DateTime date = Provider.of<TimeStampConverter>(context,listen: false).dateTime!;
                              checkout.sendData(name!, phoneNumber!, billingAddress!, deliveryAddress!, date);
                              // print(name);
                              // print(phoneNumber);
                              // print(billingAddress);
                              // print(deliveryAddress);
                              // print(Provider.of<TimeStampConverter>(context,listen: false).dateTime);
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainScreen()),(Route<dynamic> route) => false,);
                            }
                          },
                          child: Text("Submit")),
            
                          
                      ],
              ),
            ),
          ),
      ),
      
    );
  }
}