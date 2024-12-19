"use strict";
// B1: Khởi tạo class
// - Tên class viết hoa
class Department {
    // private name: string;
    // B3: Tạo 1 phương thức đặc biệt
    // Phương thức khởi tạo - Constructor function
    // Phương thức dùng để khởi tạo giá trị dành cho các thuộc tính
    // của một đối tượng (instance) khi được khởi tạo từ 1 lớp (Class)
    // --> Constructor function hoạt động như thế nào ???
    constructor(id, name) {
        // Từ khoá 'this' -> Dùng để tham chiếu (reference) tới chính
        // lớp (class) đang sử dụng nó
        // this.id === Department.id
        // this.name === Department.id
        // id = 2;
        // name = "Marketing";
        // Department.id = 2;
        // Department.name = "Marketing";
        this.id = id;
        this.name = name;
    }
    // B4: Mô phỏng cách hành động của đối tượng trong thực tế
    // Thông qua các phương thức (hàm)
    // Hàm ở trong lớp ---> method (phương thức)
    describe() {
        console.log(`Department: ${this.name} with ID: ${this.id}`);
    }
}
// Phòng kinh doanh (Sale Department)
// Phòng marketing (Marketing Department)
// Phòng đào tạo (Education Department)
// Phòng nghiên cứ và phát triển sp (Research & Development Department)
// ......
// Khởi tạo ra các instance (đối tượng con)
// Từ 1 bản nguyên mẫu (lớp - class cha)
let educationDepartment = new Department("1", "Education");
console.log(educationDepartment);
let mktDepartment = new Department("2", "Marketing"); // {id: "2", name: "Marketing"}
console.log(mktDepartment);
// dot notation (.) --> Truy cập vào các thuộc tính và phương thức của 1 đối tượng
console.log("Id:", mktDepartment.id);
console.log("Name:", mktDepartment.name);
mktDepartment.describe();
// - Liên quan đến ngữ cảnh (context) sử dụng từ khoá `this`
// - Bàn về chủ đề này sau ???? (time-comsuming)
let accounting = {
    describe: educationDepartment.describe.bind({ id: "2", name: "Accounting" }),
};
accounting.describe();
