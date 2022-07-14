SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica_pet`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm`
--

CREATE TABLE `adm` (
  `id_adm` int(11) NOT NULL,
  `nome_adm` varchar(150) NOT NULL,
  `email_adm` varchar(150) NOT NULL,
  `senha_adm` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adm`
--

INSERT INTO `adm` (`id_adm`, `nome_adm`, `email_adm`, `senha_adm`) VALUES
(19, 'ALANNA', 'alannamaria@gmail.com', '1234'),
(20, 'MARIA', 'alannamaria@alu.ufc.br', 'abcd');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(150) NOT NULL,
  `email_cliente` varchar(150) NOT NULL,
  `cpf_cliente` varchar(14) NOT NULL,
  `data_cadastro_cliente` datetime NOT NULL,
  `celular_cliente` int(15) NOT NULL,
  `rua_cliente` varchar(150) NOT NULL,
  `cidade_cliente` varchar(50) NOT NULL,
  `estado_cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `email_cliente`, `cpf_cliente`, `data_cadastro_cliente`, `celular_cliente`, `rua_cliente`, `cidade_cliente`, `estado_cliente`) VALUES
(30, 'ALANNA MARIA', 'alannamaria@gmail.com', '1234', '0000-00-00 00:00:00', 555, 'conjunto grajau', 'Sobral', 'CE'),
(31, 'LAURA', 'laura@gmail.com', '22', '0000-00-00 00:00:00', 555, 'rua do horto', 'Sobral', 'CE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `obs_consulta` varchar(200) NOT NULL,
  `nome_pet` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `id_pet`, `id_cliente`, `data_consulta`, `hora_consulta`, `obs_consulta`, `nome_pet`) VALUES
(1, 12, 30, '2022-07-13', '10:00:00', 'iii', 'FEIJOADA'),
(2, 13, 30, '2022-07-13', '11:03:00', 'gdss', 'MINGAU'),
(3, 13, 30, '2022-07-13', '12:00:00', 'dd', 'CAFEZINHO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pet`
--

CREATE TABLE `pet` (
  `id_pet` int(11) NOT NULL,
  `nome_pet` varchar(150) NOT NULL,
  `id_cliente` int(15) NOT NULL,
  `data_cadastro_pet` datetime NOT NULL,
  `nome_cliente` varchar(150) NOT NULL,
  `tipo_pet` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pet`
--

INSERT INTO `pet` (`id_pet`, `nome_pet`, `id_cliente`, `data_cadastro_pet`, `nome_cliente`,`tipo_pet`) VALUES
(12, 'FEIJOADA', 30, '13-07-2022 15:00', 'Alanna', 'cachorro'),
(13, 'MINGAU', 30, '13-07-2022 16:00', 'Ana','gato'),
(14, 'JAO', 31, '0000-00-00 00:00:00', 'LAIANA', 'outro');



--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`id_adm`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `fk_consulta_pet` (`id_pet`),
  ADD KEY `fk_consulta_cliente` (`id_cliente`);

--
-- Índices para tabela `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`id_pet`),
  ADD KEY `fk_pet_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adm`
--
ALTER TABLE `adm`
  MODIFY `id_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pet`
--
ALTER TABLE `pet`
  MODIFY `id_pet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_consulta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_consulta_pet` FOREIGN KEY (`id_pet`) REFERENCES `pet` (`id_pet`);

--
-- Limitadores para a tabela `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `fk_pet_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
