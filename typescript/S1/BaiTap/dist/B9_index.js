"use strict";
function generateRandomColor() {
    let randomColor = `#${Math.floor(Math.random() * 16777215).toString(16).padStart(6, "0")}`;
    return randomColor;
}
function displayRandomColors() {
    for (let i = 0; i < 10; i++) {
        const color = generateRandomColor();
        console.log(`%cMàu sắc đã được thay đổi`, `color: ${color}; font-weight: bold; font-size: 16px;`);
    }
}
displayRandomColors();
