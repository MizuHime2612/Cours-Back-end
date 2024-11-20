function xepLoai(dtb){
    if(dtb >= 8.0 && dtb <= 10)
        return "Gioi";
    if(dtb >= 6.5 && dtb <= 7.9)
        return "Kha";
    if(dtb >= 5.0 && dtb <= 6.4)
        return "Trung binh";
    if(dtb < 5.0)
        return "Yeu";
}
function tinhdiemtrungbinh(toan, van, anh){
    return (toan+van+anh)/3;
}
function kiemTraDiem(diem) {
    return diem >= 0 && diem <= 10;
}
function nhapDiem(mon) {
    let diem = parseFloat(prompt(`Nhap diem ${mon}: `));
    if (!kiemTraDiem(diem)) {
        console.log("Diem khong hop le!");
        return nhapDiem(mon);
    }
    return diem;
}
let toan = nhapDiem("toan");
let van = nhapDiem("van");
let anh = nhapDiem("anh");
let diemtb = tinhdiemtrungbinh(toan, van, anh);
let loai = xepLoai(diemtb);
console.log("Diem trung binh " + diemtb.toFixed(2) + " xep loai " + loai);
