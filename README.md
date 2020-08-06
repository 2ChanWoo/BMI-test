# bmi

BMI Test app

## Form 과 검증.
TextFormField 위젯은 TextFirld 위젯이 제공하는 기능에 추가로 validator 프로퍼티를 활용한 검증
기능도 제공합니다.
검증에는 TextFormField 위젯을 사용하며, 검증할 내용 전체를 Form위젯으로 감쌉니다.
From에는 유니크한 키를 지정해야 하며, GlobalKey<FromState>인스턴스를 키로 사용합니다.
TextFormField 위젯에는 validator 프로퍼티가 있으며 여기에는 입력된 값을 인수(value)로 받는 함수를 작성합니다.
또한 검증 로직을 작성하는데, 에러 메시지를 문자열로 반환하거나 null을 반환하여 검증이 통과 되었음을 정의할 수 있습니다.
폼의 검증은 _formKey.currentState.valudate() 로 수행되며 true 또는 false값을 반환합니다.
폼 안에 TextFormField위젯이 여러 개 있어도 이 한 줄로 검증을 체크할 수 있습니다.

```
validator 의 함수가 null 을 return 하면 '정상' 이라는 것!
```

