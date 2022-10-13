class Validators{
  RegExp alphaExp = new RegExp(r'^([A-Z])\w+', caseSensitive: false);
  RegExp numericExp = new RegExp(r'^([0-9])\w+', caseSensitive: false);
  RegExp specialExp = new RegExp(r'^(?=.*[#?!$€^&*-])', caseSensitive: false);

  static textValidator(String value, String type){
    RegExp alphanumeric = new RegExp(r'^([A-Z])\w+', caseSensitive: false);
    if(value == null || value.isEmpty){
      return "Añade un $type";
    }else if(value != null &&  alphanumeric.hasMatch(value)){
      return null;
    }
    else{
      return "El formato no es correcto";
    }
  }

  static mailValidator(String value, String type){
    print(value);
    RegExp alphanumeric = new RegExp(r'^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$', caseSensitive: false);
    if(value == null || value.isEmpty){
      return "Añade un $type";
    }else if(value != null && alphanumeric.hasMatch(value)){
      print(value);
      return null;
    }
    else{
      return "El formato no es correcto";
    }
  }

  static passValidator(String value, String type) {
    RegExp passExp = new RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[#?!$€^&*-]).{8,}');
    RegExp alphaExp = new RegExp(r'^(?=.*[A-Z])\w+', caseSensitive: false);
    RegExp numericExp = new RegExp(r'^(?=.*[0-9])', caseSensitive: false);
    RegExp specialExp = new RegExp(r'^(?=.*[#?!$€^&*-])', caseSensitive: false);
    if (value == null || value.isEmpty) {
      return "Añade un $type";
    } else if (value != null && passExp.hasMatch(value)) {
      return null;
    } else {
      if(value.length<8){
        return "Añade alemnos 8 caracteres";
      }else if(!numericExp.hasMatch(value)){
        return "Añade un número";
      }else if(!specialExp.hasMatch(value)){
        return "Añade un carácter especial";
      }else if(!alphaExp.hasMatch(value)){
        return "Añade almenos una mayúscula";
      }

    }
  }
}