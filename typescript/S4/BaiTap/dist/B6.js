"use strict";
class Employee {
    constructor(name) {
        this._id = Employee._idCounter++;
        this._name = name;
    }
    get id() {
        return this._id;
    }
    get name() {
        return this._name;
    }
    set name(value) {
        if (!value.trim()) {
            throw new Error("Tên nhân viên không được để trống.");
        }
        this._name = value;
    }
}
Employee._idCounter = 1;
class Task {
    constructor(title, deadline) {
        this._id = Task._idCounter++;
        this._title = title;
        this._deadline = deadline;
        this._isCompleted = false;
    }
    get id() {
        return this._id;
    }
    get title() {
        return this._title;
    }
    set title(value) {
        if (!value.trim()) {
            throw new Error("Tên công việc không được để trống.");
        }
        this._title = value;
    }
    get deadline() {
        return this._deadline;
    }
    set deadline(value) {
        if (value < new Date()) {
            throw new Error("Hạn hoàn thành không được là ngày trong quá khứ.");
        }
        this._deadline = value;
    }
    get isCompleted() {
        return this._isCompleted;
    }
    set isCompleted(value) {
        this._isCompleted = value;
    }
}
Task._idCounter = 1;
class Assignment {
    constructor(employee, task) {
        this._employee = employee;
        this._task = task;
    }
    get employee() {
        return this._employee;
    }
    get task() {
        return this._task;
    }
}
class TaskManager {
    constructor() {
        this._employees = [];
        this._tasks = [];
        this._assignments = [];
    }
    addEmployee(name) {
        if (!name.trim()) {
            console.log("⚠️ Tên nhân viên không được để trống.");
            return;
        }
        const employee = new Employee(name);
        this._employees.push(employee);
        console.log(`✅ Đã thêm nhân viên: ${employee.name} (ID: ${employee.id})`);
    }
    addTask(title, deadline) {
        if (!title.trim()) {
            console.log("⚠️ Tên công việc không được để trống.");
            return;
        }
        const parsedDeadline = new Date(deadline);
        if (isNaN(parsedDeadline.getTime())) {
            console.log("⚠️ Hạn hoàn thành không hợp lệ.");
            return;
        }
        const task = new Task(title, parsedDeadline);
        this._tasks.push(task);
        console.log(`✅ Đã thêm công việc: ${task.title} (ID: ${task.id})`);
    }
    assignTask(employeeId, taskId) {
        const employee = this._employees.find(e => e.id === employeeId);
        const task = this._tasks.find(t => t.id === taskId);
        if (!employee) {
            console.log("⚠️ Không tìm thấy nhân viên với ID đã cho.");
            return;
        }
        if (!task) {
            console.log("⚠️ Không tìm thấy công việc với ID đã cho.");
            return;
        }
        this._assignments.push(new Assignment(employee, task));
        console.log(`✅ Đã phân công công việc: ${task.title} cho nhân viên: ${employee.name}`);
    }
    completeTask(taskId) {
        const task = this._tasks.find(t => t.id === taskId);
        if (!task) {
            console.log("⚠️ Không tìm thấy công việc với ID đã cho.");
            return;
        }
        task.isCompleted = true;
        console.log(`✅ Công việc "${task.title}" đã được đánh dấu hoàn thành.`);
    }
    listTasks() {
        if (this._tasks.length === 0) {
            console.log("📋 Chưa có công việc nào.");
            return;
        }
        this._tasks.forEach(task => {
            const status = task.isCompleted ? "Đã hoàn thành" : "Chưa hoàn thành";
            const overdue = task.deadline < new Date() && !task.isCompleted ? "(Quá hạn)" : "";
            console.log(`ID: ${task.id}, Công việc: ${task.title}, Hạn: ${task.deadline.toLocaleDateString()}, Trạng thái: ${status} ${overdue}`);
        });
    }
}
class Main6 {
    constructor() {
        this.manager = new TaskManager();
    }
    start() {
        let running = true;
        while (running) {
            const choice = prompt("Chọn chức năng:\n" +
                "1. Thêm nhân viên mới\n" +
                "2. Thêm công việc mới\n" +
                "3. Gán công việc cho nhân viên\n" +
                "4. Đánh dấu công việc hoàn thành\n" +
                "5. Hiển thị danh sách công việc\n" +
                "6. Dừng chương trình\n");
            switch (choice) {
                case "1":
                    const employeeName = prompt("Nhập tên nhân viên:");
                    if (employeeName)
                        this.manager.addEmployee(employeeName);
                    break;
                case "2":
                    const taskTitle = prompt("Nhập tên công việc:");
                    const taskDeadline = prompt("Nhập hạn hoàn thành (YYYY-MM-DD):");
                    if (taskTitle && taskDeadline)
                        this.manager.addTask(taskTitle, taskDeadline);
                    break;
                case "3":
                    const employeeId = parseInt(prompt("Nhập ID nhân viên:") || "0", 10);
                    const taskId = parseInt(prompt("Nhập ID công việc:") || "0", 10);
                    this.manager.assignTask(employeeId, taskId);
                    break;
                case "4":
                    const completeTaskId = parseInt(prompt("Nhập ID công việc hoàn thành:") || "0", 10);
                    this.manager.completeTask(completeTaskId);
                    break;
                case "5":
                    this.manager.listTasks();
                    break;
                case "6":
                    running = false;
                    console.log("🚪 Đã thoát chương trình.");
                    break;
                default:
                    console.log("⚠️ Lựa chọn không hợp lệ. Vui lòng thử lại.");
            }
        }
    }
}
const app = new Main6();
app.start();
