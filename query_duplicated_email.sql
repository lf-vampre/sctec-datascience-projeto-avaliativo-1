SELECT 
    EMAIL, 
    COUNT(*) as qtde
FROM 
    HR.EMPLOYEES
GROUP BY 
    EMAIL
HAVING 
    COUNT(*) > 1;