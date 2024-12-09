"use strict";
let numberr = [];
for (let i = 0; i < 10; i++) {
    let input = prompt(`Nhập phần tử thứ ${i + 1}:`);
    if (input !== null) {
        let num = Number(input);
        if (!numberr.includes(num)) {
            numberr.push(num);
        }
        else {
            i--;
            alert("Số đã tồn tại, vui lòng nhập số khác.");
        }
    }
}
let max = Math.max(...numberr);
let min = Math.min(...numberr);
let maxIndex = numberr.indexOf(max);
let minIndex = numberr.indexOf(min);
console.log(`Mảng: [${numberr.join(", ")}]`);
console.log(`Phần tử lớn nhất là ${max} ở vị trí ${maxIndex + 1}`);
console.log(`Phần tử nhỏ nhất là ${min} ở vị trí ${minIndex + 1}`);
