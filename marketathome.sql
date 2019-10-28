-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Jun-2019 às 05:42
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketathome`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codC` int(11) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `nCartao` varchar(20) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(20) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `n` int(11) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codC`, `cpf`, `nome`, `nCartao`, `cep`, `rua`, `bairro`, `n`, `cidade`, `estado`) VALUES
(1, '12345678910', 'Vinícius Miranda', '707070', '13600000', 'Rua Tal', 'Algum Jardim', 123, 'Cidade X', 'Sólido'),
(2, '32145698702', 'Um Nome', '654123987', '14500123', 'Avenida Dr. Fulano', 'Parque Desconhecido', 420, 'Cidade Y', 'Islâmico'),
(3, '4567890', 'Nome Criativo', '20304050', '10000100', 'Top', 'Legal', 400, 'Bacana', 'Civil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE `entregador` (
  `codE` int(11) NOT NULL,
  `nConta` varchar(20) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `modelo` varchar(40) DEFAULT NULL,
  `cor` varchar(20) NOT NULL,
  `ano` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `entregador`
--

INSERT INTO `entregador` (`codE`, `nConta`, `cpf`, `nome`, `placa`, `modelo`, `cor`, `ano`) VALUES
(1, '101010020202', '55520201111', 'Peter Benjamin Parker', '0613MAR', 'Bis', 'Vermelho', 2002),
(2, '111222333', '44455566677', 'Um Cara', '1234ABC', 'Mod', 'Preto', 2005);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mercado`
--

CREATE TABLE `mercado` (
  `codM` int(11) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `nConta` varchar(20) NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mercado`
--

INSERT INTO `mercado` (`codM`, `cnpj`, `nConta`, `nome`) VALUES
(1, '10010010010010', '1000010000', 'Mercadinho D\'Esquina'),
(2, '22222222222222', '202202202202', 'Super Man-Cado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mercado_disponibiliza_produto`
--

CREATE TABLE `mercado_disponibiliza_produto` (
  `fk_codM` int(11) NOT NULL,
  `fk_codP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mercado_disponibiliza_produto`
--

INSERT INTO `mercado_disponibiliza_produto` (`fk_codM`, `fk_codP`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `codPe` int(11) NOT NULL,
  `fk_codE` int(11) NOT NULL,
  `fk_codC` int(11) NOT NULL,
  `fk_codM` int(11) NOT NULL,
  `obs` varchar(1000) DEFAULT NULL,
  `data` date NOT NULL,
  `tempoMin` int(11) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(20) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `n` int(11) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`codPe`, `fk_codE`, `fk_codC`, `fk_codM`, `obs`, `data`, `tempoMin`, `cep`, `rua`, `bairro`, `n`, `cidade`, `estado`) VALUES
(1, 1, 1, 1, 'Nada pra ver aqui', '2019-06-02', 40, '136000', 'Rua Tal', 'Bairro Qualquer', 123, 'Creative Name City', 'Creative Name State'),
(2, 2, 3, 1, 'Entregador: Não estou achando!\r\nCliente: Vou sair pra procurar...', '2018-11-12', 90, '10010010', NULL, NULL, 20, NULL, NULL),
(3, 2, 2, 2, '', '2019-11-08', 0, '40404040', 'Uma Rua', 'Um Bairro', 20, 'Uma Cidade', 'Um Estado'),
(4, 2, 1, 2, 'Cliente: Top!', '2020-05-09', 15, '66666666', 'Essa Rua', NULL, 2002, 'Aquela Cidade', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_composto_produto`
--

CREATE TABLE `pedido_composto_produto` (
  `fk_codP` int(11) NOT NULL,
  `fk_codPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_composto_produto`
--

INSERT INTO `pedido_composto_produto` (`fk_codP`, `fk_codPE`) VALUES
(1, 1),
(2, 1),
(3, 2),
(5, 3),
(4, 3),
(2, 3),
(2, 4),
(4, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codP` int(11) NOT NULL,
  `preco` float NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `marca` varchar(20) NOT NULL,
  `tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codP`, `preco`, `descricao`, `marca`, `tipo`) VALUES
(1, 5.99, '395g', 'Nestlé', 'Leite Condensado'),
(2, 4.99, '500ml\r\nSabor: Uva', 'DelValle', 'Suco'),
(3, 8, '12 Ovos', 'Ito', 'Ovo'),
(4, 2, 'Sim, o nome não é Bombril...\r\n', 'Palha de Aço', 'Bombril'),
(5, 0.8, '2B', 'Faber Castell', 'Lápis');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codC`);

--
-- Indexes for table `entregador`
--
ALTER TABLE `entregador`
  ADD PRIMARY KEY (`codE`);

--
-- Indexes for table `mercado`
--
ALTER TABLE `mercado`
  ADD PRIMARY KEY (`codM`);

--
-- Indexes for table `mercado_disponibiliza_produto`
--
ALTER TABLE `mercado_disponibiliza_produto`
  ADD KEY `fk_codM` (`fk_codM`),
  ADD KEY `fk_codP` (`fk_codP`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codPe`),
  ADD KEY `fk_codE` (`fk_codE`),
  ADD KEY `fk_codC` (`fk_codC`),
  ADD KEY `pedido_ibfk_3` (`fk_codM`);

--
-- Indexes for table `pedido_composto_produto`
--
ALTER TABLE `pedido_composto_produto`
  ADD KEY `fk_codP` (`fk_codP`),
  ADD KEY `fk_codPE` (`fk_codPE`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `entregador`
--
ALTER TABLE `entregador`
  MODIFY `codE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mercado`
--
ALTER TABLE `mercado`
  MODIFY `codM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codPe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `codP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `mercado_disponibiliza_produto`
--
ALTER TABLE `mercado_disponibiliza_produto`
  ADD CONSTRAINT `mercado_disponibiliza_produto_ibfk_1` FOREIGN KEY (`fk_codM`) REFERENCES `mercado` (`codM`),
  ADD CONSTRAINT `mercado_disponibiliza_produto_ibfk_2` FOREIGN KEY (`fk_codP`) REFERENCES `produto` (`codP`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fk_codE`) REFERENCES `entregador` (`codE`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`fk_codC`) REFERENCES `cliente` (`codC`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`fk_codM`) REFERENCES `mercado` (`codM`);

--
-- Limitadores para a tabela `pedido_composto_produto`
--
ALTER TABLE `pedido_composto_produto`
  ADD CONSTRAINT `pedido_composto_produto_ibfk_1` FOREIGN KEY (`fk_codP`) REFERENCES `produto` (`codP`),
  ADD CONSTRAINT `pedido_composto_produto_ibfk_2` FOREIGN KEY (`fk_codPE`) REFERENCES `pedido` (`codPe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
