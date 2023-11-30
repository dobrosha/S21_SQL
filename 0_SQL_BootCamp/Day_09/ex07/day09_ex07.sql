-- Функции SQL могут быть объявлены как принимающие переменное число аргументов, с условием, что все
-- «необязательные» аргументы имеют один тип данных. Необязательные аргументы будут переданы такой
-- функции в виде массива. Для этого в объявлении функции последний параметр помечается как VARIADIC;
-- при этом он должен иметь тип массива

CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$
-- unnest(arr) разворачивает массив в набор строк
SELECT min(i) FROM unnest(arr) g(i);
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);