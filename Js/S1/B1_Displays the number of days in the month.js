function kiemTraNamNhuan(year) {
  year = parseInt(year);
  return (year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0));
}
function ngayThang(month) {
  if (month < 1 || month > 12) {
    return "Khong hop le";
  }
  
  let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  
  if (month === 2) {
    let year = parseInt(prompt("Nhap nam: "));
    if (kiemTraNamNhuan(year)) {
      return 29;
    }
    return 28;
  }
    return daysInMonth[month - 1]; // Return the days for other months
}

let month = parseInt(prompt("Nhap thang: ")); // Ensure month is an integer
let day = ngayThang(month);
console.log("Ngay trong thang la: " + day);
