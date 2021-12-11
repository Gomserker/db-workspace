//유효성 검사에 사용되는 JS 라이브러리를 만들었읍니다 짝짝

//일반적으로 유효성 검사하는 것들

//함수형태로 정리해서 나중에 필요할때 쓰려고
//.jar 처럼 라이브러리형태로 가져다 쓰는것 ㅇㅇ


function isEmpty(input){
    return !input.value; //값이 없다는 뜻.
}

function lessThan(input, length){
    return input.value.length < length;
}

function containKR(input){
    let ok = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890@._"
    
    for (let i = 0; i <  input.value.length; i++){
        if(ok.indexOf(input.value[i]) == -1){
            return true;
            // 문제가 있으면 ture 바로 if문 빠져나가기
        }
    }
}

// <input>을 두개 넣으면
// 내용이 다르면 true, 아니면 false (비밀번호 & 비밀번호 확인)

function notEquals(input1, input2){

    // if(input2.value != input1.value){
    //     return true;
    // }
    return input1.value != input2.value;
}

// <input>, 문자열 세트
// 그 문자열 세트가 포함 안되어있으면 ture
// 들어있으면 false

function notContains(input, set){
    //input : 1qwwerASD
    // set : 1234567890 -> 숫자를 반드시 포함시키고 싶다.
    // set : QWERTYUIOPASDFGHJKLZXCVBNM -> 대문자를 반드시 포함시키고 싶다.

    for (let i = 0; i < set.length ; i++){
        if(input.value.indexOf(set[i]) != -1){
            return false;
        }
    }
    return true;
}

//input을 넣어서 숫자가 아니면 true, 숫자면 false (꼭 숫자를 넣어라 like 전화번호, 주민번호 etc 숫자로만 구성된 것들)
function isNotNumber(input){
    return isNaN(input.value);
}