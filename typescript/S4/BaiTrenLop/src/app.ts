class Todo {
    private _id: number;
    private _content: string;
    private _status: boolean;

    constructor(id: number, content: string, status: boolean = false) {
        this._id = id;
        this._content = content;
        this._status = status;
    }

    get id(): number {
        return this._id;
    }

    get content(): string {
        return this._content;
    }
    set content(value: string) {
        if (!value.trim()) {
            throw new Error("Nội dung không được để trống.");
        }
        this._content = value;
    }

    get status(): boolean {
        return this._status;
    }
    set status(value: boolean) {
        this._status = value;
    }

    toString(): string {
        return `ID: ${this._id}, Nội dung: "${this._content}", Trạng thái: ${this._status ? "Hoàn thành" : "Chưa hoàn thành"}`;
    }
}

class TodoListManager {
    private _todos: Todo[] = [];

    addTodo(content: string): void {
        const id = this._todos.length > 0 ? this._todos[this._todos.length - 1].id + 1 : 1;
        const todo = new Todo(id, content);
        this._todos.push(todo);
        console.log(`✅ Đã thêm công việc: ${todo.toString()}`);
    }

    removeTodo(index: number): void {
        if (index < 0 || index >= this._todos.length) {
            console.log("⚠️ Vị trí không hợp lệ.");
            return;
        }
        const removed = this._todos.splice(index, 1)[0];
        console.log(`🗑️ Đã xóa công việc: ${removed.toString()}`);
    }

    updateTodo(index: number, content: string): void {
        if (index < 0 || index >= this._todos.length) {
            console.log("⚠️ Vị trí không hợp lệ.");
            return;
        }
        const todo = this._todos[index];
        console.log(`✏️ Đã cập nhật công việc: "${todo.content}" thành "${content}"`);
        todo.content = content;
    }

    sortTodos(): void {
        this._todos.sort((a, b) => a.content.localeCompare(b.content));
        console.log("📋 Danh sách công việc đã sắp xếp:");
        this.listTodos();
    }

    findTodo(content: string): void {
        const foundTodos = this._todos.filter(todo => todo.content.toLowerCase().includes(content.toLowerCase()));
        if (foundTodos.length > 0) {
            console.log("🔍 Các công việc tìm thấy:");
            foundTodos.forEach(todo => console.log(todo.toString()));
        } else {
            console.log("⚠️ Không tìm thấy công việc nào.");
        }
    }

    listTodos(): void {
        if (this._todos.length === 0) {
            console.log("📂 Danh sách trống.");
        } else {
            this._todos.forEach((todo, index) => {
                console.log(`${index + 1}. ${todo.toString()}`);
            });
        }
    }
}

class Main {
    private _manager: TodoListManager = new TodoListManager();

    start(): void {
        console.log("📝 Quản lý danh sách công việc bắt đầu...");
        let running = true;

        while (running) {
            const choice = prompt(
                "Chọn chức năng:\n" +
                "1. In danh sách công việc\n" +
                "2. Thêm công việc\n" +
                "3. Xóa công việc\n" +
                "4. Sửa công việc\n" +
                "5. Sắp xếp công việc\n" +
                "6. Tìm kiếm công việc\n" +
                "7. Dừng chương trình\n"
            );

            switch (choice) {
                case "1":
                    this._manager.listTodos();
                    break;
                case "2":
                    const addContent = prompt("Nhập nội dung công việc cần thêm:");
                    if (addContent) this._manager.addTodo(addContent);
                    break;
                case "3":
                    const removeIndex = parseInt(prompt("Nhập vị trí cần xóa:") || "-1", 10);
                    if (!isNaN(removeIndex)) this._manager.removeTodo(removeIndex - 1);
                    break;
                case "4":
                    const updateIndex = parseInt(prompt("Nhập vị trí cần sửa:") || "-1", 10);
                    const updateContent = prompt("Nhập nội dung mới:");
                    if (!isNaN(updateIndex) && updateContent) this._manager.updateTodo(updateIndex - 1, updateContent);
                    break;
                case "5":
                    this._manager.sortTodos();
                    break;
                case "6":
                    const searchContent = prompt("Nhập nội dung cần tìm:");
                    if (searchContent) this._manager.findTodo(searchContent);
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