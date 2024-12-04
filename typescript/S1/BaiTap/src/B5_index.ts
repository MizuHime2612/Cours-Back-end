function sum(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? Number(n1) : n1;
    let number2 = typeof n2 === 'string' ? Number(n2) : n2;
    if(isNaN(number1) || isNaN(number2))
        return "không hợp lệ";
    return number1 + number2;
}

function signal(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? Number(n1) : n1;
    let number2 = typeof n2 === 'string' ? Number(n2) : n2;
    if(isNaN(number1) || isNaN(number2))
        return "không hợp lệ";
    return number1 - number2;
}

function multiply(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? Number(n1) : n1;
    let number2 = typeof n2 === 'string' ? Number(n2) : n2;
    if(isNaN(number1) || isNaN(number2))
        return "không hợp lệ";
    return number1 * number2;
}

function divide(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? Number(n1) : n1;
    let number2 = typeof n2 === 'string' ? Number(n2) : n2;
    if (isNaN(number1) || isNaN(number2)) {
      return "Không hợp lệ";
    }
    
    if (number2 === 0) {
      return "Không thể chia cho 0";
    }
    
    return number1 / number2;
}

let n1: number | string = prompt("Nhập số thứ nhất:") || "";
let n2: number | string = prompt("Nhập số thứ hai:") || "";
console.log("Tổng: " + sum(n1, n2));
console.log("Hiệu: " + signal(n1, n2));
console.log("Tích: " + multiply(n1, n2));
console.log("Thương: " +divide(n1, n2));