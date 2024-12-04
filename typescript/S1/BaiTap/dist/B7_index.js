"use strict";
function multiplicationTable() {
    for (let i = 1; i <= 9; i++) {
        console.log(`Bảng cửu chương ${i}`);
        for (let j = 1; j <= 9; j++) {
            console.log(`${i} * ${j} = ${i * j}`);
        }
        console.log("_________________");
        console.log();
    }
}
multiplicationTable();
