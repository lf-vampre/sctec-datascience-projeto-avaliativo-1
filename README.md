![Logos](./images/logos.png)

<br>
<br>

## 💻 Curso Datascience - Visualização de Dados e Business Intelligence. 

Projeto Avaliativo Final - Módulo 1 - Semana 13

Aluno: Luiz Felipe F V Vieira

<br>
<br>

## 🔍 AED (Análise Exploratória de Dados): "Base Recursos Humanos" 
Utilizando as tabelas do banco de dados 'HR' (Human Resources) da Oracle FreeSQL que contém registros sobre funcionários, cargos, departamentos, salários e distribuição geográfica.
(https://freesql.com/)

<br>

---

### 🎯 Propósito

> O objetivo é praticar SQL, Python e análise de dados de forma simples, como em uma rotina básica de trabalho. Após a AED devemos entender melhor a distribuição dos salários, a relação entre cargos e departamentos e os padrões de remuneração por região.
  
<br>

---

### 📦 Entregáveis

> O Projeto deverá ser entregue com os seguintes arquivos:

<br>

1. - [x] Código .sql (query_01.sql e query_02.sql) das duas consultas usadas no FreeSQL

2. - [x] Arquivos .csv (query_01.csv e query_02.csv) com os dados extratídos do FreeSQL

3. - [ ] Arquivo .ipynb (projeto_aed_rh.ipynb) em Python (Jupyter Notebook) estruturado com as análises.

4. - [ ] Arquivo README.md com a documentação completa do projeto.

5. - [ ] Versionamento com branch e commit no github.

6. - [ ] Vídeo explicativo demonstrando a visualização e utilização dos recursos desenvolvidos (enviar no AVA).


<br>

---

### ⚙️ Requisitos Funcionais (RF)

> O projeto deverá contemplar as seguintes etapas:

<br>

- [x] RF01: Conectar-se ao banco de dados FreeSQL (esquema HR)

- [x] RF02: Buscar dados das tabelas EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES e REGIONS

- [x] RF03: Desenvolver duas consultas SQL, utilizano pelo menos dois LEFT JOIN em cada consulta:

    ● Query 1: Salários por departamento e cargo;

    ● Query 2: Funcionários por região, incluindo informações de localização;

- [x] RF04: Aplicar um filtro utilizando um comando WHERE simples, por exemplo:

    ● WHERE SALARY > …

    ● WHERE DEPARTMENT_ID IS NOT NULL

    ● WHERE REGION_NAME IS NOT NULL

- [x] RF05: Exportar o resultado de cada consulta para arquivos CSV separados:

    ● query_01.csv

    ● query_02.csv

- [ ] RF06: Importar os arquivos CSV no Python (Jupyter Notebook)

- [ ] RF07: Realizar uma Análise Exploratória de Dados (EDA) simples

- [ ] RF08: Calcular medidas estatísticas básicas, como: média, mediana, valor mínimo, valor máximo

- [ ] RF09: Criar pelo menos um gráfico, podendo ser: histograma ou boxplot

- [ ] RF10: Documentar todo o desenvolvimento do projeto em um arquivo README.md

- [ ] RF11: Publicar o projeto completo no GitHub e enviar o repositório da turma no AVA (incluindo o vídeo)

<br>

---

### 🧾 Sobre as Tabelas Usadas

<br>

> As seguintes tabelas do banco HR foram utilizadas no projeto. Os campos marcados foram selecionados para exportação e posterior AED com Python. A tabela principal (tabela fato) é a HR.EMPLOYEES.

<br>

| Tabela: **HR.EMPLOYEES** |
| :--- |
| |
| ✅ EMPLOYEE_ID |
| FIRST_NAME |
| LAST_NAME |
| EMAIL |
| PHONE_NUMBER |
| ✅ HIRE_DATE |
| JOB_ID |
| ✅ SALARY |
| ✅ COMMISSION_PCT |
| MANAGER_ID |
| DEPARTMENT_ID |

<br>

| Tabela: **HR.DEPARTMENTS** |
| :--- |
| |
| DEPARTMENT_ID |
| ✅ DEPARTMENT_NAME |
| MANAGER_ID |
| LOCATION_ID |

<br>

| Tabela: **HR.JOBS** |
| :--- |
| |
| JOB_ID |
| ✅ JOB_TITLE |
| ✅ MIN_SALARY |
| ✅ MAX_SALARY |

<br>

| Tabela: **HR.LOCATIONS** |
| :--- |
| |
| LOCATION_ID |
| STREET_ADDRESS |
| POSTAL_CODE |
| ✅ CITY |
| ✅ STATE_PROVINCE |
| COUNTRY_ID |

<br>

| Tabela: **HR.COUNTRIES** |
| :--- |
| |
| COUNTRY_ID |
| ✅ COUNTRY_NAME |
| REGION_ID |

<br>

| Tabela: **HR.REGIONS** |
| :--- |
| |
| REGION_ID |
| ✅ REGION_NAME |

<br>

> Primeiramente foi feita a verificação se existiam funcionários repetidos. Como a coluna EMPLOYEE_ID não tem linhas repetidas, a primeira verificação foi feita pelas colunas FIRST_NAME + LAST_NAME e depois foi verificado se existiam linhas repetidas na coluna EMAIL. 

<br>

**OBJETIVO DESTAS CONSULTAS**: Como a proposta é fazer somente análises abrangentes por departamento, cargo e distribuição geográfica, iremos exportar os dados de forma anônima (removendo os dados sensíveis como nome, sobrenome, email e telefone). Então a consulta de duplicatas se faz necessária ainda no banco de dados, pois após a remoção destas colunas, podem haver valores duplicados para funcionários distintos.

<br>

**RESULTADO**: Para ambas verificações, não foram encontrados valores duplicados.

<br>

**EXECUÇÃO DO SQL**:

Para a primeira verificação foi utilizado o seguinte código SQL abaixo. Este código seleciona as colunas FIRST_NAME e LAST_NAME e agrupa todas as linhas que têm a mesma combinaçao de nome e sobrenome.

Ao mesmo tempo armazena a quantidade de repetições em uma nova coluna chamada 'qtde' e exibe somente os resultados que possuem a contagem maior que 1 (HAVING COUNT(*) > 1).

```sql
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
``` 

<br>

Para a segunda verificação foi utilizada a mesma lógica anterior, porém somente com a coluna EMAIL.

```sql
SELECT 
    EMAIL, 
    COUNT(*) as qtde
FROM 
    HR.EMPLOYEES
GROUP BY 
    EMAIL
HAVING 
    COUNT(*) > 1;   
```

<br>

---

### 🛢️ Código das consultas SQL

<br>

> Com objetivo de entender melhor a distribuição dos salários, a relação entre cargos e departamentos e os padrões de remuneração por região, foram feitas duas consultas SQL e exportados os resultados em arquivos .csv para AED no Python.

<br>

**OBSERVAÇÕES**: 

Nas consultas já foram renomeadas as colunas para facilitar o entendimento.

Foram utilizados "LEFT JOIN" para preservar a integridade da tabela fato "EMPLOYEES", pois garante que todos os registros estarão listados, mesmo aqueles que não tenham correspondência nas outras tabelas (dimensão).

<br>

**EXECUÇÃO DO SQL**:

A primeira query visa responder a relação de salários por departamento e cargos, para isso foram selecionadas as colunas id, data_contratacao, salario e comissao da tabela Employees, a coluna departamento da tabela Departments e as colunas cargo, cargo_salario_min e cargo_salario_max da tabela Jobs.

Como a análise posterior irá focar no cargo, foi verificado que todas as linhas possuiam o registro na coluna JOB_TITLE. No entanto, a cláusula "_WHERE J.JOB_TITLE IS NOT NULL_" foi mantida para tornar a consulta mais robusta e defensiva, garantindo que dados incompletos não distorçam os resultados da agregação.


```sql
SELECT
    E.EMPLOYEE_ID AS id,
    E.HIRE_DATE AS data_contratacao,
    E.SALARY AS salario,
    E.COMMISSION_PCT AS comissao,
    D.DEPARTMENT_NAME AS departamento,
    J.JOB_TITLE AS cargo,
    J.MIN_SALARY AS cargo_salario_min,
    J.MAX_SALARY AS cargo_salario_max
FROM HR.EMPLOYEES E
LEFT JOIN HR.DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN HR.JOBS J
    ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_TITLE IS NOT NULL     
ORDER BY E.EMPLOYEE_ID;
```

<br>

A segunda query visa analisar salários e distribuição geográfica, para isso foram selecionadas as colunas id, data_contratacao, salario e comissao da tabela Employees, a coluna departamento da tabela Departments, as colunas cidade e estado da tabela Locations, a coluna pais da tabela Countries e a coluna regiao da tabela Regions.

Já nessa consulta o filtro "_WHERE E.SALARY IS NOT NULL AND E.SALARY > 0_" garante a qualidade dos dados na análise. Ele exclui registros incompletos (NULL) e valores inválidos como zero ou negativos, evitando distorções nas métricas salariais.


```sql
SELECT
    E.EMPLOYEE_ID AS id,
    E.HIRE_DATE AS data_contratacao,
    E.SALARY AS salario,
    E.COMMISSION_PCT AS comissao,
    D.DEPARTMENT_NAME AS departamento,
    L.CITY AS cidade,
    L.STATE_PROVINCE AS estado,
    C.COUNTRY_NAME AS pais,
    R.REGION_NAME AS regiao
FROM HR.EMPLOYEES E
LEFT JOIN HR.DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN HR.LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID
LEFT JOIN HR.COUNTRIES C
    ON L.COUNTRY_ID = C.COUNTRY_ID
LEFT JOIN HR.REGIONS R
    ON C.REGION_ID = R.REGION_ID
WHERE  E.SALARY IS NOT NULL
    AND E.SALARY > 0
ORDER BY R.REGION_NAME, C.COUNTRY_NAME, L.CITY;
```

<br>

---

### 🐍 Análises Feita em Python (Jupyter Notebook)

<br>

---

### 📊 Visualizações e Resultados

<br>

---

### 🚀 Como Executar o Projeto (Instalação)

> #### Pré-requisitos
<br>

* **Python:** Versão 3.12.3 ou superior.
* **Ambiente virtual .venv:** Criação do ambinte virtual e instalação das dependências.

<br>

> #### Instalação e Configuração

<br>

1. **Clone o repositório e acesse a pasta:**

```bash
git clone https://github.com/lf-vampre/sctec-datascience-projeto-avaliativo-1
cd sctec-datascience-projeto-avaliativo-1
```

<br>

2. **Crie e ative o ambiente virtual (venv):**
```bash

python3 -m venv .venv # ou então: python -m venv .venv

```

* Ativação (Linux/WSL/MacOS):
```bash

source .venv/bin/activate

```

* Ativação (Windows - PowerShell):
```bash

.\.venv\Scripts\Activate.ps1

```

<br>

3. **Instale as dependências:**
```bash

pip install -r requirements.txt

```

<br>

### 💻 Uso Básico

> Abra o arquivo "projeto_aed_rh.ipynb" no vscode, selecione o kernel do python do ambiente .venv e rode todas as células ou uma a uma para acompanhar o pipeline de dados

<br>

---

### 💡 Sugestões de melhoria para futuras versões

<br>

---

### 🛠️ Tecnologias Utilizadas

* **Linguagem:** Python (Pandas, Matplotlib, Seaborn), SQL.
* **Base de Dados:** csv.
* **Ambiente:** VS Code / WSL / venv
* **Orquestração:** Lógica celular em Jupyter Notebook.


<br>

---

### 📜 Histórico de Commits (git log --oneline)

<br>
