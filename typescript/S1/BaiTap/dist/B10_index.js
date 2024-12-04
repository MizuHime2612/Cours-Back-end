"use strict";
function isValidDate(day, month) {
    const daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month === 2) {
        const year = new Date().getFullYear();
        const isLeapYear = (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
        if (isLeapYear) {
            daysInMonth[1] = 29;
        }
    }
    return month >= 1 && month <= 12 && day >= 1 && day <= daysInMonth[month - 1];
}
function getValidInput() {
    let day;
    let month;
    while (true) {
        day = parseInt(prompt("Nhập ngày sinh (1-31):"));
        month = parseInt(prompt("Nhập tháng sinh (1-12):"));
        if (isValidDate(day, month)) {
            break;
        }
        else {
            alert("Ngày hoặc tháng không hợp lệ. Vui lòng nhập lại.");
        }
    }
    return { day, month };
}
function getZodiacSign(day, month) {
    let zodiacSign = '';
    switch (month) {
        case 1:
            zodiacSign = day <= 19 ? "Ma Kết (Capricorn)" : "Bảo Bình (Aquarius)";
            break;
        case 2:
            zodiacSign = day <= 18 ? "Bảo Bình (Aquarius)" : "Song Ngư (Pisces)";
            break;
        case 3:
            zodiacSign = day <= 20 ? "Song Ngư (Pisces)" : "Bạch Dương (Aries)";
            break;
        case 4:
            zodiacSign = day <= 19 ? "Bạch Dương (Aries)" : "Kim Ngưu (Taurus)";
            break;
        case 5:
            zodiacSign = day <= 20 ? "Kim Ngưu (Taurus)" : "Song Tử (Gemini)";
            break;
        case 6:
            zodiacSign = day <= 20 ? "Song Tử (Gemini)" : "Cự Giải (Cancer)";
            break;
        case 7:
            zodiacSign = day <= 22 ? "Cự Giải (Cancer)" : "Sư Tử (Leo)";
            break;
        case 8:
            zodiacSign = day <= 22 ? "Sư Tử (Leo)" : "Xử Nữ (Virgo)";
            break;
        case 9:
            zodiacSign = day <= 22 ? "Xử Nữ (Virgo)" : "Thiên Bình (Libra)";
            break;
        case 10:
            zodiacSign = day <= 22 ? "Thiên Bình (Libra)" : "Hổ Cáp (Scorpio)";
            break;
        case 11:
            zodiacSign = day <= 21 ? "Hổ Cáp (Scorpio)" : "Nhân Mã (Sagittarius)";
            break;
        case 12:
            zodiacSign = day <= 21 ? "Nhân Mã (Sagittarius)" : "Ma Kết (Capricorn)";
            break;
    }
    alert(`Chòm sao của bạn là: ${zodiacSign}`);
}
const { day, month } = getValidInput();
getZodiacSign(day, month);
