-- Exercício 1.1.1
-- Resolução que utuliza 'FOR' --

DO $$ 
BEGIN
    -- Imprime todos os números pares de 2 a 100
    FOR num_par IN 2..100 BY 2 LOOP
        RAISE NOTICE '%', num_par;
    END LOOP;
END $$;

-- Resolução que utiliza 'WHILE' --

DO $$ 
DECLARE
    num_par INT := 2;  
BEGIN
    -- Imprime todos os números pares de 2 a 100
    WHILE num_par <= 100 LOOP
        RAISE NOTICE '%', num_par;
        num_par := num_par + 2;  
    END LOOP;
END $$;

-- Resolução que utiliza 'LOOP' --

DO $$ 
DECLARE
    num_par INT := 2;  
BEGIN
    LOOP
        EXIT WHEN num_par > 100;  
        RAISE NOTICE '%', num_par;
        num_par := num_par + 2;  
    END LOOP;
END $$;

-- Resolução que utiliza 'FOREACH (com array) --

DO $$ 
DECLARE
    numeros_pares INT[] := ARRAY[
        2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 
        32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 
        58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 
        84, 86, 88, 90, 92, 94, 96, 98, 100
    ];  
    num_par INT;  
BEGIN
    -- Loop que percorre todos os números pares no array
    FOREACH num_par IN ARRAY numeros_pares LOOP
        RAISE NOTICE '%', num_par;
    END LOOP;
END $$;


-- Exercício 1.1.2
-- Resolução que utiliza 'FOR'
DO $$ 
DECLARE
    num REAL;
    total_positivos INT := 0;  
BEGIN
    FOR i IN 1..6 LOOP
        -- Gera números entre -10 e 10, descartando zero
        num := (random() * 20 - 10);  
        
        IF num > 0 THEN
            total_positivos := total_positivos + 1;
        END IF;
        
        RAISE NOTICE 'Número gerado: %', num;
    END LOOP;

    RAISE NOTICE '% valores positivos', total_positivos;
END $$;

-- Resolução que utiliza WHILE -- 

DO $$ 
DECLARE
    num REAL;
    total_positivos INT := 0;  
	i INT := 1;  
BEGIN
    -- Loop WHILE que gera 6 (seis) números aleatórios
    WHILE i <= 6 LOOP
        num := (random() * 20 - 10);  
        
        IF num > 0 THEN
            total_positivos := total_positivos + 1;
        END IF;

        RAISE NOTICE 'Número gerado: %', num;
        i := i + 1;  
    END LOOP;

    RAISE NOTICE '% valores positivos', total_positivos;
END $$;

-- Resolução que utiliza LOOP --

DO $$ 
DECLARE
    num REAL;
    total_positivos INT := 0;  
    i INT := 1; 
BEGIN
    -- Loop para gerar 6 (seis) números aleatórios
    LOOP
        EXIT WHEN i > 6;  
        num := (random() * 20 - 10);  
        
        IF num > 0 THEN
            total_positivos := total_positivos + 1;
        END IF;

        RAISE NOTICE 'Número gerado: %', num;
        i := i + 1;
    END LOOP;

    RAISE NOTICE '% valores positivos', total_positivos;
END $$;

-- Resolução que utiliza FOREACH (com array) --

DO $$ 
DECLARE
    numeros REAL[] := ARRAY[
        (random() * 20 - 10), 
        (random() * 20 - 10), 
        (random() * 20 - 10), 
        (random() * 20 - 10), 
        (random() * 20 - 10), 
        (random() * 20 - 10)
    ];  
    num REAL;
    total_positivos INT := 0; 
BEGIN
    -- Loop FOREACH que percorre todos os números no array
    FOREACH num IN ARRAY numeros LOOP
        IF num > 0 THEN
            total_positivos := total_positivos + 1;
        END IF;

        RAISE NOTICE 'Número gerado: %', num;
    END LOOP;

    RAISE NOTICE '% valores positivos', total_positivos;
END $$;

-- Exercício 1.1.3 -- 
-- Resolução que utiliza 'FOR' --        

DO $$ 
DECLARE
    x INT := 6;  
    y INT := -5; 
    soma_impares INT := 0; 
    menor INT;
    maior INT;
BEGIN
    menor := LEAST(x, y);
    maior := GREATEST(x, y);
    
    FOR i IN menor + 1..maior - 1 LOOP
        IF i % 2 <> 0 THEN  -- Verifica se o número é ímpar
            soma_impares := soma_impares + i;
        END IF;
    END LOOP;

    RAISE NOTICE 'Soma dos números ímpares: %', soma_impares;
END $$;

-- Resolução que utiliza 'WHILE'

DO $$ 
DECLARE
    x INT := 6;
    y INT := -5;
    soma_impares INT := 0;
    menor INT;
    maior INT;
    i INT;
BEGIN
    menor := LEAST(x, y);
    maior := GREATEST(x, y);
    i := menor + 1;

    WHILE i < maior LOOP
        IF i % 2 <> 0 THEN  -- Verifica se o número é ímpar
            soma_impares := soma_impares + i;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'Soma dos números ímpares: %', soma_impares;
END $$;

-- Resolução que utiliza 'LOOP'

DO $$ 
DECLARE
    x INT := 6;
    y INT := -5;
    soma_impares INT := 0;
    menor INT;
    maior INT;
    i INT;
BEGIN
    menor := LEAST(x, y);
    maior := GREATEST(x, y);
    i := menor + 1;

    LOOP
        EXIT WHEN i >= maior;  
        IF i % 2 <> 0 THEN
            soma_impares := soma_impares + i;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'Soma dos números ímpares: %', soma_impares;
END $$;

-- Resolução que utiliza 'FOREACH' (com ARRAY)

DO $$ 
DECLARE
    x INT := 5;  
    y INT := 2;
    numeros INT[] := ARRAY[]::INTEGER[];  
    soma_impares INT := 0;  
    menor INT;
    maior INT;
    num INT;
BEGIN
    menor := LEAST(x, y);
    maior := GREATEST(x, y);
    
    FOR i IN menor + 1..maior - 1 LOOP
        numeros := array_append(numeros, i);
    END LOOP;

    FOREACH num IN ARRAY numeros LOOP
        IF num % 2 <> 0 THEN  
            soma_impares := soma_impares + num;
        END IF;
    END LOOP;

    RAISE NOTICE 'Soma dos números ímpares: %', soma_impares;
END $$;

-- Exercício 1.1.4
-- Resolução que utiliza 'FOR' e 'FOREACH'

DO $$ 
DECLARE
    m INT;                      
    n INT;                      
	menor INT;                 
    maior INT;                 
    soma INT;                  
    numeros INT[];             
    num INT;                   
BEGIN
    LOOP
        -- Simula a leitura dos valores
        m := (SELECT (random() * 10)::INT);  
        n := (SELECT (random() * 10)::INT);  

        RAISE NOTICE 'Valores lidos: M=% N=%', m, n;  

        IF m <= 0 OR n <= 0 THEN
            EXIT;  -- Encerra o loop
        END IF;

        menor := LEAST(m, n);
        maior := GREATEST(m, n);

        soma := 0;
        numeros := ARRAY[]::INTEGER[];  
		
        FOR i IN menor..maior LOOP
            numeros := array_append(numeros, i);
        END LOOP;

       FOREACH num IN ARRAY numeros LOOP
            RAISE NOTICE '% ', num;  
            soma := soma + num;       
			END LOOP;

       RAISE NOTICE 'Sum=%', soma;

    END LOOP;
END $$;

-- Solução que utiliza 'WHILE'

DO $$ 
DECLARE
    m INT;                      
    n INT;                      
    menor INT;                 
    maior INT;                 
    soma INT;                  
    numeros INT[];             
	num INT;                   
BEGIN
    m := 1;  
    n := 1;  

    WHILE TRUE LOOP
        m := (SELECT (random() * 10)::INT);  
        n := (SELECT (random() * 10)::INT);  

        RAISE NOTICE 'Valores lidos: M=% N=%', m, n; 

        IF m <= 0 OR n <= 0 THEN
            EXIT;  
        END IF;

        menor := LEAST(m, n);
        maior := GREATEST(m, n);

        soma := 0;
        numeros := ARRAY[]::INTEGER[];  

        FOR i IN menor..maior LOOP
            numeros := array_append(numeros, i);
        END LOOP;

        FOREACH num IN ARRAY numeros LOOP
            RAISE NOTICE '% ', num;  -- Imprime o número
            soma := soma + num;       -- Acumula a soma
        END LOOP;

        RAISE NOTICE 'Sum=%', soma;
        
    END LOOP;
END $$;

-- Resolução que utiliza 'LOOP'

DO $$ 
DECLARE
    m INT;
    n INT;
    menor INT;
    maior INT;
    soma INT;
BEGIN
    LOOP
        m := 5;
        n := 2;

        IF m <= 0 OR n <= 0 THEN
            EXIT;
        END IF;

        menor := LEAST(m, n);
        maior := GREATEST(m, n);

        soma := 0;

        FOR i IN menor..maior LOOP
            RAISE NOTICE '% ', i;
            soma := soma + i;
        END LOOP;

        RAISE NOTICE 'Sum=%', soma;

        m := 6;
        n := 3;

        IF m <= 0 OR n <= 0 THEN
            EXIT;
        END IF;

        menor := LEAST(m, n);
        maior := GREATEST(m, n);
        soma := 0;

        FOR i IN menor..maior LOOP
            RAISE NOTICE '% ', i;
            soma := soma + i;
        END LOOP;

        RAISE NOTICE 'Sum=%', soma;

        EXIT;
    END LOOP;
END $$;
