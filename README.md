# Arquitetura de Engenharia e Análise de Dados com Arquitetura Medalhão

---

## Integrantes do Projeto

| Nome do Aluno | Matrícula |
|--------------|-----------|
| William Bernardo da Silva | 222021933 |
| Mateus Henrique Queiroz Magalhães Sousa | 222025950 |

---

## Objetivo do Projeto

O objetivo deste projeto é aplicar conceitos de **engenharia de dados e análise de dados** sobre uma base real de jogadores do jogo **FIFA 21**, estruturando um pipeline de dados baseado na **Arquitetura Medalhão**.

A partir dos dados brutos dos jogadores, o projeto busca:

- Avaliar a **qualidade dos dados** disponíveis
- Identificar inconsistências, valores ausentes e problemas de padronização
- Realizar **tratamento e transformação dos dados**
- Organizar os dados em camadas com diferentes níveis de maturidade
- Preparar uma base confiável para análises futuras sobre desempenho, atributos e características dos jogadores

---

## Contexto do Dataset

O dataset utilizado contém informações detalhadas sobre jogadores do FIFA 21, incluindo:

- Dados pessoais (nome, idade, nacionalidade)
- Informações físicas (altura, peso, pé dominante)
- Dados contratuais (clube, valor, salário, cláusula de rescisão)
- Atributos técnicos e físicos (passe, chute, drible, defesa, físico)
- Métricas gerais de performance (overall, potencial, base stats)

A análise foi realizada inicialmente sobre uma **amostra da camada Raw**, contendo dezenas de colunas, como por exemplo:

- Identificação e URLs (photoUrl, playerUrl, ID)
- Dados gerais (Name, Age, Nationality, Positions)
- Métricas de jogo (OVA, POT, PAC, SHO, PAS, DRI, DEF, PHY)
- Estatísticas detalhadas de ataque, defesa, mentalidade e goleiro

---

## Introdução

Este projeto foi desenvolvido como parte da disciplina **Bancos de Dados II** e tem como foco a construção de uma **arquitetura de engenharia de dados voltada para análise**, utilizando o padrão conhecido como **Arquitetura Medalhão** (Bronze, Silver e Gold).

A arquitetura proposta organiza os dados em diferentes camadas de maturidade, permitindo maior controle de qualidade, rastreabilidade e confiabilidade das informações ao longo do pipeline de dados.

O projeto utiliza **Jupyter Notebooks** como principal ferramenta para:

- Análise exploratória e verificação da qualidade dos dados na camada **Raw/Bronze**
- Identificação de valores nulos, duplicados e inconsistentes
- Tratamento, limpeza e padronização dos dados
- Transformação e ingestão dos dados na camada **Silver**
- Geração de análises gráficas para apoio à tomada de decisão

O armazenamento dos dados tratados é realizado em um banco **PostgreSQL**, executado em ambiente **Docker**, garantindo portabilidade, reprodutibilidade e facilidade na configuração do ambiente.

---

## Arquitetura do Projeto

O projeto segue o padrão **Arquitetura Medalhão**, dividido em camadas bem definidas.

### Camada Bronze (Raw)

- Contém os **dados brutos**, conforme obtidos da fonte original
- Nenhum tratamento estrutural é aplicado
- Utilizada para análise inicial da qualidade dos dados
- Base para identificação de problemas como:
  - Valores ausentes
  - Inconsistências de formato
  - Dados fora do domínio esperado

Arquivos principais:
- `fifa21_raw_data.csv`
- `analytics.ipynb`
- `dicionario_de_dados.pdf`

---

### Camada Silver

- Dados **tratados, limpos e padronizados**
- Remoção ou correção de valores inválidos
- Padronização de nomes de colunas e tipos de dados
- Preparação dos dados para uso analítico
- Persistência dos dados tratados em arquivo CSV e estrutura SQL

A transformação dos dados da camada Raw para Silver é realizada por meio de um **notebook de ETL**, garantindo rastreabilidade das regras aplicadas.

Arquivos principais:
- `etl_raw_to_silver.ipynb`
- `fifa21_silver.csv`
- `ddl.sql`
- `mer_der_dld.pdf`

---

### Camada Gold (conceitual)

- Camada destinada a análises finais e agregações
- Base para consumo por dashboards, relatórios e modelos analíticos
- Não implementada diretamente neste projeto, mas considerada no desenho da arquitetura

---

## Tecnologias Utilizadas

- **Python 3**
- **Jupyter Notebook**
- **Pandas / NumPy**
- **Matplotlib / Seaborn**
- **PostgreSQL**
- **Docker e Docker Compose**
- **Git**

---

## ⚙️ Preparação do Ambiente de Desenvolvimento

### 🔹 1. Clonar o Repositório

```bash
git clone https://github.com/WillxBernardo/DataEngineeringApplication
cd DataEngineeringApplication
```

### 🔹 2. Criar um Ambiente Virtual Python

Recomenda-se o uso de um ambiente virtual para isolamento das dependências do projeto.

```bash
python3 -m venv .venv
```

Ativar o ambiente virtual:

- Linux / macOS

```bash
source venv/bin/activate
```

- Windows

```bash
venv\Scripts\activate
```

### 🔹 3. Instalar as Dependências

Com o ambiente virtual ativado, instale as bibliotecas necessárias:

```bash
pip install -r requirements.txt
```

### 🔹 4. Subir o Banco de Dados PostgreSQL com Docker Compose

O projeto utiliza um banco PostgreSQL configurado via Docker Compose.

Certifique-se de ter o **Docker** e o **Docker Compose** instalados.

Para subir os serviços, execute:

```bash
docker compose up -d
```

Após a execução, o banco PostgreSQL estará disponível conforme as configurações definidas no arquivo `docker-compose.yml`.