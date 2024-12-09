function isPalindrome(s: string): boolean{
    // Chuyển đổi chuỗi thành chữ thường và loại bỏ các ký tự không phải chữ hoặc số
    let s1: string = s.toLowerCase().replace(/[^a-z0-9]/g, "");
    let s2: string = s1.split("").reverse().join("");
    return s === s2;
}

console.log(isPalindrome("racecar"));
console.log(isPalindrome("raceacar"));