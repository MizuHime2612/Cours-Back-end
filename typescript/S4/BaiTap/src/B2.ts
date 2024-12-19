// Ứng dụng tính toán hình học phẳng
class GeometryCalculator {
    // Tính diện tích hình tròn.
    circleArea(radius: number): number {
        return Math.PI * radius * radius;
    }

    // Tính chu vi hình tròn.
    circlePerimeter(radius: number): number {
        return 2 * Math.PI * radius;
    }

    // Tính diện tích hình tam giác.
    triangleArea(base: number, height: number): number {
        return 0.5 * base * height;
    }

    // Tính chu vi tam giác.
    trianglePerimeter(a: number, b: number, c: number): number {
        return a + b + c
    }

    // Tính diện tích hình chữ nhật.
    rectangleArea(width: number, height: number): number {
        return width * height;
    }

    // Tính chu vi hình chữ nhật.
    rectanglePerimeter(width: number, height: number): number{
        return 2 * (width + height);
    }

    // Tính diện tích hình bình hành.
    parallelogramArea(base: number, height: number): number{
        return base * height;
    }

    // Tính chu vi hình bình hành.
    parallelogramPerimeter(a: number, b: number): number {
        return 2 * (a + b);
    }

    // Tính diện tích hình thoi.
    rhombusArea(d1: number, d2: number): number {
        return 0.5 * d1 * d2;
    }

    // Tính chu vi hình thoi.
    rhombusPerimeter(side: number): number {
        return 4 * side;
    }
}

class Main2 {
    static geometryCalculator: GeometryCalculator = new GeometryCalculator();

    static start(): void {
        let running = true;

        while (running) {
            let choice = prompt(
                "Chọn chức năng:\n" +
                "1. Tính diện tích và chu vi hình tròn\n" +
                "2. Tính diện tích và chu vi hình tam giác\n" +
                "3. Tính diện tích và chu vi hình chữ nhật\n" +
                "4. Tính diện tích và chu vi hình bình hành\n" +
                "5. Tính diện tích và chu vi hình thoi\n" +
                "6. Dừng chương trình\n"
            );
            switch (choice) {
                case "1": {
                    let radius = Number(prompt("Nhập bán kính hình tròn:"));
                    console.log(`Diện tích hình tròn có bán kính = ${radius} là: ${this.geometryCalculator.circleArea(radius)}`);
                    console.log(`Chu vi hình tròn có bán kính = ${radius} là: ${this.geometryCalculator.circlePerimeter(radius)}`);
                    break;
                }
                case "2": {
                    let base = Number(prompt("Nhập đáy hình tam giác:"));
                    let height = Number(prompt("Nhập chiều cao hình tam giác:"));
                    console.log(`Diện tích hình tam giác có đáy = ${base} và chiều cao = ${height} là: ${this.geometryCalculator.triangleArea(base, height)}`);
                    let a = Number(prompt("Nhập cạnh thứ nhất của tam giác:"));
                    let b = Number(prompt("Nhập cạnh thứ hai của tam giác:"));
                    let c = Number(prompt("Nhập cạnh thứ ba của tam giác:"));
                    console.log(`Chu vi hình tam giác có 3 cạnh = ${a}, ${b}, ${c} là: ${this.geometryCalculator.trianglePerimeter(a, b, c)}`);
                    break;
                }
                case "3": {
                    let width = Number(prompt("Nhập chiều rộng hình chữ nhật:"));
                    let height = Number(prompt("Nhập chiều cao hình chữ nhật:"));
                    console.log(`Diện tích hình chữ nhật có chiều rộng = ${width} và chiều dài = ${height} là: ${this.geometryCalculator.rectangleArea(width, height)}`);
                    console.log(`Chu vi hình chữ nhật có chiều rộng = ${width} và chiều dài = ${height} là: ${this.geometryCalculator.rectanglePerimeter(width, height)}`);
                    break;
                }
                case "4": {
                    let base = Number(prompt("Nhập đáy hình bình hành:"));
                    let height = Number(prompt("Nhập chiều cao hình bình hành:"));
                    console.log(`Diện tích hình bình hành có đáy = ${base} và chiều cao = ${height} là: ${this.geometryCalculator.parallelogramArea(base, height)}`);
                    let a = Number(prompt("Nhập cạnh thứ nhất của hình bình hành:"));
                    let b = Number(prompt("Nhập cạnh thứ hai của hình bình hành:"));
                    console.log(`Chu vi hình bình hành có 2 cạnh = ${a}, ${b} là: ${this.geometryCalculator.parallelogramPerimeter(a, b)}`);
                    break;
                }
                case "5": {
                    let d1 = Number(prompt("Nhập đường chéo thứ nhất của hình thoi:"));
                    let d2 = Number(prompt("Nhập đường chéo thứ hai của hình thoi:"));
                    console.log(`Diện tích hình thoi có đường chéo thứ nhất = ${d1} và đường chéo thứ 2 = ${d2} là: ${this.geometryCalculator.rhombusArea(d1, d2)}`);
                    let side = Number(prompt("Nhập cạnh hình thoi:"));
                    console.log(`Chu vi hình thoi có cạnh = ${side} là: ${this.geometryCalculator.rhombusPerimeter(side)}`);
                    break;
                }
                case "6": {
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

Main2.start();