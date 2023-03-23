const months = {
// monthIndex : {key : value}
  1: {'JAN': 31},
  2: {'FEB': 28},
  3: {'MAR': 31},
  4: {'APR': 30},
  5: {'MAY': 31},
  6: {'JUN': 30},
  7: {'JUL': 31},
  8: {'AUG': 31},
  9: {'SEP': 30},
  10: {'OCT': 31},
  11: {'NOV': 30},
  12: {'DEC': 31},
};


/**

 1월부터 12월까지의 Month와 해당 월의 일 수 (day in month)를 포함
 * month[1]은 1월을 나타냄
 * month[1]['JAN']은 1월이 31일로 이루어져있음을 의미
 --> months[1]['JAN'] == 31은 true 리턴

* months[monthIndex]!.keys.toList()[0]
--> months Map에서 monthIndex에 해당하는 Value를 가져오고 해당 값의 모든 key를
    리스트로 변환 후 그 중 첫 번째 인덱스에 넣음
  예) monthIndex가 1일 때
  --> months[1]은 {'JAN': 31}이고 .keys.toList()가 이거의 key인 'JAN'을 ['JAN']으로 변환
      따라서 month[1]!.keys.toList()[0]은 'JAN'을 리턴

* months[monthIndex]!.values.toList()[0]
--> 위랑 같으나 얘는 value 값을 리스트로 리턴
  예) monthIndex가 1일 때
  --> months[1]은 {'JAN': 31}이고 .values.toList()가 이거의 value인 31을 [31]으로 변환
      따라서 month[1]!.values.toList()[0]은 '31'을 리턴

  
 */