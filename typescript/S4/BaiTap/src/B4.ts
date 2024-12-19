// Ứng dụng quản lý cửa hàng băng đĩa
class CD {
    id: number;
    title: string;
    artist: string;
    year: number;

    constructor(id: number, title: string, artist: string, year: number){
        this.id = id;
        this.title = title;
        this.artist = artist;
        this.year = year
    }
}

class CDStoreManager {
    cds: CD[] = [];

    addCD(title: string, artist: string, year: number): void {
        const id = this.cds.length > 0 ? this.cds[this.cds.length - 1].id + 1 : 1;
        const newCD = new CD(id, title, artist, year);
        this.cds.push(newCD);
        console.log("🎶 CD đã được thêm vào cửa hàng.");
    }

    listCDs(): void {
        if (this.cds.length === 0) {
            console.log("⚠️ Cửa hàng chưa có CD nào.");
        } else {
            console.log("🎶 Danh sách CD trong cửa hàng:");
            this.cds.forEach(cd => {
                console.log(`${cd.id}. Tên CD: ${cd.title}, Nghệ sĩ: ${cd.artist}, Năm phát hành: ${cd.year}`);
            });
        }
    }

    removeCD(id: number): void {
        const index = this.cds.findIndex(cd => cd.id === id);
        if (index !== -1) {
            this.cds.splice(index, 1);
            console.log("🎶 CD đã được xóa khỏi cửa hàng.");
        } else {
            console.log("⚠️ Không tìm thấy CD với mã này.");
        }
    }

    searchCD(title: string): void {
        const foundCDs = this.cds.filter(cd => cd.title.toLowerCase().includes(title.toLowerCase()));
        if (foundCDs.length > 0) {
            console.log("🎶 Kết quả tìm kiếm:");
            foundCDs.forEach(cd => {
                console.log(`${cd.id}. Tên CD: ${cd.title}, Nghệ sĩ: ${cd.artist}, Năm phát hành: ${cd.year}`);
            });
        } else {
            console.log("⚠️ Không tìm thấy CD nào với tên này.");
        }
    }
}

class Main4 {
    static cdStoreManager: CDStoreManager = new CDStoreManager();

    static start(): void {
        let running = true;

        while (running) {
            let choice = prompt(
                "Chọn chức năng:\n" +
                "1. Thêm CD vào cửa hàng\n" +
                "2. Hiển thị danh sách CD\n" +
                "3. Xóa CD theo mã CD\n" +
                "4. Tìm kiếm CD theo tên\n" +
                "5. Dừng chương trình\n"
            );

            switch (choice) {
                case "1": {
                    let title = prompt("Nhập tên CD:");
                    let artist = prompt("Nhập nghệ sĩ biểu diễn:");
                    let year = Number(prompt("Nhập năm phát hành:"));
                    if (title && artist && !isNaN(year)) {
                        this.cdStoreManager.addCD(title, artist, year);
                    } else {
                        console.log("⚠️ Thông tin CD không hợp lệ.");
                    }
                    break;
                }
                case "2": {
                    this.cdStoreManager.listCDs();
                    break;
                }
                case "3": {
                    let id = Number(prompt("Nhập mã CD cần xóa:"));
                    if (!isNaN(id)) {
                        this.cdStoreManager.removeCD(id);
                    } else {
                        console.log("⚠️ Mã CD không hợp lệ.");
                    }
                    break;
                }
                case "4": {
                    let title = prompt("Nhập tên CD cần tìm:");
                    if (title) {
                        this.cdStoreManager.searchCD(title);
                    } else {
                        console.log("⚠️ Tên CD không hợp lệ.");
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

Main4.start();