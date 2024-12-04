function sum1(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? parseFloat(n1) : n1;
    let number2 = typeof n2 === 'string' ? parseFloat(n2) : n2;
    if(isNaN(number1) || isNaN(number2))
        return "không hợp lệ";
    return number1 + number2;
}

function signal1(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? parseFloat(n1) : n1;
    let number2 = typeof n2 === 'string' ? parseFloat(n2) : n2;
    if(isNaN(number1) || isNaN(number2))
        return "không hợp lệ";
    return number1 - number2;
}

function multiply1(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? parseFloat(n1) : n1;
    let number2 = typeof n2 === 'string' ? parseFloat(n2) : n2;
    if(isNaN(number1) || isNaN(number2))
        return "không hợp lệ";
    return number1 * number2;
}

function divide1(n1: number | string, n2: number | string): number | string{
    let number1 = typeof n1 === 'string' ? parseFloat(n1) : n1;
    let number2 = typeof n2 === 'string' ? parseFloat(n2) : n2;
    if (isNaN(number1) || isNaN(number2)) {
      return "Không hợp lệ";
    }
    
    if (number2 === 0) {
      return "Không thể chia cho 0";
    }
    
    return number1 / number2;
}

function power(n1: number | string, n2: number | string): number | string {
    let base = typeof n1 === 'string' ? parseFloat(n1) : n1;
    let exponent = typeof n2 === 'string' ? parseFloat(n2) : n2;
  
    if (isNaN(base) || isNaN(exponent)) {
      return "Không hợp lệ, không thể chuyển đổi thành số";
    }
  
    return Math.pow(base, exponent);
}

function factorial(n: number | string): number | string {
    let num = typeof n === 'string' ? parseFloat(n) : n;
  
    if (isNaN(num) || num < 0 || num % 1 !== 0) {
      return "Không hợp lệ, số phải là số nguyên không âm";
    }
  
    let result = 1;
    for (let i = 1; i <= num; i++) {
      result *= i;
    }
    return result;
}

function nthRoot(n1: number | string, n2: number | string): number | string {
    let base = typeof n1 === 'string' ? parseFloat(n1) : n1;
    let root = typeof n2 === 'string' ? parseFloat(n2) : n2;
  
    if (isNaN(base) || isNaN(root) || root <= 0) {
      return "Không hợp lệ, căn bậc phải là số dương";
    }
  
    return Math.pow(base, 1 / root);
}

function calculate(operation: string) {
    let num1: string = (document.getElementById("num1") as HTMLInputElement).value;
    let num2: string = (document.getElementById("num2") as HTMLInputElement).value;

    let result: number | string = "";

    switch (operation) {
        case 'sum':
            result = sum1(num1, num2);
            break;
        case 'subtract':
            result = signal1(num1, num2);
            break;
        case 'multiply':
            result = multiply1(num1, num2);
            break;
        case 'divide':
            result = divide1(num1, num2);
            break;
        case 'power':
            result = power(num1, num2);
            break;
        case 'factorial1':
            result = factorial(num1);
            break;
        case 'factorial2':
            result = factorial(num2);
            break;
        case 'nthRoot':
            result = nthRoot(num1, num2);
            break;
    }

    document.getElementById("result")!.innerText = "Kết quả: " + result;
}