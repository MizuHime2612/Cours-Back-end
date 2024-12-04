"use strict";
let s = prompt("Nhập một chuỗi:") || "";
let a = [...new Set(s)].join('');
console.log(a);
