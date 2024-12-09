"use strict";
let numberList;
let studentList;
studentList = ["Vũ Hà Trang", "Nguyễn Phi Hùng", "Hàn Kha Nguyệt"];
for (let i = 0; i < studentList.length; i++) {
    console.log(studentList[i]);
}
for (let student of studentList) {
    console.log(student);
}
for (let index in studentList) {
    console.log(index, studentList[index]);
}
let phoneList;
phoneList = ["0927 235 789", "0392 105 996", "0388 264 291"];
let randomArr;
randomArr = [123, "trang"];
let person = {
    name: "Nguyễn Văn A",
    age: 20,
    hobbies: ["chơi guitar", "đọc sách", "chạy bộ"],
    gender: true,
};
let roles;
roles = ["trang", "hùng", "nguyệt"];
var Role;
(function (Role) {
    Role[Role["ADMIN"] = 0] = "ADMIN";
    Role[Role["MOMO"] = 1] = "MOMO";
    Role[Role["USER"] = 2] = "USER";
})(Role || (Role = {}));
;
let role = {
    ADMIN: 1,
    MOMO: 2,
    USER: 3,
};
let randoValue;
