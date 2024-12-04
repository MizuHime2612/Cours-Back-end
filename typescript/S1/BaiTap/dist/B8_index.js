"use strict";
function playGame() {
    let targetNumber = Math.floor(Math.random() * 10) + 1;
    let maxAttempts = 3;
    let attempts = 0;
    while (attempts < maxAttempts) {
        let userInput = prompt(`Hãy đoán một số từ 1 đến 10 (Còn ${maxAttempts - attempts} lượt):`);
        if (userInput === null) {
            alert("Bạn đã hủy trò chơi!");
            return;
        }
        let userGuess = Number(userInput);
        attempts++;
        if (isNaN(userGuess)) {
            alert("Vui lòng nhập một số hợp lệ!");
            continue;
        }
        if (userGuess === targetNumber) {
            alert("Chúc mừng! Bạn đã đoán đúng.");
            return;
        }
        else if (userGuess > targetNumber) {
            alert("Số của bạn lớn hơn số cần tìm!");
        }
        else {
            alert("Số của bạn nhỏ hơn số cần tìm!");
        }
    }
    alert(`Bạn đã thua! Số đúng là: ${targetNumber}`);
}
playGame();
