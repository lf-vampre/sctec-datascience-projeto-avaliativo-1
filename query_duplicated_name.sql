SELECT 
    FIRST_NAME, 
    LAST_NAME, 
    COUNT(*) as qtde
FROM 
    HR.EMPLOYEES
GROUP BY 
    FIRST_NAME, 
    LAST_NAME
HAVING 
    COUNT(*) > 1;