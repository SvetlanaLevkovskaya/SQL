#The database scheme consists of four tables:
#Product(maker, model, type)
#PC(code, model, speed, ram, hd, cd, price)
#Laptop(code, model, speed, ram, hd, screen, price)
#Printer(code, model, color, type, price)
#The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). 
#It is assumed that model numbers in the Product table are unique for all makers and product types. 
#Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized
#by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, 
#RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. 
#The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – 
#screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – 
#color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

#The database of naval ships that took part in World War II is under consideration. 
#The database consists of the following relations:
#Classes(class, type, country, numGuns, bore, displacement)
#Ships(name, class, launched)
#Battles(name, date)
#Outcomes(ship, battle, result)
#Ships in classes all have the same general design. A class is normally assigned either the name of the first ship built 
#according to the corresponding design, or a name that is different from any ship name in the database. 
#The ship whose name is assigned to a class is called a lead ship.
#The Classes relation includes the name of the class, type (can be either bb for a battle ship, or bc for a battle cruiser), 
#country the ship was built in, the number of main guns, gun caliber (bore diameter in inches), and displacement (weight in tons).
#Notes: 
#1) The Outcomes relation may contain ships not present in the Ships relation. 
#2) A ship sunk can’t participate in later battles. 
#3) For historical reasons, lead ships are referred to as head ships in many exercises.
#4) A ship found in the Outcomes table but not in the Ships table is still considered in the database. 
#This is true even if it is sunk.

#Income_o(point, date, inc)
#The primary key is (point, date), where point holds the identifier of the buy-back center, and date corresponds 
#to the calendar date the funds were received. The date column doesn’t include the time part, thus, money (inc) arrives
#no more than once a day for each center. Information on payments to the recyclables suppliers is held in the table
#Outcome_o(point, date, out)
#In this table, the primary key (point, date) ensures each buy-back center reports about payments (out) no more than once a day, too.
#For the case income and expenditure may occur more than once a day, another database schema with tables having a primary key 
#consisting of the single column code is used:
#Income(code, point, date, inc)
#Outcome(code, point, date, out)
#Here, the date column doesn’t include the time part, either.


#1 Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
Result set: model, speed, hd.

SELECT model, speed, hd FROM PC
WHERE price <500


#2 List all printer makers. Result set: maker.

SELECT distinct maker FROM Product
WHERE type = 'printer'


#3 Find the model number, RAM and screen size of the laptops with prices over $1000.

SELECT model, ram, screen FROM laptop WHERE price >1000


#4 Find all records from the Printer table containing data about color printers.

SELECT * FROM printer WHERE color = 'y'


#5 Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.

SELECT model, speed, hd FROM PC
WHERE cd = '12x' and price < 600 
   or cd = '24x' and price < 600

#6 For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.

SELECT distinct maker, speed FROM product
JOIN laptop On product.model=laptop.model
WHERE hd >= 10

#7 Get the models and prices for all commercially available products (of any type) produced by maker B.

SELECT product.model, pc.price FROM product, pc WHERE product.model = pc.model AND maker = 'b'
UNION
SELECT product.model, laptop.price FROM product, laptop WHERE product.model = laptop.model AND maker = 'b'
UNION
SELECT product.model, printer.price FROM product, printer WHERE product.model = printer.model AND maker = 'b'

#8 Find the makers producing PCs but not laptops.

SELECT maker FROM product
WHERE type in ('pc')
EXCEPT
SELECT maker FROM product
WHERE type in ('laptop')

#9 Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.

SELECT distinct maker FROM Product
JOIN PC ON product.model = pc.model
WHERE speed >=450

#10 Find the printer models having the highest price. Result set: model, price.

SELECT model, price FROM printer
WHERE price = (select max(price) from printer)

#11 Find out the average speed of PCs.

SELECT avg(speed) FROM PC

#12 Find out the average speed of the laptops priced over $1000.

SELECT avg(speed) FROM laptop WHERE price>1000

#13 Find out the average speed of the PCs produced by maker A.

SELECT avg(speed) FROM PC
JOIN product ON product.model=pc.model
WHERE maker  = 'a'

#14 For the ships in the Ships table that have at least 10 guns, get the class, name, and country.

SELECT ships.class, ships.name, classes.country FROM ships
JOIN classes ON classes.class=ships.class WHERE numGuns >= 10

#15 Get hard drive capacities that are identical for two or more PCs. Result set: hd.

SELECT hd FROM PC
GROUP BY hd
HAVING COUNT(hd) >=2

#16 Get pairs of PC models with identical speeds and the same RAM capacity. 
#Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
#Result set: model with the bigger number, model with the smaller number, speed, and RAM.

SELECT DISTINCT a.model, b.model, a.speed, a.ram
FROM pc AS a, pc AS b
WHERE a.model>b.model
and
a.speed=b.speed
and
a.ram=b.ram


#17 Get the laptop models that have a speed smaller than the speed of any PC. Result set: type, model, speed.

SELECT distinct product.type, laptop.model, laptop.speed FROM Product
JOIN Laptop ON product.model=laptop.model
WHERE laptop.speed < ALL (select pc.speed FROM PC)

#18 Find the makers of the cheapest color printers.
Result set: maker, price.

SELECT distinct maker, price
FROM product
JOIN Printer ON product.model=printer.model
WHERE color = 'y'
and price = (SELECT min(price) FROM printer WHERE color = 'y')
Group by maker, price

#19 For each maker having models in the Laptop table, find out the average screen size of the laptops he produces. Result set: maker, average screen size.

SELECT maker, avg(screen) FROM Product
JOIN Laptop ON product.model=laptop.model
GROUP BY maker

#20 Find the makers producing at least three distinct models of PCs. Result set: maker, number of PC models.

SELECT maker, count(model) FROM Product
WHERE type = 'pc'
GROUP BY maker
HAVING count(model) >=3


#21 Find out the maximum PC price for each maker having models in the PC table. Result set: maker, maximum price.

SELECT maker, MAX(price) 
FROM Product 
JOIN PC ON product.model=pc.model
GROUP BY maker

#22 For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds. Result set: speed, average price.

SELECT speed, avg(price)
FROM PC
WHERE speed > 600
GROUP BY speed

#23 Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher. Result set: maker

SELECT maker FROM Product JOIN PC ON product.model=pc.model WHERE speed >=750
INTERSECT
SELECT maker FROM Product JOIN Laptop ON product.model=laptop.model WHERE speed >=750

#24 List the models of any type having the highest price of all products present in the database.

SELECT model

FROM (SELECT model, price FROM pc
UNION
      SELECT model, price FROM Laptop
UNION
      SELECT model, price FROM Printer) A

WHERE price = (SELECT MAX(price)
FROM          (SELECT price FROM pc
UNION
               SELECT price FROM Laptop
UNION
               SELECT price FROM Printer) B)


#25 Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity.
#Result set: maker.

SELECT DISTINCT maker FROM product

WHERE model in (SELECT model FROM pc WHERE ram = (SELECT MIN(ram) FROM pc)

AND speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(ram) FROM pc)))

AND maker IN (SELECT maker FROM product WHERE type='printer')



#26 Find out the average price of PCs and laptops produced by maker A. Result set: one overall average price for all items.

SELECT sum(s.price)/sum(s.kol) as sredn FROM 
 
(SELECT price,1 as kol FROM pc,product
WHERE pc.model=product.model AND product.maker='A'

UNION all

SELECT price,1 as kol FROM laptop, product
WHERE laptop.model=product.model AND product.maker='A') as s

#27 Find out the average hard disk drive capacity of PCs produced by makers who also manufacture printers. Result set: maker, average HDD capacity.

SELECT product.maker, AVG(pc.hd) FROM pc, product

WHERE product.model = pc.model
AND   product.maker IN (SELECT DISTINCT maker FROM product WHERE product.type = 'printer')

GROUP BY maker

#28 Using Product table, find out the number of makers who produce only one model.

SELECT COUNT(maker)
FROM product
WHERE maker in (SELECT maker FROM product GROUP BY maker HAVING count(model) = 1)


#29 Under the assumption that receipts of money (inc) and payouts (out) are registered not more than once a day for each collection point [i.e. the primary key consists of (point, date)], write a query displaying cash flow data (point, date, income, expense).
#Use Income_o and Outcome_o tables.

SELECT t1.point, t1.date, inc, out
FROM income_o t1 LEFT JOIN outcome_o t2 ON t1.point = t2.point
AND t1.date = t2.date

UNION

SELECT t2.point, t2.date, inc, out
FROM income_o t1 RIGHT JOIN outcome_o t2 ON t1.point = t2.point
AND t1.date = t2.date


#30 Under the assumption that receipts of money (inc) and payouts (out) can be registered any number of times a day for each collection point [i.e. the code column is the primary key], display a table with one corresponding row for each operating date of each collection point.
Result set: point, date, total payout per day (out), total money intake per day (inc).
Missing values are considered to be NULL.

SELECT point, date, SUM(sum_out), SUM(sum_inc)
FROM( select point, date, SUM(inc) as sum_inc, null as sum_out from Income 
GROUP BY point, date

UNION

SELECT point, date, null as sum_inc, SUM(out) as sum_out FROM Outcome 
GROUP BY point, date ) as t

GROUP BY point, date order by point





