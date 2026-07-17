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

3. - [x] Arquivo .ipynb (projeto_aed_rh.ipynb) em Python (Jupyter Notebook) estruturado com as análises.

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

- [x] RF06: Importar os arquivos CSV no Python (Jupyter Notebook)

- [x] RF07: Realizar o fluxo ETL para investigação e limpeza nos dados.

- [ ] RF08: Realizar uma Análise Exploratória de Dados (EDA) simples

- [ ] RF09: Calcular medidas estatísticas básicas, como: média, mediana, valor mínimo, valor máximo

- [ ] RF10: Criar pelo menos um gráfico, podendo ser: histograma ou boxplot

- [ ] RF11: Documentar todo o desenvolvimento do projeto em um arquivo README.md

- [ ] RF12: Publicar o projeto completo no GitHub e enviar o repositório da turma no AVA (incluindo o vídeo)

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

**RESULTADO**: Para ambas verificações, não foram encontrados valores duplicados. As consultas também foram salvas nos arquivos `query_duplicated_email.sql` e `query_duplicated_name.sql`.

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

> Com objetivo de entender melhor a distribuição dos salários, a relação entre cargos e departamentos e os padrões de remuneração por região, foram feitas duas consultas SQL e exportados os resultados em arquivos .csv para ETL e AED no Python.

<br>

**OBSERVAÇÕES**: 

As colunas já foram renomeadas nas consultas para facilitar o entendimento na AED.

Foram utilizados "LEFT JOIN" para preservar a integridade da tabela fato "EMPLOYEES", pois garante que todos os registros estarão listados, mesmo aqueles que não tenham correspondência nas outras tabelas (dimensão).

As consultas foram salvas como `query_01.sql` e `query_02.sql` e os resultados foram salvos como `query_01.csv` e `query_02.csv` respectivamente.

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

> Foi criado um Fluxo do Pipeline de Dados com as etapas de ETL (Extract - Transform - Load) e de EDA (Exploratory Data Analysis - AED)

<br>

**1. EXTRACT - Verificação e conhecimento da base**

Nesta etapa foram importadas as bibliotecas necessária para análise (pandas, matplotlib e seaborn) e os arquivos .csv gerados no FreeSQL (query_01.csv e query_02.csv). 

Após foram utilizados os médodos `.head()`, `.tail()`, `.info()`, `.isnull().sum()` e `.nunique()` do pandas para investigação das tabelas, colunas e dados, além da contagem de nulos e contagem de registros únicos em cada coluna.

**2. TRANSFORM - Limpeza dos dados (DUPLICADOS)**

A verificação de linhas duplicadas já foi feita diretamente na tabela fato do banco HR (FreeSQL). Então nessa etapa, apenas para fins didáticos, foram feitas as consultas de total de linhas, linhas únicas e linhas duplicadas para exemplificar o código em Python utilizado para este fim.

**3. TRANSFORM - Correção e tratamento dos dados**

Ainda na transformação dos dados, foi gerada uma cópia de cada DataFrame para iniciar as modificações necessárias. Desta forma preservamos os DataFrames carregados originalmente.

_3.1. Correção de data (str > datetime)_

Foi utilizado o método `to_datetime()` do pandas para transformar a coluna DATA_CONTRATACAO de string para o tipo datetime e futuramente a criação de novas features de data.

_3.2. Conversão e otimização dos tipos de dados_

Para realizar a adequação dos tipos de dados das colunas visando reduzir o consumo de memória e melhorar a eficiência das operações analíticas foram feitas conversão nos tipos de dados.

Colunas categóricas -> Convertidas de str (string) para o tipo category

Colunas numéricas -> Ajustado para tipo mais compacto de int64 para int16 e int32

_3.3. Inconsistência de dados_

Nesta etapa foi verificada a consistência dos dados nas colunas categoricas. Para isso foi utilizado o método `.value_counts(dropna=False)` em cada coluna categorica. Desta forma é possível verificar quais dados estão nessas colunas e quantas vezes aparece cada um. 

O objetivo é verificar algum dado que possa estar incorreto (que não representa aquela categoria) e utilizando o parâmetro `(dropna=False)` também conseguimos contar quantos `NaN` (ou vazios) existem em cada coluna.

_CONCLUSÃO_: 

Na tabela de Cargos e Departamentos foi encontrado um registro com a coluna DEPARTAMENTO sem valor (ID=178). Este mesmo registro possuia a coluna CARGO com o valor 'Sales Representative'. Após investigação na tabela, foi constatado que todos os registros que possuiam o mesmo cargo estavam no Departamento 'Sales'. Portanto, podemos determinar que este funcionário com o referido cargo, também pertence ao mesmo departamento e assim foi atribuído.

Na tabela de Localização foram encontrados 2 registros inconsistêntes. 

O primeiro (ID=203) tinha apenas a coluna ESTADO vazia. Após a verificação do País a qual pertencia e das Cidades que pertenciam ao mesmo País, foi constatado que existiam apenas as Cidades Oxford (com 34 registros) pertencente ao Estado de Oxford e a Cidade de London (com 1 registro) e que estava sem o Estado. Para não haver inconsistência nas análises, foi atribuído o estado de London (mesmo nome da cidade), seguindo o padrão da outra cidade.

Já o segundo registro (ID=178) é o mesmo funcionário que foi encontrada a inconstância na coluna DEPARTAMENTO. Como na exportação dos dados do FreeSQL utilizamos LEFT JOIN e a tabela HR.LOCATIONS tem relação direta com a tabela HR.DEPARTMENTS, todos os dados de localização vieram vazios pela falta do departamento. Como na análise anterior já descobrimos que este registro pertence ao departamento 'Sales', pesquisamos todos os registros do mesmo departamento para descobrir em qual localidade se encontravam. Todos os 34 registros estavam na mesma localidade, então foi concluído que este registro também pertence a mesma localidade e assim foram preenchidos os campos.

_3.4. Engenharia de Features_

Foram criadas 3 novas features (colunas) temporais (DIA, MES, ANO) através da coluna DATA_CONTRATACAO utilizando os métodos `.dt.day`, `dt.month` e `dt.year`. Desta forma é possível fazer análises por período de tempo.

**LOAD - Gerar nova base limpa**

Completando o fluxo de ETL foi gerada uma nova base final como fonte única da verdade. Como as duas tabelas vieram da mesma tabela fato HR.EMPLOYEES, elas foram mescladas e transformadas em uma única base limpa. Toda a AED será feita nessa tabela única. Para garantir a persistência dos dados finais, esta nova tabela foi salva como um novo arquivo `base_final.csv`.

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
