"use strict";
function print2DArray(arr) {
    for (let i = 0; i < arr.length; i++) {
        console.log(arr[i].join(', '));
    }
}
let a = [
    [1, 2, 1, 24],
    [8, 11, 9, 4],
    [7, 0, 7, 27],
];
print2DArray(a);
