-- ============================================================================
-- SILVER LAYER: FIFA 21 COMPLETO
-- Camada Silver - Todos os atributos técnicos e físicos
-- ============================================================================

CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.fifa21_players CASCADE;

CREATE TABLE silver.fifa21_players (
    -- Identificação e Info Básica
    player_id INTEGER PRIMARY KEY,
    long_name VARCHAR(255),
    name VARCHAR(255),
    nationality VARCHAR(100),
    positions VARCHAR(100),
    age INTEGER,
    overall_rating INTEGER, -- (↓OVA)
    potential_rating INTEGER, -- (POT)
    team VARCHAR(255),
    contract_period VARCHAR(100),
    height_cm DECIMAL(5,2),
    weight_kg DECIMAL(5,2),
    preferred_foot VARCHAR(10), -- (foot)
    best_overall_rating INTEGER, -- (BOV)
    best_position CHAR(3), -- (BP)
    growth INTEGER,
    joined_date DATE, -- (Joined)
    
    -- Financeiro
    value_eur DECIMAL(15,2), -- (Value)
    wage_eur DECIMAL(15,2), -- (Wage)
    release_clause_eur DECIMAL(15,2), -- (Release Clause)
    
    -- Ataque (Attacking)
    attacking_total INTEGER,
    crossing INTEGER,
    finishing INTEGER,
    heading_accuracy INTEGER,
    short_passing INTEGER,
    volleys INTEGER,
    
    -- Habilidade (Skill)
    skill_total INTEGER,
    dribbling INTEGER,
    curve INTEGER,
    fk_accuracy INTEGER,
    long_passing INTEGER,
    ball_control INTEGER,
    
    -- Movimentação (Movement)
    movement_total INTEGER,
    acceleration INTEGER,
    sprint_speed INTEGER,
    agility INTEGER,
    reactions INTEGER,
    balance INTEGER,
    
    -- Força/Poder (Power)
    power_total INTEGER,
    shot_power INTEGER,
    jumping INTEGER,
    stamina INTEGER,
    strength INTEGER,
    long_shots INTEGER,
    
    -- Mentalidade (Mentality)
    mentality_total INTEGER,
    aggression INTEGER,
    interceptions INTEGER,
    positioning INTEGER,
    vision INTEGER,
    penalties INTEGER,
    composure INTEGER,
    
    -- Defesa (Defending)
    defending_total INTEGER,
    marking INTEGER,
    standing_tackle INTEGER,
    sliding_tackle INTEGER,
    
    -- Goleiro (Goalkeeping)
    goalkeeping_total INTEGER,
    gk_diving INTEGER,
    gk_handling INTEGER,
    gk_kicking INTEGER,
    gk_positioning INTEGER,
    gk_reflexes INTEGER,
    
    -- Estatísticas Gerais e Específicas
    total_stats INTEGER,
    base_stats INTEGER,
    weak_foot INTEGER, -- (W/F)
    skill_moves INTEGER, -- (SM)
    attack_work_rate VARCHAR(20), -- (A/W)
    defense_work_rate VARCHAR(20), -- (D/W)
    international_reputation INTEGER, -- (IR)
    pace INTEGER, -- (PAC)
    shooting INTEGER, -- (SHO)
    passing INTEGER, -- (PAS)
    dribbling_stat INTEGER, -- (DRI)
    defending_stat INTEGER, -- (DEF)
    physical INTEGER, -- (PHY)
    hits INTEGER,
    
    -- Metadata
    created_at TIMESTAMP DEFAULT NOW()
);

-- ============================================================================
-- ÍNDICES PARA CONSULTAS TÉCNICAS
-- ============================================================================
CREATE INDEX idx_fifa_player_name ON silver.fifa_players(name);
CREATE INDEX idx_fifa_team_name ON silver.fifa_players(team);
CREATE INDEX idx_fifa_rating ON silver.fifa_players(overall_rating);
CREATE INDEX idx_fifa_value_eur ON silver.fifa_players(value_eur);

-- Comentário na tabela
COMMENT ON TABLE silver.fifa_players IS 'Dados completos de jogadores do FIFA 21 processados da camada Bronze';