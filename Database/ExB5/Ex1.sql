USE ExB5;

-- Ex2
ALTER TABLE building
ADD FOREIGN KEY (host_id) REFERENCES host(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE building
ADD FOREIGN KEY (contractor_id) REFERENCES contractor(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE design
ADD FOREIGN KEY (building_id) REFERENCES building(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE design
ADD FOREIGN KEY (architect_id) REFERENCES architect(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE work
ADD FOREIGN KEY (building_id) REFERENCES building(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE work
ADD FOREIGN KEY (worker_id) REFERENCES worker(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Ex3
-- Hiển thị thông tin công trình có chi phí cao nhất
SELECT MAX(cost) FROM building;

-- Hiển thị thông tin công trình có chi phí lớn hơn tất cả các công trình được xây dựng ở Cần Thơ
SELECT * FROM building
WHERE city <> "can tho" AND cost > ALL(
	SELECT cost FROM building
    WHERE city = 'can tho'
);
-- Hiển thị thông tin công trình có chi phí lớn hơn một trong các công trình được xây dựng ở Cần Thơ
SELECT * FROM building
WHERE city <> "can tho" AND cost > SOME(
	SELECT cost 
    FROM building
    WHERE city = 'can tho'
);
-- Hiển thị thông tin công trình chưa có kiến trúc sư thiết kế
SELECT b.* 
FROM building b
LEFT JOIN 
	design d ON b.id = d.building_id
WHERE d.architect_id IS NULL;

-- Hiển thị thông tin các kiến trúc sư cùng năm sinh và cùng thanh pho
SELECT * 
FROM architect
WHERE (birthday, place) IN (
    SELECT 
		birthday, 
        place
    FROM architect
    GROUP BY birthday, place
    HAVING COUNT(*) > 1
)
ORDER BY birthday, place;

--  Ex4
-- Hiển thị thù lao trung bình của từng kiến trúc sư
SELECT 
	architect_id, 
    AVG(benefit) AS avg_benefit
FROM design
GROUP BY architect_id;

-- Hiển thị chi phí đầu tư cho các công trình ở mỗi thành phố
SELECT 
	city, 
    SUM(cost) AS sum_cost
FROM building
GROUP BY city;

-- Tìm các công trình có chi phí trả cho kiến trúc sư lớn hơn 50
SELECT 
	d.architect_id,
    b.id AS BuildingID,
    b.name AS BuildingName,
    b.city,
    d.benefit
FROM building b
JOIN 
	design d ON b.id = d.building_id
WHERE d.benefit >50;

-- Tìm các thành phố có ít nhất một kiến trúc sư tốt nghiệp
SELECT 
	DISTINCT place AS City
FROM architect
WHERE place IS NOT NULL;

-- Ex5
-- Hiển thị tên công trình, tên chủ nhân và tên chủ thầu của công trình đó
SELECT 
    b.name AS BuildingName,
    h.name AS HostName,
    c.name AS ContractorName
FROM 
	building b
JOIN 
	host h ON b.host_id = h.id
JOIN 
    contractor c ON b.contractor_id = c.id;

-- Hiển thị tên công trình (building), tên kiến trúc sư (architect) và thù lao của kiến trúc sư ở mỗi công trình (design)
SELECT 
    b.name AS BuildingName,
    a.name AS ArchitectName,
    d.benefit AS Benefit
FROM 
    design d
JOIN 
    building b ON d.building_id = b.id
JOIN 
    architect a ON d.architect_id = a.id;
    
-- Hãy cho biết tên và địa chỉ công trình (building) do chủ thầu Công ty xây dựng số 6 thi công (contractor)
SELECT 
    b.name AS BuildingName,
    b.address AS BuildingAddress
FROM building b
JOIN 
    contractor c ON b.contractor_id = c.id
WHERE c.name = 'cty xd so 6';

-- Tìm tên và địa chỉ liên lạc của các chủ thầu (contractor) thi công công trình ở Cần Thơ (building) do kiến trúc sư Lê Kim Dung thiết kế (architect, design)
SELECT 
    c.name AS ContractorName,
    c.address AS ContractorAddress
FROM building b
JOIN 
    contractor c ON b.contractor_id = c.id
JOIN 
    design d ON b.id = d.building_id
JOIN 
    architect a ON d.architect_id = a.id
WHERE b.city = 'can tho' AND a.name = 'le kim dung';

-- Hãy cho biết nơi tốt nghiệp của các kiến trúc sư (architect) đã thiết kế (design) công trình Khách Sạn Quốc Tế ở Cần Thơ (building)
SELECT a.place
FROM design d
JOIN 
    building b ON d.building_id = b.id
JOIN 
    architect a ON d.architect_id = a.id
WHERE b.name = 'khach san quoc te';
    
-- Cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyên môn hàn hoặc điện (worker) đã tham gia các công trình (work) mà chủ thầu Lê Văn Sơn (contractor) đã trúng thầu (building)
SELECT 
    w.name AS WorkerName,
    w.birthday AS WorkerBirthday,
    w.year AS WorkerStartYear
FROM worker w
JOIN 
    work wo ON w.id = wo.worker_id
JOIN 
    building b ON wo.building_id = b.id
JOIN 
    contractor c ON b.contractor_id = c.id
WHERE (w.skill = 'han' OR w.skill = 'dien') 
    AND c.name = 'le van son';

-- Những công nhân nào (worker) đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ (building) trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994 (work) số ngày tương ứng là bao nhiêu
SELECT 
    w.name AS WorkerName,
    DATEDIFF(wo.date, '1994-12-15') + 1 AS DaysOnSite
FROM worker w
JOIN 
    work wo ON w.id = wo.worker_id
JOIN 
    building b ON wo.building_id = b.id
WHERE b.name = 'khach san quoc te' 
    AND b.city = 'can tho'
    AND wo.date BETWEEN '1994-12-15' AND '1994-12-31';

-- Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP Hồ Chí Minh (architect) và đã thiết kế ít nhất một công trình (design) có kinh phí đầu tư trên 400 triệu đồng (building)
SELECT 
	a.name,
	a.birthday
FROM design d
JOIN 
    building b ON d.building_id = b.id
JOIN 
    architect a ON d.architect_id = a.id
WHERE a.place = 'tp hcm' AND b.cost > 400;

-- Cho biết tên công trình có kinh phí cao nhất
SELECT name 
FROM building 
WHERE cost = (
	SELECT MAX(cost) FROM building
);

-- Cho biết tên các kiến trúc sư (architect) vừa thiết kế các công trình (design) do Phòng dịch vụ sở xây dựng (contractor) thi công vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công
SELECT DISTINCT a.name 
FROM architect a
JOIN 
	design d1 ON a.id = d1.architect_id
JOIN 
	building b1 ON b1.id = d1.building_id
JOIN 
	contractor c1 ON b1.contractor_id = c1.id
WHERE c1.name = 'phong dich vu so xd'
	AND a.id IN(
		SELECT a2.id 
        FROM architect a2
		JOIN 
			design d2 ON a2.id = d2.architect_id
		JOIN 
			building b2 ON b2.id = d2.building_id
		JOIN 
			contractor c2 ON b2.contractor_id = c2.id
		WHERE c2.name = 'le van son'
);

-- Cho biết họ tên các công nhân (worker) có tham gia (work) các công trình ở Cần Thơ (building) nhưng không có tham gia công trình ở Vĩnh Long
SELECT DISTINCT w.name
FROM worker w
JOIN 
	work wk ON w.id = wk.worker_id
JOIN 
	building b ON wk.building_id = b.id
WHERE b.city = 'can tho'
	AND w.id NOT IN(
    SELECT wk2.worker_id
    FROM work wk2
    JOIN 
		building b2 ON wk2.building_id = b2.id
    WHERE b2.city = 'vinh long'
);

-- Cho biết tên của các chủ thầu đã thi công các công trình có kinh phí lớn hơn tất cả các công trình do chủ thầu phòng Dịch vụ Sở xây dựng thi công
SELECT DISTINCT c.name
FROM contractor c
JOIN 
	building b ON c.id = b.contractor_id
WHERE b.cost > (
    SELECT MAX(b2.cost)
    FROM building b2
    JOIN 
		contractor c2 ON b2.contractor_id = c2.id
    WHERE c2.name = 'phong dich vu so xd'
);

-- Cho biết họ tên các kiến trúc sư có thù lao thiết kế một công trình nào đó dưới giá trị trung bình thù lao thiết kế cho một công trình
SELECT DISTINCT a.name
FROM architect a
JOIN 
	design d ON a.id = d.architect_id
WHERE d.benefit < (
	SELECT AVG(benefit) FROM design
);

-- Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất
SELECT 
	c.name AS ContractorName, 
    c.address AS ContractorAddress
FROM contractor c
JOIN 
	building b ON c.id = b.contractor_id
WHERE b.cost = (
	SELECT MIN(cost) FROM building
);

-- Tìm họ tên và chuyên môn của các công nhân (worker) tham gia (work) các công trình do kiến trúc sư Le Thanh Tung thiet ke (architect) (design)
SELECT 
	w.name AS WorkerName, 
	w.skill AS WorkerSkill
FROM worker w
JOIN 
	work wr ON w.id = wr.worker_id
JOIN 
	building b ON wr.building_id = b.id
JOIN 
	design d ON b.id = d.building_id
JOIN 
	architect a ON d.architect_id = a.id
WHERE a.name = 'le thanh tung';

-- Tìm các cặp tên của chủ thầu có trúng thầu các công trình tại cùng một thành phố
SELECT 
	DISTINCT c1.name AS contractor1, 
    c2.name AS contractor2, 
    b1.city
FROM building b1
JOIN 
	building b2 ON b1.city = b2.city 
    AND b1.contractor_id < b2.contractor_id
JOIN 
	contractor c1 ON b1.contractor_id = c1.id
JOIN 
	contractor c2 ON b2.contractor_id = c2.id;

-- Tìm tổng kinh phí của tất cả các công trình theo từng chủ thầu
SELECT 
    c.name AS ContractorName, 
    SUM(b.cost) AS TotalCost
FROM contractor c
JOIN 
    building b ON c.id = b.contractor_id
GROUP BY c.name;

-- Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT 
	a.name, 
    SUM(d.benefit) AS total_benefit
FROM architect a
JOIN 
	design d ON a.id = d.architect_id
GROUP BY a.id, a.name
HAVING total_benefit > 25;

-- Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT 
	a.id, 
	a.name, 
    SUM(d.benefit) AS total_benefit
FROM architect a
JOIN 
	design d ON a.id = d.architect_id
GROUP BY a.id, a.name
HAVING total_benefit > 25;

-- Tìm tổng số công nhân đã than gia ở mỗi công trình
SELECT 
	b.name AS building_name, 
    COUNT(w.worker_id) AS total_workers
FROM building b
JOIN 
	work w ON b.id = w.building_id
GROUP BY b.id;

-- Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất
SELECT 
	b.name AS building_name, 
    b.address AS building_address
FROM building b
JOIN 
	work w ON b.id = w.building_id
GROUP BY b.id
ORDER BY COUNT(w.worker_id) DESC
LIMIT 1;

-- Cho biêt tên các thành phố và kinh phí trung bình cho mỗi công trình của từng thành phố tương ứng
SELECT 
	b.city AS city_name, 
    AVG(b.cost) AS average_cost
FROM building b
GROUP BY b.city;

-- Cho biết họ tên các công nhân có tổng số ngày tham gia vào các công trình lớn hơn tổng số ngày tham gia của công nhân Nguyễn Hồng Vân
SELECT w.name
FROM worker w
JOIN 
	work wo ON w.id = wo.worker_id
GROUP BY w.id
HAVING SUM(wo.total) > (
    SELECT SUM(wr2.total)
    FROM worker w2
    JOIN 
		work wr2 ON w2.id = wr2.worker_id
    WHERE w2.name = 'nguyen hong van'
);

-- Cho biết tổng số công trình mà mỗi chủ thầu đã thi công tại mỗi thành phố
SELECT 
	c.name AS contractor_name, 
    b.city AS city_name, 
    COUNT(b.id) AS total_projects
FROM contractor c
JOIN 
	building b ON c.id = b.contractor_id
GROUP BY c.id, b.city;

-- Cho biết họ tên công nhân có tham gia ở tất cả các công trình
SELECT w.name
FROM worker w
JOIN 
	work wr ON w.id = wr.worker_id
GROUP BY w.id
HAVING COUNT(DISTINCT wr.building_id) = (SELECT COUNT(DISTINCT id) FROM building);
