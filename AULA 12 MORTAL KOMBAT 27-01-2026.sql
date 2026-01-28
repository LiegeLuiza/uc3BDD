/* Lógico_1: */

CREATE TABLE Jogo_ (
    id_jogo NUMERIC(8) PRIMARY KEY,
    nome_jogo NUMERIC(12),
    categoria VARCHAR(14),
    Data_de_lancamento NUMERIC(8)
);

CREATE TABLE usuario_ (
    id_jogador NUMERIC(8) PRIMARY KEY,
    nome_jogador VARCHAR(340),
    email_jogador VARCHAR(25),
    senha_jogador_ VARCHAR(340),
    data_criacao_da_conta NUMERIC(8),
    fk_ranking_id_ranking NUMERIC(8),
    fk_ranking_id_do_jogador NUMERIC(8),
    fk_ranking_id_do_jogo NUMERIC(8),
    fk_Jogo__id_jogo NUMERIC(8)
);

CREATE TABLE cenario__partida_ (
    id_cenario NUMERIC(8),
    tipo_de_cenario_ VARCHAR(25),
    nome_do_cenario_ NUMERIC(8),
    id_partida NUMERIC(8),
    id_jogo NUMERIC(8),
    id_usuario NUMERIC(8),
    data_da_partida NUMERIC(8),
    pontuacao_ NUMERIC(12),
    fk_ranking_id_ranking NUMERIC(8),
    fk_ranking_id_do_jogador NUMERIC(8),
    fk_ranking_id_do_jogo NUMERIC(8),
    fk_Jogo__id_jogo NUMERIC(8),
    PRIMARY KEY (id_cenario, id_partida, id_jogo, id_usuario)
);

CREATE TABLE personagem_ (
    id_personagem NUMERIC(8) PRIMARY KEY,
    nome_do_personagem VARCHAR(20),
    poder_especial_ VARCHAR(25)
);

CREATE TABLE ranking (
    pontuacao_total_ NUMERIC(8),
    id_ranking NUMERIC(8),
    posicao_do_ranking NUMERIC(2),
    id_do_jogador NUMERIC(8),
    id_do_jogo NUMERIC(8),
    PRIMARY KEY (id_ranking, id_do_jogador, id_do_jogo)
);

CREATE TABLE E__Assoc__1_tem_ (
    fk_usuario__id_jogador NUMERIC(8),
    fk_personagem__id_personagem NUMERIC(8)
);

CREATE TABLE tem (
    fk_cenario__partida__id_cenario NUMERIC(8),
    fk_cenario__partida__id_partida NUMERIC(8),
    fk_cenario__partida__id_jogo NUMERIC(8),
    fk_cenario__partida__id_usuario NUMERIC(8),
    fk_personagem__id_personagem NUMERIC(8)
);
 
ALTER TABLE usuario_ ADD CONSTRAINT FK_usuario__2
    FOREIGN KEY (fk_ranking_id_ranking, fk_ranking_id_do_jogador, fk_ranking_id_do_jogo)
    REFERENCES ranking (id_ranking, id_do_jogador, id_do_jogo)
    ON DELETE RESTRICT;
 
ALTER TABLE usuario_ ADD CONSTRAINT FK_usuario__3
    FOREIGN KEY (fk_Jogo__id_jogo)
    REFERENCES Jogo_ (id_jogo)
    ON DELETE RESTRICT;
 
ALTER TABLE cenario__partida_ ADD CONSTRAINT FK_cenario__partida__2
    FOREIGN KEY (fk_ranking_id_ranking, fk_ranking_id_do_jogador, fk_ranking_id_do_jogo)
    REFERENCES ranking (id_ranking, id_do_jogador, id_do_jogo);
 
ALTER TABLE cenario__partida_ ADD CONSTRAINT FK_cenario__partida__3
    FOREIGN KEY (fk_Jogo__id_jogo)
    REFERENCES Jogo_ (id_jogo);
 
ALTER TABLE E__Assoc__1_tem_ ADD CONSTRAINT FK_E__Assoc__1_tem__1
    FOREIGN KEY (fk_usuario__id_jogador)
    REFERENCES usuario_ (id_jogador);
 
ALTER TABLE E__Assoc__1_tem_ ADD CONSTRAINT FK_E__Assoc__1_tem__2
    FOREIGN KEY (fk_personagem__id_personagem)
    REFERENCES personagem_ (id_personagem);
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_cenario__partida__id_cenario, fk_cenario__partida__id_partida, fk_cenario__partida__id_jogo, fk_cenario__partida__id_usuario)
    REFERENCES cenario__partida_ (id_cenario, id_partida, id_jogo, id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_personagem__id_personagem)
    REFERENCES personagem_ (id_personagem)
    ON DELETE RESTRICT;