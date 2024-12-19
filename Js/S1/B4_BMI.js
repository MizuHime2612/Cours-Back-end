function tinhBMI(weight, height){
    return weight/(height*height)
}
function phanLoai(loai){
    if(loai < 18.5)
        return "Can nang thap (gay)";
    if(loai >= 18.5 && loai <= 24.9)
        return "Binh thuong";
    if(loai >= 25 && loai <= 29.9)
        return "Tien beo phi";
    if(loai >= 30 && loai <= 34.9)
        return "Beo phi do I"
    if(loai >= 35 && loai <= 39.9)
        return "Beo phi do II"
    if(loai >= 40)
        return "Beo phi do III"
}
function kiemTraHopLe(weight, height){
    if(weight < 0 || height < 0)
        return false
    return true
}

let height = parseFloat(prompt("Nhap chieu cao (m): "));
let weight = parseFloat(prompt("Nhap can nang (kg): "));
if(!kiemTraHopLe(weight, height)){
    console.log("Vui long nhap lai!")
    height = parseFloat(prompt("Nhap chieu cao: "));
    weight = parseFloat(prompt("Nhap can nang: "));
}
let BMI = tinhBMI(weight, height);
let xeploai = phanLoai(BMI);
console.log("BMI " + BMI + " phan loai " + xeploai);
