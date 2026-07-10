![Logos](./images/logos.png)
<br>

## 💻 Curso Datascience - Visualização de Dados e Business Intelligence. 
Projeto Avaliativo Final - Módulo 1 - Semana 13
Aluno: Luiz Felipe F V Vieira

<br>
<br>

## 🏪 AED (Análise Exploratória de Dados): "Base Recursos Humanos" 
Utilizando as tabelas 'HR' (Human Resources) do banco Oracle FreeSQL que contém registros sobre funcionários, cargos, departamentos, salários e distribuição geográfica.
(https://freesql.com/)

<br>
---

### 🎯 Propósito

> O objetivo é praticar SQL, Python e análise de dados de forma simples, como em uma rotina básica de trabalho. Após a AED devemos entender melhor a distribuição dos salários, a relação entre cargos e departamentos e os padrões de remuneração por região.
  
<br>
---

### Entregáveis

> O Projeto deverá ser entregue com os seguintes arquivos:

<br>

1. - [ ] Código .sql (query_01.sql e query_02.sql) das duas consultas usadas no FreeSQL
2. - [ ] Arquivos .csv (query_01.csv e query_02.csv) com os dados extratídos do FreeSQL
3. - [ ] Arquivo .ipynb (projeto_aed_rh.ipynb) em Python (Jupyter Notebook) estruturado com as análises.
4. - [ ] Arquivo README.md com a documentação completa do projeto.
5. - [ ] Versionamento com branch e commit no github.
6. - [ ] Vídeo explicativo demonstrando a visualização e utilização dos recursos desenvolvidos (enviar no AVA).


<br>
---

### Requisitos Funcionais (RF)

> O projeto deverá contemplar as seguintes etapas:

<br>

- [ ] RF01: Conectar-se ao banco de dados FreeSQL (esquema HR)
- [ ] RF02: Buscar dados das tabelas EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES e REGIONS
- [ ] RF03: Desenvolver duas consultas SQL, utilizano pelo menos dois LEFT JOIN em cada consulta:
    ● Query 1: Salários por departamento e cargo;
    ● Query 2: Funcionários por região, incluindo informações de localização;
- [ ] RF04: Aplicar um filtro utilizando um comando WHERE simples, por exemplo:
    ● WHERE SALARY > …
    ● WHERE DEPARTMENT_ID IS NOT NULL
    ● WHERE REGION_NAME IS NOT NULL
- [ ] RF05: Exportar o resultado de cada consulta para arquivos CSV separados:
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

### Sobre as Tabelas Usadas

<br>
Query 1 — Salário por Departamento e Cargo:
● Objetivo: analisar a distribuição de salários por departamento e cargo.
● Relacionamento sugerido: EMPLOYEES com LEFT JOIN em DEPARTMENTS e JOBS.

Query 2 — Funcionários por Região (com localização)
● Objetivo: analisar salários e distribuição geográfica (Cidade, Estado ou País).
● Relacionamento sugerido: EMPLOYEES com LEFT JOIN em DEPARTMENTS,
LOCATIONS, COUNTRIES e REGIONS.


<br>
---

### Código das consultas SQL

<br>
---

### Análises Feita em Python (Jupyter Notebook)

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

### Sugestões de melhoria para futuras versões

<br>
---

### 🛠️ Tecnologias Utilizadas

* **Linguagem:** Python (Pandas, Matplotlib, Seaborn), SQL.
* **Base de Dados:** csv.
* **Ambiente:** VS Code / WSL / venv
* **Orquestração:** Lógica celular em Jupyter Notebook.


<br>
---

### 🛠️ Histórico de Commits (git log --oneline)

<br>
