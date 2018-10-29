CREATE OR REPLACE FUNCTION ejecutar(entrada text) RETURNS void AS $$
DECLARE
	type1 text;
	type2 text;
    arguments text[];
BEGIN
    arguments := parsear(entrada);
	EXECUTE
		'SELECT type_arg FROM temp_table WHERE id = 1'
	INTO type1;
	EXECUTE
		'SELECT type_arg FROM temp_table WHERE id = 2'
	INTO type2;
    EXECUTE 
        'SELECT ' ||
        arguments[1] ||
		'(' ||
        arguments[2]::text ||
		'::' ||
        type1 ||
		', ' ||
        arguments[3]::text ||
		'::' ||
        type2 ||
        ')';
END;
$$
LANGUAGE 'plpgsql'

-- '<test_function><e001><25></e001><e002><Hola mamá></e002></test_function>'