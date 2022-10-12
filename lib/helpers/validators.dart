class Validators{



  static textValidator(String value, String type){
    if(value.isEmpty){return "aasdad";}
    // RegExp alphanumeric = new RegExp(r'([A-Z])\w+([0-9])');
    // if(value == null || value.isEmpty){
    //   return "Añade un $type";
    // }else if(value == null || alphanumeric.hasMatch(value)){
    //   return "asdasd";
    // }
    // else{
    //   return "El formato no es correcto";
    // }
  }

  static passValidator(String value, String type){
    if(value ==null || value.isEmpty){
      return "Añade un $type";
    }else{
      return null;
    }
  }
}