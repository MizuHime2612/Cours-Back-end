"use strict";
function sortDescending(arr) {
    const n = arr.length;
    for (let i = 0; i < n - 1; i++) {
        for (let j = i + 1; j < n; j++) {
            if (arr[i] < arr[j]) {
                const temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    return arr;
}
let inputt = prompt("Nhập 10 số nguyên, cách nhau bởi dấu phẩy: ");
if (inputt) {
    let arr = inputt.split(',').map(num => parseInt(num.trim(), 10));
    if (arr.length === 10) {
        console.log("Mảng ban đầu: ", arr);
        const sortedArr = sortDescending(arr);
        console.log("Mảng sau khi sắp xếp giảm dần: ", sortedArr);
    }
    else {
        console.log("Vui lòng nhập đúng 10 số nguyên.");
    }
}
else {
    console.log("Không có dữ liệu đầu vào.");
}
