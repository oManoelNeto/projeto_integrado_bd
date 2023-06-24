--Criação da tabela "funcionarios" e seus devidos atributos.
CREATE TABLE funcionarios (
                funcionario_id NUMERIC(100) NOT NULL,
                nome VARCHAR(225) NOT NULL,
                senha VARCHAR(50) NOT NULL,
                foto_perfil BYTEA,
                uf CHAR(2) NOT NULL,
                cidade VARCHAR(100) NOT NULL,
                bairro VARCHAR(100) NOT NULL,
                rua VARCHAR(100) NOT NULL,
                logradouro VARCHAR(100) NOT NULL,
                numero NUMERIC(3) NOT NULL,
                CONSTRAINT pk_funcionarios PRIMARY KEY (funcionario_id)
);

--Adição de comentários para cada tabela.
COMMENT ON TABLE funcionarios IS 'Tabela que vai conter todos os dados sobre os funcionários da empresa.';
COMMENT ON COLUMN funcionarios.funcionario_id IS 'Chave primária da tabela "funcionarios". É a coluna que armazenará o identificador do funcionário.';
COMMENT ON COLUMN funcionarios.nome IS 'Coluna que mostrará o nome de cada funcionário da empresa.';
COMMENT ON COLUMN funcionarios.senha IS 'Coluna que armazenará as senhas dos funcionários da empresa.';
COMMENT ON COLUMN funcionarios.foto_perfil IS 'Coluna que armazenará as fotos de perfil dos usuários da empresa.';
COMMENT ON COLUMN funcionarios.uf IS 'Coluna que armazenará a Unidade Federal onde cada funcionário da empresa reside.';
COMMENT ON COLUMN funcionarios.cidade IS 'Coluna que armazenará a cidade onde cada funcionário da empresa reside.';
COMMENT ON COLUMN funcionarios.bairro IS 'Coluna que armazenará o bairro onde cada funcionário da empresa reside.';
COMMENT ON COLUMN funcionarios.rua IS 'Coluna que armazenará a rua onde cada funcionário da empresa reside.';
COMMENT ON COLUMN funcionarios.logradouro IS 'Coluna que armazenará o Logradouro onde cada funcionário da empresa reside.';
COMMENT ON COLUMN funcionarios.numero IS 'Coluna que armazenará o número da residência onde cada funcionário da empresa reside.';

--Criação da tabela "contato" e seus devidos atributos.
CREATE TABLE contato (
                contato_id NUMERIC(100) NOT NULL,
                mensagem VARCHAR(300) NOT NULL,
                funcionario_id NUMERIC(100) NOT NULL,
                CONSTRAINT pk_contato PRIMARY KEY (contato_id)
);

--Adição de comentários para cada tabela.
COMMENT ON TABLE contato IS 'Tabela que armazenará os contatos realizados pelos funcionários da empresa.';
COMMENT ON COLUMN contato.contato_id IS 'Coluna que mostrará o identificador do contato realizado pelos funcionários da empresa.';
COMMENT ON COLUMN contato.mensagem IS 'Coluna que mostrará a mensagem do contato realizado pelo funcionário da empresa.';
COMMENT ON COLUMN contato.funcionario_id IS 'Chave estrangeira da tabela "contato" que faz referência à chave primária da tabela "funcionarios". Coluna que armazenará o identificador de cada funcionário da empresa.';

--Criação da tabela talentos e seus devidos atributos.
CREATE TABLE talentos (
                talentos_id NUMERIC(100) NOT NULL,
                nome_talento VARCHAR(100) NOT NULL,
                interesse VARCHAR(100) NOT NULL,
                funcionario_id NUMERIC(100) NOT NULL,
                CONSTRAINT pk_talentos PRIMARY KEY (talentos_id)
);

--Adição de comentários para cada tabela.
COMMENT ON TABLE talentos IS 'Tabela que armazenará os talentos dos funcionários da empresa.';
COMMENT ON COLUMN talentos.talentos_id IS 'Chave primária da tabela "talentos". Coluna que mostrará o identificador de cada talento.';
COMMENT ON COLUMN talentos.nome_talento IS 'Coluna que mostrará o nome dos talentos de cada funcionário.';
COMMENT ON COLUMN talentos.interesse IS 'Coluna que mostrará o interesse de cada usuário com o banco de dados.';
COMMENT ON COLUMN talentos.funcionario_id IS 'Chave estrangeira da tabela "talentos" que faz referência à chave primária da tabela "funcionarios".';

--Criação da tabela "cargos" e seus devidos atributos.
CREATE TABLE cargos (
                cargo_id NUMERIC(100) NOT NULL,
                nome_cargo VARCHAR(50) NOT NULL,
                funcionario_id NUMERIC(100) NOT NULL,
                CONSTRAINT pk_cargos PRIMARY KEY (cargo_id)
);

--Adição de comentários para cada tabela.
COMMENT ON TABLE cargos IS 'Tabela que armazenará os cargos dos funcionários da empresa.';
COMMENT ON COLUMN cargos.cargo_id IS 'Coluna que armazenará o identificador de cada cargo da empresa.';
COMMENT ON COLUMN cargos.nome_cargo IS 'Coluna que armazenará os nomes dos cargos da empresa.';
COMMENT ON COLUMN cargos.funcionario_id IS 'Chave estrangeira da tabela "cargos" que faz referência à chave primária da tabela "funcionarios".';

--Criação da tabela "telefones" e seus devidos atributos.
CREATE TABLE telefones (
                funcionario_id NUMERIC(100) NOT NULL,
                pais CHAR(2) NOT NULL,
                ddd CHAR(2) NOT NULL,
                numero CHAR(11) NOT NULL,
                CONSTRAINT pk_telefones PRIMARY KEY (funcionario_id)
);

--Adição de comentários para cada tabela.
COMMENT ON TABLE telefones IS 'Tabela que armazenará os telefones dos funcionários da empresa.';
COMMENT ON COLUMN telefones.funcionario_id IS 'Chave composta da tabela "telefones" com o a tabela "funcionarios". Coluna que armazenará o identificador dos funcionários da empresa.';
COMMENT ON COLUMN telefones.pais IS 'Coluna que armazenará o país do telefone de cada funcionário da empresa.';
COMMENT ON COLUMN telefones.ddd IS 'Coluna que armazenará o DDD do telefone de cada usuário da empresa.';
COMMENT ON COLUMN telefones.numero IS 'Coluna que armazenará o número de telefone de cada usuário da empresa.';

--Criaçao da tabela "emails" e seus devidos atributos.
CREATE TABLE emails (
                funcionario_id NUMERIC(100) NOT NULL,
                email_funcionario VARCHAR(80) NOT NULL,
                CONSTRAINT pk_emails PRIMARY KEY (funcionario_id)
);

--Adição de comentários para cada tabela.
COMMENT ON TABLE emails IS 'Tabela que vai conter os emails dos funcionários da empresa.';
COMMENT ON COLUMN emails.funcionario_id IS 'Chave composta da tabela "emails" entre  a tabela "funcionarios". Coluna que armazenará o identificador dos funcionários da empresa.';
COMMENT ON COLUMN emails.email_funcionario IS 'Coluna que armazenará os emails de cada funcionário.';

--Adição da PFK "funcionario_id" da tabela "funcionarios" à tabela "emails". Formando um relacionamento Identificado.
ALTER TABLE emails ADD CONSTRAINT funcionarios_emails_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da PFK "funcionario_id" da tabela "funcionarios" à tabela "telefones". Formando um relacionamento Identificado,
ALTER TABLE telefones ADD CONSTRAINT funcionarios_telefones_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "funcionario_id" da tabela "funcionarios" à tabela "cargos". Formando um relacionamento Não Identificado.
ALTER TABLE cargos ADD CONSTRAINT funcionarios_cargos_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "funcionario_id" da tabela "funcionarios" à tabela "talentos". Formando um relacionamento Não Identificado.
ALTER TABLE talentos ADD CONSTRAINT funcionarios_talentos_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "funcionario_id" da tabela "funcionarios" à tabela "contato". Formando um relacionamento Não Identificado.
ALTER TABLE contato ADD CONSTRAINT funcionarios_contato_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
