function nhapMang() {
    let n = parseInt(prompt("Nhap so phan tu mang:"));
    let arr = [];
    for(let i = 0; i < n; i++){
        let so = parseInt(prompt(`Nhap gia tri phan tu ${i+1}: `));
        arr.push(so); 
    }
    return arr;
}
function timMax(arr){
    if(arr.length === 0){
        return "Mang rong";
    }
    let max = arr[0];
    for(let i=1; i<arr.length; i++){
        if(arr[i] > max){
            max = arr[i];
        }
    }
    return max;
}
let arr = nhapMang();
console.log("Mang da nhap: " + arr);
console.log("So lon nhat: " + timMax(arr));
