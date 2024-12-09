let numberList: number[];

let studentList : string[];

studentList = ["Vũ Hà Trang", "Nguyễn Phi Hùng", "Hàn Kha Nguyệt"];

for(let i:number = 0; i < studentList.length; i++){
    console.log(studentList[i]);
}

// - C2: Sử dụng vòng lặp for...of 
// -> Lấy ra toàn bộ phần tử có trong mảng (Không quan tâm đến chỉ số
// của những phần tử có trong mảng)
for(let student of studentList){
    console.log(student);
}
// - C3: Sử dụng vòng lặp for...in
// -> Lấy ra toàn bộ phần tử có trong mảng (Làm việc được với toàn bộ
// chỉ số của các phần tử có trong mảng)
for (let index in studentList){
    console.log(index, studentList[index]);
}
// create
// thêm đầu mảng .unshift()
// thêm cuối mảng .push()
// thêm ở giữa mảng .splice()

// delete
// xoá đầu .shif
// xoá cuối .pop
// xoá bất kì .splice

let phoneList: Array<string>;

phoneList = ["0927 235 789", "0392 105 996", "0388 264 291"];

let randomArr : any[];

randomArr = [123, "trang"];

type Person = {
    name: string;
    age: number;
    hobbies: string[];
    gender: boolean;
};
  
  // Khởi tạo một đối tượng `person` với kiểu dữ liệu `Person`
  let person: Person = {
    name: "Nguyễn Văn A",
    age: 20,
    hobbies: ["chơi guitar", "đọc sách", "chạy bộ"],
    gender: true,
};

// tạo tuple: mảng có kiểu dữ liệu khác nhau trong mỗi phần tử của mảng và có độ dài cố đingj
let roles: [string, string, string];

roles = ["trang", "hùng", "nguyệt"];

enum Role{
    ADMIN,
    MOMO,
    USER,
};

let role = {
    ADMIN: 1,
    MOMO: 2,
    USER: 3,
};

let randoValue: string | number | boolean;