let numbers: number[] = [];

for (let i = 0; i < 10; i++) {
    let input = prompt(`Nhập phần tử thứ ${i + 1}:`);
    if (input !== null) {
        numbers.push(Number(input));
    }
}

let count = numbers.filter(num => num >= 10).length;

console.log(`Mảng: [${numbers.join(", ")}]`);
console.log(`Có ${count} số nguyên lớn hơn hoặc bằng 10.`);