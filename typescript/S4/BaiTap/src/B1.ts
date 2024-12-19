// Máy tính cầm tay
class Calculator {
    // Tính tổng hai số
    add(a: number, b: number): number {
        return a + b;
    }

    // Tính hiệu hai số
    subtract(a: number, b: number): number {
        return a - b;
    }

    // Tính tích hai số
    multiply(a: number, b: number): number {
        return a * b;
    }

    // Tính thương hai số (tránh chia cho 0)
    divide(a: number, b: number): number {
        if (b === 0) {
            throw new Error("Không thể chia cho 0.");
        }
        return a / b;
    }
}

class Main1 {
    static calculator: Calculator = new Calculator();

    static start(): void {
        let running = true;

        while (running) {
            let choice = prompt(
                "Chọn chức năng:\n" +
                "1. Cộng hai số\n" +
                "2. Trừ hai số\n" +
                "3. Nhân hai số\n" +
                "4. Chia hai số\n" +
                "5. Thoát chương trình\n"
            );

            switch (choice) {
                case "1": {
                    let a = Number(prompt("Nhập số thứ nhất:"));
                    let b = Number(prompt("Nhập số thứ hai:"));
                    console.log(`${a} + ${b} = ${this.calculator.add(a, b)}`);
                    break; // thêm break để không tiếp tục vào các case sau
                }
                case "2": {
                    let a = Number(prompt("Nhập số thứ nhất:"));
                    let b = Number(prompt("Nhập số thứ hai:"));
                    console.log(`${a} - ${b} = ${this.calculator.subtract(a, b)}`);
                    break;
                }
                case "3": {
                    let a = Number(prompt("Nhập số thứ nhất:"));
                    let b = Number(prompt("Nhập số thứ hai:"));
                    console.log(`${a} * ${b} = ${this.calculator.multiply(a, b)}`); // sửa lỗi gọi phương thức multiply
                    break;
                }
                case "4": {
                    let a = Number(prompt("Nhập số thứ nhất:"));
                    let b = Number(prompt("Nhập số thứ hai:"));
                    try {
                        console.log(`${a} / ${b} = ${this.calculator.divide(a, b)}`);
                    } catch (error) {
                        console.error((error as Error).message);
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
                    break;
                }
            }
        }
    }
}

Main1.start();