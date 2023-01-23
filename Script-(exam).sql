use test;

delimiter $$

create function funcA(
tips_employeeId int,
tips_Date datetime,
tips_Amount int
)
returns int
deterministic
begin 

	declare sum_amount int;--  объявляем переменную

	-- добавляем нового пользователя
	insert into tips(employeeId, tipsDate, tipsAmount)
	values(tips_employeeId, tips_Date, tips_Amount);

-- 2 часть задания-возвращать общую сумму чаевых для данного SQL.работника за
-- весь период времени.

-- делаем выборку

select SUM(tipsAmount) into sum_amount from tips
-- условие

where employeeId = tips_employeeId;

-- запуск через новый скрипт
end $$



-- 2. Написать хранимую процедуру, которая принимает на вход 2 параметра - year1 и year2 типа integer.
-- Процедура должна найти все языки, которые были созданы в прмежутке лет [year1,year2], а также информацию об их авторах

delimiter $$

create procedure tasks(year1 int, year2 int)
begin
	select pl.name as language_name, author_name, creation_date, biography

	from programming_langueges pl
	inner join authors a on pl.id = a.languege_id
	where year(creation_date) between year1 and year2
	order by creation_date desk;

-- запуск через новый скрипт
end $$


