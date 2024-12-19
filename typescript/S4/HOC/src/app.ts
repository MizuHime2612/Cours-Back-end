// B1: Khởi tạo class
// - Tên class viết hoa
class Department {
    // B2: Liệt kê các thuộc tính (Properties)
    // tính chất của đối tượng cần mô tả
    // access_modifier + property_name: data_type;
    id: string;
    name: string;
    private _manager: string;
    // private name: string;
  
    // B3: Tạo 1 phương thức đặc biệt
    // Phương thức khởi tạo - Constructor function
    // Phương thức dùng để khởi tạo giá trị dành cho các thuộc tính
    // của một đối tượng (instance) khi được khởi tạo từ 1 lớp (Class)
    // --> Constructor function hoạt động như thế nào ???
    constructor(id: string, name: string, manager: string) {
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
      this._manager = manager;
    }
  
    // B4: Mô phỏng cách hành động của đối tượng trong thực tế
    // Thông qua các phương thức (hàm)
    // Hàm ở trong lớp ---> method (phương thức)
  
    // manager getter
    get manager() {
      return this._manager;
    }
  
    // manager setter
    set manager(manager: string) {
      this._manager = manager;
    }
  
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
  let educationDepartment = new Department("1", "Education", "Nguyễn Văn A");
  console.log(educationDepartment);
  
  let mktDepartment = new Department("2", "Marketing", "Trần Văn B"); // {id: "2", name: "Marketing"}
  console.log(mktDepartment);
  
  // dot notation (.) --> Truy cập vào các thuộc tính và phương thức của 1 đối tượng
  console.log("Id:", mktDepartment.id);
  console.log("Name:", mktDepartment.name);
  mktDepartment.name = "Advanced Marketing";
  console.log("Name:", mktDepartment.name);
  
  mktDepartment.describe();
  
  // Truy cập vào thuộc tính private
  console.log("manager:", mktDepartment.manager);
  mktDepartment.manager = "Bill Gates";
  console.log("manager:", mktDepartment.manager);
  
  // - Liên quan đến ngữ cảnh (context) sử dụng từ khoá `this`
  // - Bàn về chủ đề này sau ???? (time-comsuming)
  let accounting = {
    describe: educationDepartment.describe.bind({ id: "2", name: "Accounting" }),
  };
  accounting.describe();