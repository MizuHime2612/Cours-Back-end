"use strict";
var _a;
let stores = [
    { id: 1, name: "Milk", count: 100 },
    { id: 2, name: "Yakult", count: 100 },
    { id: 3, name: "Butter", count: 100 }
];
let carts = [];
let x = true;
while (x) {
    let action = (_a = prompt("Chọn C/R/U/D/E")) === null || _a === void 0 ? void 0 : _a.toUpperCase();
    if (!action) {
        break;
    }
    switch (action) {
        case "C":
            let productName = prompt("Nhập tên sản phẩm muốn mua");
            if (productName) {
                let store = stores.find(store => store.name.toLowerCase() === productName.toLowerCase());
                if (store && store.count > 0) {
                    let existingCartItem = carts.find(cart => cart.name === store.name);
                    if (existingCartItem) {
                        existingCartItem.count += 1;
                    }
                    else {
                        carts.push({ name: store.name, count: 1 });
                    }
                    store.count -= 1;
                    alert("Stores:\n" + stores.map(s => `${s.name} - Available: ${s.count}`).join("\n") + "\n\nCarts:\n" + carts.map(c => `${c.name} - Quantity: ${c.count}`).join("\n"));
                }
                else {
                    alert("Sản phẩm không có trong kho hoặc đã hết.");
                }
            }
            break;
        case "R":
            alert("Stores:\n" + stores.map(s => `${s.name} - Available: ${s.count}`).join("\n") + "\n\nCarts:\n" + carts.map(c => `${c.name} - Quantity: ${c.count}`).join("\n"));
            break;
        case "U":
            let updateIndex = parseInt(prompt("Nhập vị trí cần sửa trong carts") || "0") - 1;
            if (updateIndex >= 0 && updateIndex < carts.length) {
                let newQuantity = parseInt(prompt("Nhập số lượng mới") || "0");
                let cartItem = carts[updateIndex];
                let storeItem = stores.find(store => store.name === cartItem.name);
                if (storeItem) {
                    let difference = newQuantity - cartItem.count;
                    if (storeItem.count >= difference) {
                        cartItem.count = newQuantity;
                        storeItem.count -= difference;
                        alert("Stores:\n" + stores.map(s => `${s.name} - Available: ${s.count}`).join("\n") + "\n\nCarts:\n" + carts.map(c => `${c.name} - Quantity: ${c.count}`).join("\n"));
                    }
                    else {
                        alert("Số lượng trong kho không đủ.");
                    }
                }
            }
            else {
                alert("Vị trí không hợp lệ.");
            }
            break;
        case "D":
            let deleteIndex = parseInt(prompt("Nhập vị trí của sản phẩm muốn xóa trong carts") || "0") - 1;
            if (deleteIndex >= 0 && deleteIndex < carts.length) {
                let cartItem = carts[deleteIndex];
                let storeItem = stores.find(store => store.name === cartItem.name);
                if (storeItem) {
                    storeItem.count += cartItem.count;
                    carts.splice(deleteIndex, 1);
                    alert("Stores:\n" + stores.map(s => `${s.name} - Available: ${s.count}`).join("\n") + "\n\nCarts:\n" + carts.map(c => `${c.name} - Quantity: ${c.count}`).join("\n"));
                }
            }
            else {
                alert("Vị trí không hợp lệ.");
            }
            break;
        case "E":
            alert("Cảm ơn bạn đã đến với Rikkei Stores");
            x = false;
            break;
        default:
            alert("Lựa chọn không hợp lệ.");
    }
}
