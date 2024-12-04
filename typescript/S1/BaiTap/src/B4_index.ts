// Filter duplicate characters
let s: string = prompt("Nhập một chuỗi:") || "";
let a: string = [...new Set(s)].join('');
console.log(a);