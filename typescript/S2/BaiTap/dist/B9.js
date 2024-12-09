"use strict";
function isPalindrome(s) {
    let s1 = s.toLowerCase().replace(/[^a-z0-9]/g, "");
    let s2 = s1.split("").reverse().join("");
    return s === s2;
}
console.log(isPalindrome("racecar"));
console.log(isPalindrome("raceacar"));
