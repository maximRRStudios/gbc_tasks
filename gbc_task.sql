----------------
-----Task 1-----
--так как в условии нет типа данных то взял smallint
--мало ли больше 2х вариантов) и в системе какой-то енум
--0 - Мужчины, 1 Женщины и тд
----------------
SELECT pers_name
FROM sql_test_personell
WHERE gender = 1
----------------
----------------
----------------

----------------
-----Task 2-----
----------------
SELECT pers_name
FROM sql_test_personell
JOIN sql_test_department USING(department_id)
WHERE department_name = 'Отдел продаж'
----------------
----------------
----------------

----------------
-----Task 3-----
----------------
SELECT department_name
FROM sql_test_department
JOIN sql_test_personell  USING(department_id)
GROUP BY department_name
HAVING count(pers_id) <= 3
----------------
----------------
----------------

----------------
-----Task 4-----
----------------
with avg_salary as (
	select department_id, avg(pers_salary) as avg_value
	from sql_test_personell
	group by department_id
)
select pers_name
from sql_test_personell
join avg_salary using(department_id)
where pers_salary > avg_value
----------------
----------------
----------------

----------------
-----Task 5-----
----------------
select pers_name
from sql_test_personell
where pers_date < now() - interval '40 year'
----------------
----------------
----------------

----------------
-----Task 6-----
--возможно какое-то из полей chief_id или department_head избыточно--
-- в решении заложился на chief_id, сомнительно что ид из dep_head может--
-- не быть в какой-либо записи как chief_id --
----------------
with pers_filtered as (
    select
        p.pers_name,
        case when p.gender = 0 then 1 else 0 end as is_good_gender,
        case when p.pers_bd < now() - interval '30 year' then 1 else 0 end as is_good_age,
        case when p.pers_salary > 70000 then 1 else 0 end as is_good_salary,
        case when d1.department_name = 'Маркетинг' then 1 else 0 end as is_good_dep,
		case when exists(select chief_id from sql_test_personell p2 where p.pers_id = p2.chief_id) then 1 else 0 end as is_head
    from sql_test_personell p
     join sql_test_department d1 using(department_id)
	where p.gender = 0 
		or p.pers_bd < now() - interval '30 year'
		or p.pers_salary > 70000 
		or d1.department_name = 'Маркетинг'
		or exists(select chief_id from sql_test_personell p2 where p.pers_id = p2.chief_id)
)
SELECT pers_name
FROM pers_filtered
where (is_good_gender + is_good_age + is_good_salary + is_good_dep + is_head) > 2

----------------
----------------
----------------