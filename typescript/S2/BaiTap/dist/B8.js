"use strict";
function testBrackets(s) {
    let str = [];
    for (let char of s) {
        if (char === '(' || char === '{' || char === '[')
            str.push(char);
        else {
            if (str.length === 0)
                return false;
            let t = str.pop();
            if ((char === ')' && t !== '(') ||
                (char === '}' && t !== '{') ||
                (char === ']' && t !== '['))
                return false;
        }
    }
    return true;
}
console.log(testBrackets("()"));
console.log(testBrackets("()[]{}"));
console.log(testBrackets("([))"));
