#chọn tất cả các cột từ bảng “Books”
SELECT * FROM Books;
#chọn tên sách và tác giả của những cuốn sách có giá lớn hơn 50
SELECT Title, Author
FROM Books
WHERE Price > 50;
