"use strict";
// Ứng dụng quản lý thư viện sách
class Book {
    constructor(id, title, author, year) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.year = year;
    }
}
class LibraryManager {
    constructor() {
        this.books = [];
    }
    addBook(title, author, year) {
        let id = this.books.length > 0 ? this.books[this.books.length - 1].id + 1 : 1;
        let newBook = new Book(id, title, author, year);
        this.books.push(newBook);
        console.log("📚 Sách đã được thêm vào thư viện.");
    }
    listBooks() {
        if (this.books.length === 0) {
            console.log("⚠️ Thư viện chưa có sách nào.");
        }
        else {
            console.log("📚 Danh sách sách trong thư viện:");
            this.books.forEach(book => {
                console.log(`${book.id}. Tên sách: ${book.title}, Tác giả: ${book.author}, Năm xuất bản: ${book.year}`);
            });
        }
    }
    removeBook(id) {
        const index = this.books.findIndex(book => book.id === id);
        if (index !== -1) {
            this.books.splice(index, 1);
            console.log("📚 Sách đã được xóa khỏi thư viện.");
        }
        else {
            console.log("⚠️ Không tìm thấy sách với mã này.");
        }
    }
    searchBook(title) {
        const foundBooks = this.books.filter(book => book.title.toLowerCase().includes(title.toLowerCase()));
        if (foundBooks.length > 0) {
            console.log("📚 Kết quả tìm kiếm:");
            foundBooks.forEach(book => {
                console.log(`${book.id}. Tên sách: ${book.title}, Tác giả: ${book.author}, Năm xuất bản: ${book.year}`);
            });
        }
        else {
            console.log("⚠️ Không tìm thấy sách nào với tên này.");
        }
    }
}
class Main3 {
    static start() {
        let running = true;
        while (running) {
            let choice = prompt("Chọn chức năng:\n" +
                "1. Thêm sách vào thư viện\n" +
                "2. Hiển thị danh sách sách\n" +
                "3. Xóa sách theo mã sách\n" +
                "4. Tìm kiếm sách theo tên\n" +
                "5. Dừng chương trình\n");
            switch (choice) {
                case "1": {
                    let title = prompt("Nhập tên sách:");
                    let author = prompt("Nhập tên tác giả:");
                    let year = Number(prompt("Nhập năm xuất bản:"));
                    if (title && author && !isNaN(year)) {
                        this.libraryManager.addBook(title, author, year);
                    }
                    else {
                        console.log("⚠️ Thông tin sách không hợp lệ.");
                    }
                    break;
                }
                case "2": {
                    this.libraryManager.listBooks();
                    break;
                }
                case "3": {
                    let id = Number(prompt("Nhập mã sách cần xóa:"));
                    if (!isNaN(id)) {
                        this.libraryManager.removeBook(id);
                    }
                    else {
                        console.log("⚠️ Mã sách không hợp lệ.");
                    }
                    break;
                }
                case "4": {
                    let title = prompt("Nhập tên sách cần tìm:");
                    if (title) {
                        this.libraryManager.searchBook(title);
                    }
                    else {
                        console.log("⚠️ Tên sách không hợp lệ.");
                    }
                    break;
                }
                case "5": {
                    running = false;
                    console.log("🚪 Đã thoát chương trình.");
                    break;
                }
                default: {
                    console.log("⚠️ Lựa chọn không hợp lệ. Vui lòng thử lại.");
                }
            }
        }
    }
}
Main3.libraryManager = new LibraryManager();
Main3.start();
