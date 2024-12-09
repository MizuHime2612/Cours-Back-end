function twoSum(num: number[], target: number): number[] {
    for (let i = 0; i < num.length; i++) {
        for (let j = i + 1; j < num.length; j++) {
            if (num[i] + num[j] === target) {
                console.log(`Mảng ban đầu: [${num}]`);
                return [i, j];
            }
        }
    }
    console.log(`Mảng ban đầu: [${num}]`);
    console.log("Không tìm thấy cặp số hợp lệ!");
    return [];
}

console.log(twoSum([2, 7, 11, 15], 9));
console.log(twoSum([3, 2, 4], 6));
console.log(twoSum([3, 2, 4], 10));