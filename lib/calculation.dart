class Calculation {
  int generateDate() {
    DateTime dt = DateTime.now();
    int date;
    date = dt.month * 100 + dt.hour;
    return date;
  }

  int convertBCD(int code) {
    var code1_binary = code.toRadixString(2);
    var code1_binary_reversed = code1_binary.split('').reversed.join();
    var code1_bcd_substracted = code1_binary_reversed.substring(0, 16);
    var code1_bcd = code1_bcd_substracted.split('').reversed.join();
    var code1_bcd_to_decimal = int.parse(code1_bcd, radix: 2);
    print(code1_bcd);
    print(code1_bcd_to_decimal);
    return code1_bcd_to_decimal;
  }

  int generateFactoryCode() {
    int code1 = generateDate() * 2456;
    int code2 = generateDate() + 9876;
    int code1_bcd_to_decimal = convertBCD(code1);

    int berryCode = (code1_bcd_to_decimal * 5051 - code2) + 506;
    int factoryCode = convertBCD(berryCode);
    print(factoryCode);
    return factoryCode;
  }

  int generateFactoryCodeByCodes(int code1, int code2) {
    int factoryCode = 0;
    if (code1 == 0 || code2 == 0) {
      return factoryCode;
    } else {
      int berryCode = (code1 * 5051 - code2) + 506;
      factoryCode = convertBCD(berryCode);
      return factoryCode;
    }
  }
}
