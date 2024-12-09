function reverseArray(arr: number[]): number[] {
    return arr.reverse();
}


const input = prompt("Nhập các số nguyên, cách nhau bởi dấu phẩy: ");
    
if (input) {
    const arr = input.split(',').map(num => parseInt(num.trim(), 10));
    console.log("Mảng ban đầu: ", arr);
    const reversedArr = reverseArray(arr);
        
    console.log("Mảng sau khi đảo ngược: ", reversedArr);
} else {
    console.log("Không có dữ liệu đầu vào.");
}

