CREATE OR REPLACE FUNCTION parsear(entrada text) RETURNS text[] AS $$
DECLARE
    aux text[];
    aux2 text[];
    i integer := 4;
    j integer := 2;
BEGIN
    aux := string_to_array(entrada, '<');
    aux2[1] := btrim(aux[2], '>');
    LOOP
        IF i > array_length(aux, 1) THEN
            EXIT;
        END IF;
        aux2[j] := btrim(btrim(aux[i], '>'), '/');
        i := i + 3;
        j := j + 1;
    END LOOP;
    RETURN aux2;
END;
$$
LANGUAGE 'plpgsql'


-- Ejemplo de argumento: '<Req100><e001><25></e001><e002><10></e002></Req100>'