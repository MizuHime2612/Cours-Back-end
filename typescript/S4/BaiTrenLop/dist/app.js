"use strict";
class Todo {
    constructor(id, content, status = false) {
        this.id = id;
        this.content = content;
        this.status = status;
    }
    toString() {
        const statusText = this.status ? "Hoàn thành" : "Chưa hoàn thành";
        return `ID: ${this.id}, Nội dung: ${this.content}, Trạng thái: ${statusText}`;
    }
}
class TodoListManager {
    constructor() {
        this.todos = [];
        this.currentId = 1;
    }
    addTodo(content) {
        if (content.trim() === "") {
            console.log("⚠️ Nội dung không được để trống.");
            return;
        }
        const todo = new Todo(this.currentId++, content);
        this.todos.push(todo);
        console.log(`✅ Đã thêm: ${todo.toString()}`);
    }
    removeTodo(index) {
        if (index < 0 || index >= this.todos.length) {
            console.log("⚠️ Vị trí không hợp lệ.");
            return;
        }
        const removed = this.todos.splice(index, 1)[0];
        console.log(`🗑️ Đã xóa: ${removed.toString()}`);
    }
    updateTodo(index, content) {
        if (index < 0 || index >= this.todos.length) {
            console.log("⚠️ Vị trí không hợp lệ.");
            return;
        }
        if (content.trim() === "") {
            console.log("⚠️ Nội dung không được để trống.");
            return;
        }
        const todo = this.todos[index];
        console.log(`✏️ Đã cập nhật: "${todo.content}" thành "${content}"`);
        todo.content = content;
    }
    sortTodos() {
        this.todos.sort((a, b) => a.content.localeCompare(b.content));
        console.log("📋 Danh sách công việc đã sắp xếp theo alphabet:");
        this.listTodos();
    }
    findTodo(content) {
        const index = this.todos.findIndex(todo => todo.content.includes(content));
        if (index !== -1) {
            console.log(`🔍 Tìm thấy tại vị trí ${index}: ${this.todos[index].toString()}`);
        }
        else {
            console.log("⚠️ Không tìm thấy công việc.");
        }
    }
    listTodos() {
        if (this.todos.length === 0) {
            console.log("📂 Danh sách công việc trống.");
        }
        else {
            this.todos.forEach(todo => console.log(todo.toString()));
        }
    }
}
class Main {
    constructor() {
        this.manager = new TodoListManager();
    }
    start() {
        let running = true;
        while (running) {
            const choice = prompt("Chọn chức năng:\n" +
                "1. In danh sách công việc\n" +
                "2. Thêm công việc\n" +
                "3. Xóa công việc\n" +
                "4. Sửa công việc\n" +
                "5. Sắp xếp công việc\n" +
                "6. Tìm kiếm công việc\n" +
                "7. Dừng chương trình\n");
            switch (choice) {
                case "1":
                    this.manager.listTodos();
                    break;
                case "2":
                    const addContent = prompt("Nhập nội dung công việc cần thêm:");
                    if (addContent)
                        this.manager.addTodo(addContent);
                    break;
                case "3":
                    const removeIndex = parseInt(prompt("Nhập vị trí cần xóa:") || "-1", 10);
                    this.manager.removeTodo(removeIndex);
                    break;
                case "4":
                    const updateIndex = parseInt(prompt("Nhập vị trí cần sửa:") || "-1", 10);
                    const updateContent = prompt("Nhập nội dung mới:");
                    if (updateContent)
                        this.manager.updateTodo(updateIndex, updateContent);
                    break;
                case "5":
                    this.manager.sortTodos();
                    break;
                case "6":
                    const searchContent = prompt("Nhập nội dung cần tìm:");
                    if (searchContent)
                        this.manager.findTodo(searchContent);
                    break;
                case "7":
                    running = false;
                    console.log("🚪 Đã thoát chương trình.");
                    break;
                default:
                    console.log("⚠️ Lựa chọn không hợp lệ. Vui lòng thử lại.");
            }
        }
    }
}
const app = new Main();
app.start();
