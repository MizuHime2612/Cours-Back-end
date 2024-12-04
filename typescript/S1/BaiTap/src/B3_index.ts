//concatenate the string and capitalize the first character
let firstName: string = "Vũ";
let lastName: string = "Hà trang";
let fullName:string = firstName.charAt(0).toUpperCase() + firstName.slice(1) + " " + lastName.charAt(0).toUpperCase() + lastName.slice(1);
console.log(fullName);