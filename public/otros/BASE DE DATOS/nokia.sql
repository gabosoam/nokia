/*
Navicat MySQL Data Transfer

Source Server         : servidor
Source Server Version : 100118
Source Host           : 172.30.0.2:3307
Source Database       : nokia

Target Server Type    : MYSQL
Target Server Version : 100118
File Encoding         : 65001

Date: 2018-03-23 17:10:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla bill',
  `provider` int(11) DEFAULT NULL COMMENT 'Proveedor de los productos',
  `document` tinyint(4) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL COMMENT 'Fecha del comprobante',
  `reference` varchar(255) DEFAULT '' COMMENT 'Referencia del comprobante',
  `user` varchar(255) DEFAULT '' COMMENT 'Usuario que crea el comprobante',
  `state` int(11) DEFAULT '0',
  `client` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `providerbill` (`provider`) USING BTREE,
  KEY `client` (`client`) USING BTREE,
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', '2', '4', '2017-10-02', 'EXISTENCIAS TOTALES', '40', '1', null, '1');
INSERT INTO `bill` VALUES ('100', '1', '4', '2018-02-01', 'INGRESO FANS', '40', '1', null, '1');
INSERT INTO `bill` VALUES ('101', null, '3', '2018-02-02', 'ENTREGA', '40', '1', '1', '2');
INSERT INTO `bill` VALUES ('102', null, null, '2018-01-19', 'ENTREGA', '40', '1', '8', '2');
INSERT INTO `bill` VALUES ('103', null, null, '2018-02-01', 'ENTREGA', '40', '1', '9', '2');
INSERT INTO `bill` VALUES ('104', '4', '1', '2018-01-25', 'INGRESO', '40', '1', null, '1');
INSERT INTO `bill` VALUES ('105', '1', '1', '2018-01-29', 'INGRESO', '40', '1', null, '1');
INSERT INTO `bill` VALUES ('106', null, null, '2017-11-16', 'ENTREGA', '40', '1', '10', '2');
INSERT INTO `bill` VALUES ('107', null, null, '2018-02-01', 'ENTREGA', '40', '1', '9', '2');
INSERT INTO `bill` VALUES ('108', null, null, '2017-11-24', 'ENTREGA', '40', '1', '11', '2');
INSERT INTO `bill` VALUES ('109', null, null, '2018-01-09', 'ENTREGA', '40', '1', '12', '2');
INSERT INTO `bill` VALUES ('110', null, null, '2018-01-12', 'ENTREGA', '40', '1', '12', '2');
INSERT INTO `bill` VALUES ('111', null, null, '2018-01-18', 'ENTREGA', '40', '1', '12', '2');
INSERT INTO `bill` VALUES ('113', null, null, '2018-02-02', 'ENTREGA', '40', '1', '12', '2');
INSERT INTO `bill` VALUES ('120', '7', '4', '2018-02-26', 'INGRESO', '40', '1', null, '1');
INSERT INTO `bill` VALUES ('121', null, null, '2018-03-01', 'ENTREGA', '40', '1', '1', '2');
INSERT INTO `bill` VALUES ('123', null, null, '2018-03-01', 'ENTREGA', '40', '1', '13', '2');
INSERT INTO `bill` VALUES ('124', '7', '4', '2018-03-09', 'INGRESO', '40', '1', null, '1');
INSERT INTO `bill` VALUES ('125', null, null, '2018-03-12', 'PRUEBAS NOKIA', '40', '1', '12', '2');
INSERT INTO `bill` VALUES ('126', '7', '2', '2018-03-12', 'RCDIPRAN-12-03-2018', '40', '1', null, '1');
INSERT INTO `bill` VALUES ('127', '7', '2', '2018-03-20', 'RCDMPLSIP-20-03-2018', '40', '1', null, '1');

-- ----------------------------
-- Table structure for billdetail
-- ----------------------------
DROP TABLE IF EXISTS `billdetail`;
CREATE TABLE `billdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `fdr` varchar(255) DEFAULT 'N/A',
  `cso` varchar(255) DEFAULT 'N/A',
  `wbs` varchar(255) DEFAULT 'N/A',
  `location` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT 'N/A',
  `area` varchar(255) DEFAULT 'N/A',
  `contrato` varchar(255) DEFAULT 'N/A',
  `cant` int(11) DEFAULT '1',
  `price` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `billfk` (`bill`) USING BTREE,
  KEY `locationfk` (`location`) USING BTREE,
  KEY `productfk` (`product`) USING BTREE,
  CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`location`) REFERENCES `location` (`id`),
  CONSTRAINT `billdetail_ibfk_3` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4025 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of billdetail
-- ----------------------------
INSERT INTO `billdetail` VALUES ('1409', '1', '1', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'DEVOLUCION CARLOS LONDOÑO (DARWIN CANCHIGNIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1410', '1', '2', 'LEVEL-001-15', 'N/A', 'N/A', '10', 'N/A', 'NO UTILIZAR PARA LEVEL 3 PERTENECE A ALU YA FUE REEMPLAZADA', 'LEVEL 3', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1411', '1', '3', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK (NO UTILIZAR PARA LEVEL 3)', 'LEVEL 3', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1412', '1', '4', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK (NO UTILIZAR PARA LEVEL 3)', 'LEVEL 3', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1413', '1', '6', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR DAVID MEDINA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1414', '1', '5', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR DAVID MEDINA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1415', '1', '7', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '10', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL (WBS: ECL02NODOB-EC1-IP60043 CSO: 1010874994)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1416', '1', '8', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'ENTREGA LYDY AGUIRRE (COLOMBIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1417', '1', '9', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'ENTREGA LYDY AGUIRRE (COLOMBIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1418', '1', '10', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'ENTREGA LYDY AGUIRRE (COLOMBIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1419', '1', '11', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'ENTREGA LYDY AGUIRRE (COLOMBIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1420', '1', '12', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'ENTREGA LYDY AGUIRRE (COLOMBIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1421', '1', '13', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'DEVOLUCION LYDY AGUIRRE/ERICK MATEO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1422', '1', '14', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'ENTREGA LYDY AGUIRRE (COLOMBIA) DEVOLUCION TRANSNEXA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1423', '1', '15', 'POR-122-16', '1010874994', 'ECL02NODOB-EC1-IP60043', '10', 'N/A', 'N/A', 'IPRAN FASE I', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1424', '1', '804', 'TRANS-002-17', '1011030506', 'ECL14ARRES-EC1-A009800', '12', 'N/A', 'N/A', 'TRANSNEXA', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1425', '1', '17', 'POR-123-16', '1010874994', 'ECL02NODOB-EC1-IP60043', '10', 'N/A', 'N/A', 'IPRAN FASE I', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1426', '1', '805', 'TRANS-003-17', '1011030506', 'ECL14ARRES-EC1-A009800', '12', 'N/A', 'N/A', 'TRANSNEXA', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1427', '1', '19', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'GUÍA AÉREA 3696860134 STOCK CLARO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1428', '1', '20', 'CNT-RAI-277', '1011023191', 'ECL01EXP3G-EC1-WL12135', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S:11W357P10055', '3G EXP FASE 4', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1429', '1', '21', 'CNT-RAI-021', 'N/A', 'ECL01RED3G-EC1-MA53052', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 12W359P10097', 'RED-3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1430', '1', '22', 'CNT-RAI-113', 'N/A', 'ECL01RED3G-EC1-MA53052', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 11W357P10079', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1431', '1', '23', 'CNT-RAI-029', 'N/A', 'ECL01RED3G-EC1-MA53052', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 11W357P10082', 'RED 3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1432', '1', '24', 'CNT-RAI-030', 'N/A', 'ECL01RED3G-EC1-MA53052', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 11W351P10163', 'RED 3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1433', '1', '25', 'CNT-RAI-023', 'N/A', 'ECL01RED3G-EC1-MA53052', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 12W359P10027', 'RED 3G ', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1434', '1', '26', 'N/A', '1011023191', 'ECL01EXP3G-EC1-WL12135', '13', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL (WBS:ECL01EXP3G-EC1-WL12135 CSO: 1011023191)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1435', '1', '27', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1436', '1', '28', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1437', '1', '29', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1438', '1', '30', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1439', '1', '31', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1440', '1', '32', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1441', '1', '33', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1442', '1', '34', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE (SE ENCUENTRA SUCIA CON OLLIN SE INFORMA A LYDY E INDICA QUE SE LIMPIE)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1443', '1', '35', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE (SE ENCUENTRA SUCIA CON OLLIN SE INFORMA A LYDY E INDICA QUE SE LIMPIE)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1444', '1', '36', 'POR-143-16', '1011498861', 'ECL02FASE6-EC1-A009700', '11', 'N/A', 'N/A', 'IPRAN FASE', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1445', '1', '37', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1446', '1', '38', 'POR-102-15', '1010874994', 'ECL02NODOB-EC1-IP60043', '11', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: NS11496E471', 'IPRAN FASE 6', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1447', '1', '39', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1448', '1', '40', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1449', '1', '41', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1450', '1', '42', 'POR-0014-13', '1010984495', 'ECL02RTS12-EC1-MA53053', '14', 'N/A', 'IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1451', '1', '43', 'CNTD-187-15', '1010873236', 'ECL01DSL10-EC1-MA53061', '15', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1452', '1', '44', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'DEVOLUCION MIRAN MENDOZA CONTRATO CN-0628-2014 ( NO SE REALIZO EL CAMBIO POR DEVOLVER TARJETA SCRAP )', 'CN-0628-2014', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1453', '1', '45', 'CNTD-106-16A', 'N/A', 'ECL01UPR27-EC1-A090600', '15', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1454', '1', '46', 'N/A', 'N/A', 'N/A', '16', 'N/A', 'DEVOLUCION DE REPUESTOS PARA MANTENIMIENTO DE CONTRATO 287', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1455', '1', '47', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1456', '1', '48', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'DEVOLUCION MIRAN MENDOZA CONTRATO CN-0628-2014 ( NO SE REALIZO EL CAMBIO POR DEVOLVER TARJETA SCRAP )', 'CN-0628-2014', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1457', '1', '49', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1458', '1', '50', 'CNTD-202-16', 'N/A', '1011308639-EC1-A090600', '15', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1459', '1', '51', 'CNTD-188-15', '1010873236', 'ECL01DSL10-EC1-MA53061', '15', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1460', '1', '52', 'CNTD-003-16', '1011284615', 'ECL01MACC5-EC1-A020690', '15', 'N/A', 'DOA RECHAZADO', 'CN-0457-2014', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1461', '1', '53', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1462', '1', '54', 'CNTD-022-16', '1010878401', 'ECL01ACCE1-EC1-MA53061', '15', 'N/A', 'ENVIADO A REPARAR POR ISRAEL CARDENAS', 'CN-0254-2011', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1463', '1', '55', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1464', '1', '56', 'CNTD-020-16', '1010878401', 'ECL01ACCE1-EC1-MA53061', '15', 'N/A', 'ENVIADO A REPARAR POR ISRAEL CARDENAS', 'CN-0254-2011', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1465', '1', '57', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'OFICIO (O&MPA-01-15) ESCUELA DEL MILENIO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1466', '1', '58', 'CNTD-057-17', '1011308639', '1011308639-EC1-A090600', '15', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: CU111631273', 'CN-0628-2014', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1467', '1', '59', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1468', '1', '60', 'CNTD-176-15', '1010873236', 'ECL01DSL10-EC1-MA53061', '15', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1469', '1', '61', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1470', '1', '62', 'N/A', 'N/A', 'N/A', '15', 'N/A', '(DEVOLUCION DE MANTENIMIENTO DEL CN-4300000287) ENTREGA ISRAEL CARDENAS', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1471', '1', '63', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1472', '1', '64', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGA JUAN RECALDE. SALES ORDER 2501996352', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1473', '1', '65', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1474', '1', '66', 'CNTD-200-16', 'N/A', '1011308639-EC1-A090600', '15', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1475', '1', '67', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1476', '1', '68', 'CNTD-260-13', 'N/A', 'N/A', '15', 'N/A', 'NUMERO DE SERIE CAMBIADA CN-0394-2010 (CNTD-260-13)', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1477', '1', '69', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1478', '1', '70', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1479', '1', '71', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1480', '1', '72', 'N/A', 'N/A', 'N/A', '15', 'N/A', '(DEVOLUCION DE MANTENIMIENTO DEL CN-4300000287) ENTREGA ISRAEL CARDENAS', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1481', '1', '73', 'CNT-219-14', '1011069152', 'ECL01MIGEN-EC1-A007300', '15', 'N/A', 'NO UTILIZAR CORRESPONDE AL ESPARE REEMPLAZO DE LA TARJETA CON N/S: CU133070135', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1482', '1', '74', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1483', '1', '75', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1484', '1', '76', 'N/A', 'N/A', 'N/A', '15', 'N/A', '(DEVOLUCION DE MANTENIMIENTO DEL CN-4300000287) ENTREGA ISRAEL CARDENAS', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1485', '1', '77', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1486', '1', '78', 'CNTD-201-16', '1011445976', 'ECL01MACCS-EC1-A008200', '15', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1487', '1', '79', 'CNTD-204-16', '1011445976', 'ECL01MACCS-EC1-A008200', '15', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1488', '1', '80', 'CNTD-151-14', 'N/A', 'N/A', '15', 'N/A', 'NO UTILIZAR PENDIENTE DE ENTREGA FREDDY POTES', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1489', '1', '81', 'CNTD-062-15', 'N/A', 'ECL01MACC4-EC1-A020690', '15', 'N/A', 'MARCELO UNDA', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1490', '1', '82', 'CNTD-108-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '15', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1491', '1', '83', 'CNTEP-GYE.2015-335', '1010873236', 'ECL01DSL10-EC1-MA53061', '15', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: CU131770042', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1492', '1', '84', 'CNTEP-GYE-2015-338', '1010878401', 'ECL01ACCE1-EC1-MA53061', '15', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: CU111130689', 'CN-0254-2011', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1493', '1', '85', 'MSANLRMCHE01', '1010873236', 'ECL01DSL10-EC1-MA53061', '15', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: CU111631398', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1494', '1', '86', 'CNTD-208-15', '1011069152', 'ECL01MIGEN-EC1-A007300', '15', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: CU111830365', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1495', '1', '87', 'CNTD-193-15', '1011284615', 'ECL01MACC5-EC1-A020690', '15', 'N/A', 'DOA RECHAZADO', 'CN-0457-2014', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1496', '1', '88', 'CNTD-180-14', 'N/A', 'N/A', '18', 'N/A', 'IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1497', '1', '89', 'CNTD-021-16', '1010878401', 'ECL01ACCE1-EC1-MA53061', '15', 'N/A', 'ENVIADO A REPARAR POR ISRAEL CARDENAS', 'CN-0254-2011', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1498', '1', '90', 'CNTD-004-16', '1011284615', 'ECL01MACC5-EC1-A020690', '15', 'N/A', 'DOA RECHAZADO', 'CN-0457-2014', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1499', '1', '91', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1500', '1', '92', 'CNTEP-GYE-2015-340', '1010873236', 'ECL01DSL10-EC1-MA53061', '15', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: CU111631442', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1501', '1', '93', 'CNTD-112-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '15', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1502', '1', '94', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1503', '1', '95', 'CNTD-222-16', '1011308639', '1011308639-EC1-A090600', '15', 'N/A', 'N/A', 'CN-0083-2015', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1504', '1', '96', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1505', '1', '97', 'CNTD-203-16', 'N/A', '1011308639-EC1-A090600)', '15', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1506', '1', '98', 'CNTD-225-16', 'N/A', 'ECL01UPR27-EC1-A090600)', '15', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1507', '1', '99', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADA DE RCD (TARJETA DE 2 VECES ENTREGADA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1508', '1', '100', 'CNT-080-2016', '1011329050', 'ECL01MACC4-EC1-A020690', '16', 'N/A', 'N/A', 'CN-0083-2015', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1509', '1', '101', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1510', '1', '102', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1511', '1', '103', 'CNTD-221-16', '1011308639', '1011308639-EC1-A090600', '15', 'N/A', 'N/A', 'CN-0083-2015', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1512', '1', '104', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1513', '1', '105', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '3', '0.00');
INSERT INTO `billdetail` VALUES ('1514', '1', '106', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '3', '0.00');
INSERT INTO `billdetail` VALUES ('1515', '1', '107', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGADO POR DANIEL DAVILA', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1516', '1', '108', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '5', '0.00');
INSERT INTO `billdetail` VALUES ('1517', '1', '108', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '2', '0.00');
INSERT INTO `billdetail` VALUES ('1518', '1', '109', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '10', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1519', '1', '110', 'POR-021-16', '1010874994', 'ECL02NODOB-EC1-IP60043', '10', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: NS100960634', 'IPRAN FASE VI', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1520', '1', '111', 'POR-043-15', '1011249399', 'ECL02IPR13-EC1-A009700', '10', 'N/A', 'N/A', 'IPRAN FASE XIII', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1521', '1', '112', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1522', '1', '113', 'N/A', '1010930773', 'ECL02IPRF8-EC1-IP60043', '14', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1523', '105', '114', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'NO UTILIZAR PARA LEVEL 3 ENVIO DE BODEGA FLEX.NET PARA LEVEL 3', 'LEVEL 3', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1524', '1', '115', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '15', '0.00');
INSERT INTO `billdetail` VALUES ('1525', '1', '116', 'CNT-3G-1001-15', 'ALEC500217', 'ECL01MTCNT-EC1-A029090', '20', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1526', '1', '117', 'CNT-3G-1054-14', 'ALEC500217', 'ECL01RED3G-EC1-WL19056', '21', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1527', '1', '118', 'LTE-4G-069-14', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '21', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1528', '1', '119', 'CNT-3G-1023-15', 'N/A', 'N/A', '21', 'N/A', 'DOA RECHAZADO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1529', '1', '120', 'CNT-3G-1013-16', '1011023191', 'ECL01EXP3G-EC1-WL12135', '21', 'N/A', 'N/A', '3G EXP', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1530', '1', '121', 'N/A', 'N/A', 'N/A', '21', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1531', '1', '122', 'CNT-RAI-115', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S:YP13420D847 SE ENVIO A CINETO GYE ( ACTUALIZACION) REGRESO EL 28-12-2016', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1532', '1', '123', 'CNT-RAI-144', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP1124111F1', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1533', '1', '124', 'CNT-RAI-143', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP1102187C9', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1534', '1', '125', 'CNT-RAI-244', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP1216052DC', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1535', '1', '126', 'CNT-RAI-176', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP11300C619', '3G FASE 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1536', '1', '127', 'CNT-RAI-136', 'N/A', 'ECL01RED3G-EC1-MA53052', '22', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S:YP1141021B1 IRREPARABLE', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1537', '1', '128', 'CNT-RAI-043', 'N/A', 'ECL01RED3G-EC1-MA53052', '22', 'N/A', 'IRREPARABLE', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1538', '1', '129', 'N/A', 'N/A', 'N/A', '20', 'N/A', 'TARJETA DE GYE ( SE DESCONOCE EL ESTADO )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1539', '1', '130', 'CNTD-010-17', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'N/A', 'RED 3G FASE 1', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1540', '1', '131', 'CNT-3G-1067-14', 'ALEC500217', 'ECL01RED3G-EC1-WL19056', '20', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1541', '1', '132', 'N/A', 'N/A', 'N/A', '20', 'N/A', 'SE REEMPLAZO CNT (REEMPLAZA AL N/S:YP1051111CA) ESTABA EN GYE SE HIZO LAS PRUEBAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1542', '1', '133', 'CNT-3G-1045-14', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '20', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1543', '1', '134', 'CNT-3G-1047-14', 'ALEC500217', 'ECL01RED3G-EC1-WL19056', '20', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1544', '1', '135', 'N/A', 'N/A', 'N/A', '20', 'N/A', 'TARJETA DE GYE ( SE DESCONOCE EL ESTADO )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1545', '1', '136', 'N/A', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '20', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1546', '1', '137', 'CNTD-011-17', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'N/A', 'RED 3G FASE 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1547', '1', '138', 'CNT-3G-1001-17', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP131006043', '3G FASE 1', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1548', '1', '139', 'CNT-3G-1002-17', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP13050BAE7', '3G FASE 1', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1549', '1', '140', 'CNTD-008-17', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'N/A', 'RED 3G FASE 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1550', '1', '141', 'CNTD-009-17', '1011023191', 'ECL01EXP3G-EC1-WL12135', '20', 'N/A', 'N/A', 'RED 3G EXP FASE 4', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1551', '1', '142', 'CNT-3G-1004-17', 'N/A', 'N/A', '20', 'N/A', 'DOA RECHAZADO', 'RED 3G FASE1', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1552', '1', '143', 'CNT-RAI-226', '1011023191', 'ECL01EXP3G-EC1-WL12135', '20', 'N/A', 'N/A', 'RED 3G EXP 4', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1553', '1', '144', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'DEVOLUCION DE REPUESTOS PARA MANTENIMIENTO DE CONTRATO 287', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1554', '1', '145', 'CNTD-372-14', 'N/A', 'N/A', '23', 'N/A', 'CN-4300000251 (CNTD-372-14)', 'CN-4300000251', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1555', '1', '146', 'CNTD-093-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '23', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1556', '1', '147', 'CNTD-062-14', 'N/A', 'N/A', '24', 'N/A', 'SE ENCUENTRA INCLUIDO EN EL FD-7302 CON NUMERO DE SERIE YP1216070BB', 'CN-4300000055', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1557', '1', '148', 'CNTD-351-14', 'N/A', 'N/A', '23', 'N/A', 'N/A', 'CN-4300000251', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1558', '1', '149', 'CNTD-181-15', 'N/A', 'N/A', '23', 'N/A', 'DOA RECHAZADO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1559', '1', '150', 'CNTD-356-14', 'N/A', 'N/A', '23', 'N/A', 'N/A', 'CN-4300000251', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1560', '1', '151', 'CNTD-257-14', 'N/A', 'N/A', '23', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1561', '1', '152', 'CNTD-092-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '23', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1562', '1', '153', 'CNTD-094-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '23', 'N/A', 'VENTILADOR FLOJO', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1563', '1', '154', 'CNTD-085-13', 'N/A', 'N/A', '25', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1564', '1', '155', '3FE29192AAAA06', 'N/A', 'N/A', '25', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1565', '1', '156', '3FE29192AAAA06', 'N/A', 'N/A', '25', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1566', '1', '157', '3FE29192AAAA06', 'N/A', 'N/A', '25', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1567', '1', '158', '3FE29192AAAA06', 'N/A', 'N/A', '25', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1568', '1', '159', '3FE29192AAAA06', 'N/A', 'N/A', '25', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1569', '1', '160', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1570', '1', '161', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1571', '1', '162', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1572', '1', '163', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1573', '1', '164', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1574', '1', '165', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1575', '1', '166', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1576', '1', '167', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1577', '1', '168', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1578', '1', '169', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1579', '1', '170', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1580', '1', '171', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1581', '1', '172', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1582', '1', '173', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1583', '1', '174', 'N/A', 'N/A', 'N/A', '22', 'N/A', 'IMPORTACION ELTEK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1584', '1', '175', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '2', '0.00');
INSERT INTO `billdetail` VALUES ('1585', '1', '175', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '3', '0.00');
INSERT INTO `billdetail` VALUES ('1586', '1', '176', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1587', '1', '177', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016) NEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1588', '1', '178', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR FLEXNET PARA HECTOR MESA PERO INDICA QUE SE INGRESA AL INVENTARIO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1589', '1', '179', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1590', '1', '180', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1591', '1', '181', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1592', '1', '182', 'N/A', '1010874994', 'ECL02NODOB-EC1-IP60043', '11', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1593', '1', '183', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCION LYDY AGUIRRE (CLARO)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1594', '1', '184', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1595', '1', '185', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1596', '1', '186', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1597', '1', '187', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA PAUL GUERRA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1598', '1', '188', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1599', '1', '189', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1600', '1', '190', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1601', '1', '191', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1602', '1', '192', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'DEVUELVE DANIEL DAVILA ( UTILIZADO PARA REPUESTOS )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1603', '1', '193', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'NO HAY REGISTRO EN RCD', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1604', '1', '194', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1605', '1', '195', 'LTE-4G-065-14', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '20', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1606', '1', '196', 'CNTD-148-16', 'N/A', 'ECL01EXP3G-EC1-WL19061', '20', 'N/A', 'N/A', '3G EXP.', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1607', '1', '197', 'CNT-3G-1062-14', 'ALEC500216', 'ECL01RED3G-EC1-WL19057', '20', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1608', '1', '198', 'CNT-3G-1060-14', 'ALEC500216', 'ECL01RED3G-EC1-WL19057', '20', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1609', '1', '199', 'CNT-RAI-159', 'N/A', 'ECL01RED3G-EC1-MA53052', '20', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP12270FC7D', '3G FASE 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1610', '1', '200', 'CNTD-063-14', 'N/A', 'N/A', '24', 'N/A', 'INCLUYE EL EMA-AFAN CON NUMERO DE SERIE: YP123600320', 'CN-4300000055', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1611', '1', '201', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '15', '0.00');
INSERT INTO `billdetail` VALUES ('1612', '1', '202', 'N/A', 'N/A', 'N/A', '22', 'N/A', '(DEVOLUCION A INVENTARIO AR: 1-6683385) IRREPARABLE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1613', '1', '203', 'N/A', 'N/A', 'N/A', '13', 'N/A', '(DEVOLUCION A INVENTARIO AR: 1-6689650)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1614', '1', '204', 'CNTD-088-16', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1615', '1', '205', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1616', '1', '206', 'CNT-3G-1010-16', '1011023191', 'ECL01EXP3G-EC1-WL12135', '19', 'N/A', 'N/A', '3G EXP', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1617', '1', '207', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1618', '1', '208', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1619', '1', '209', 'N/A', 'N/A', 'N/A', '19', 'N/A', '(DEVOLUCION A INVENTARIO AR: 1-6663951)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1620', '1', '210', 'N/A', 'N/A', 'N/A', '13', 'N/A', '(DEVOLUCION A INVENTARIO AR: 1-6689650)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1621', '1', '211', 'CNTD-089-16', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1622', '1', '212', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1623', '1', '213', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1624', '1', '214', 'N/A', 'N/A', 'N/A', '13', 'N/A', '(DEVOLUCION A INVENTARIO AR: 1-6689650)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1625', '1', '215', 'CNT-RAI-391', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1626', '1', '216', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'DEVOLUCION A INVENTARIO AR: 1-6457696', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1627', '1', '217', 'CNT-3G-1036-15', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1628', '1', '218', 'CNT-3G-1014-15', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '22', 'N/A', 'IRREPARABLE', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1629', '1', '219', 'LTE-4G-011-15', '1011280984', '1011280984-EC1-A020180', '22', 'N/A', 'IRREPARABLE', 'LTE FASE 5', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1630', '1', '220', 'CNT-RAI-053', '1011023191', 'ECL01EXP3G-EC1-WL12135', '22', 'N/A', 'IRREPARABLE', '3G EXP', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1631', '1', '221', 'CNT-RAI-054', 'N/A', 'ECL01RED3G-EC1-MA53052', '19', 'N/A', 'INGRESO POR PEDIDO DE MARIBEL HERRERA', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1632', '1', '222', 'CNT-3G-1011-15', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '19', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1633', '1', '223', 'CNT-3G-1013-15', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '19', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1634', '1', '224', 'CNTD-086-14', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1635', '1', '225', 'CNT-3G-1012-15', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '19', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1636', '1', '226', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'REPUESTOS ELTEK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1637', '1', '227', 'CNTD-086-16', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1638', '1', '228', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1639', '1', '229', 'CNTD-085-14', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1640', '1', '230', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'REPUESTOS ELTEK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1641', '1', '231', 'CNTD-087-16', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1642', '1', '232', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1643', '1', '233', 'CNTD-244-13', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1644', '1', '234', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1645', '1', '235', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1646', '1', '236', 'N/A', 'N/A', 'N/A', '19', 'N/A', '(DEVOLUCION A INVENTARIO AR: 1-6663958)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1647', '1', '237', 'N/A', 'N/A', 'N/A', '19', 'N/A', '(DEVOLUCION A INVENTARIO AR: 1-6713683)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1648', '1', '238', 'N/A', 'N/A', 'N/A', '13', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1649', '1', '239', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'REPUESTOS ELTEK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1650', '1', '240', 'CNT-RAI-393', 'N/A', 'N/A', '18', 'N/A', 'MARCELO UNDA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1651', '1', '241', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'COSAS DE LA BODEGA DEL 1 PISO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1652', '1', '242', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'SE RETIRA DEL PRIMER PISO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1653', '1', '243', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1654', '1', '244', 'CNTD-267-13', 'N/A', 'N/A', '17', 'N/A', 'CN-0394-2010', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1655', '1', '245', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE DANIEL DÁVILA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1656', '1', '246', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1657', '1', '247', 'CNTD-206-16', '1011445976', 'ECL01MACCS-EC1-A008200', '17', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1658', '1', '248', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1659', '1', '249', 'CNTD-205-16', '1011445976', 'ECL01MACCS-EC1-A008200', '17', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1660', '1', '250', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ (SIN MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1661', '1', '251', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE DANIEL DAVILA', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1662', '1', '252', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1663', '1', '253', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1664', '1', '254', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1665', '1', '255', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1666', '1', '256', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1667', '1', '257', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1668', '1', '258', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1669', '1', '259', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1670', '1', '260', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1671', '1', '261', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1672', '1', '262', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1673', '1', '263', 'CNTD-305-12', 'N/A', 'N/A', '16', 'N/A', 'FDR: CNTD-305-12 CONTRATO: 0394-2010 (TARJETA REPARADA Y PROBADA)', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1674', '1', '264', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVOLUCION ISRAEL CARDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1675', '1', '265', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1676', '1', '266', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVOLUCION ISRAEL CARDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1677', '1', '267', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEOLUCION ISRAEL CARDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1678', '1', '268', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVOLUCION ISRAEL CARDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1679', '1', '269', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1680', '1', '270', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1681', '1', '271', 'CNTD-097-16', '1010873236', 'ECL01DSL10-EC1-MA53061', '17', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1682', '1', '272', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1683', '1', '273', 'CNTD-066-16', '1011308639', 'ECL01MACC4-EC1-A020690', '17', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1684', '1', '274', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1685', '1', '275', 'CNTD-189-16', '1011454451', 'ECL01MACCS-EC1-A020690', '17', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1686', '1', '276', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1687', '1', '277', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1688', '1', '278', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL (MAQUETA ALU)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1689', '1', '279', 'N/A', 'N/A', 'N/A', '12', 'N/A', '(NO UTILIZAR PARA LEVEL 3) ENVIO DE BODEGA FLEX.NET PARA LEVEL 3', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1690', '105', '280', 'N/A', 'N/A', 'N/A', '12', 'N/A', '(NO UTILIZAR PARA LEVEL 3)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1691', '105', '281', 'TRANS-001-17', '1011030506', 'ECL14ARRES-EC1-A009800', '12', 'N/A', 'N/A', 'TRANSNEXA', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1692', '105', '282', 'POR-031-15', '1010874994', 'ECL02NODOB-EC1-IP60043', '12', 'N/A', 'N/A', 'TRANSNEXA', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1693', '1', '283', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1694', '1', '284', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1695', '1', '285', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1696', '1', '286', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1697', '1', '287', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1698', '1', '288', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1699', '1', '289', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1700', '1', '290', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1701', '1', '291', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1702', '1', '292', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1703', '1', '293', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1704', '1', '294', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1705', '1', '295', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1706', '1', '296', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1707', '1', '297', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1708', '1', '298', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1709', '1', '299', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1710', '1', '300', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1711', '1', '301', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1712', '1', '302', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1713', '1', '303', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1714', '1', '304', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1715', '1', '305', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1716', '1', '306', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1717', '1', '307', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1718', '1', '308', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1719', '1', '309', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1720', '1', '310', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1721', '1', '311', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1722', '1', '312', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1723', '1', '313', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1724', '1', '314', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1725', '1', '315', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1726', '1', '316', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1727', '1', '317', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1728', '1', '318', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1729', '1', '319', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1730', '1', '320', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1731', '1', '321', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1732', '1', '322', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1733', '1', '323', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1734', '1', '324', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1735', '1', '325', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1736', '1', '326', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1737', '1', '327', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1738', '1', '328', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1739', '1', '329', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1740', '1', '330', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1741', '1', '331', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1742', '1', '332', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1743', '1', '333', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1744', '1', '334', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1745', '1', '335', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1746', '1', '336', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1747', '1', '337', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1748', '1', '338', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1749', '1', '339', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1750', '1', '340', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1751', '1', '341', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1752', '1', '342', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1753', '1', '343', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1754', '1', '344', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1755', '1', '345', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1756', '1', '346', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1757', '1', '347', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1758', '1', '348', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1759', '1', '349', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1760', '1', '350', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1761', '1', '351', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1762', '1', '352', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1763', '1', '353', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1764', '1', '354', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1765', '1', '355', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1766', '1', '356', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1767', '1', '357', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1768', '1', '358', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1769', '1', '359', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1770', '1', '360', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1771', '1', '361', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1772', '1', '362', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1773', '1', '363', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1774', '1', '364', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1775', '1', '365', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1778', '105', '368', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1779', '105', '369', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1780', '1', '370', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1781', '105', '371', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1782', '1', '372', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1783', '105', '373', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1784', '105', '374', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA DE BODEGA FLEXNET (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1785', '1', '375', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1786', '1', '376', 'N/A', 'N/A', 'N/A', '10', 'N/A', '(NO UTILIZAR PARA LEVEL 3) ENTREGA FLEXNET', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1787', '1', '377', 'CNTD-309-14', 'N/A', 'N/A', '17', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1788', '1', '378', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE DANIEL DAVILA', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1789', '1', '379', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1790', '1', '380', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL (POR PROBAR)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1791', '1', '381', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1792', '1', '382', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1793', '1', '383', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'DEVUELVE DANIEL DAVILA', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1794', '1', '384', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1795', '1', '385', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1796', '1', '386', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGADO POR DANIEL DAVILA', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1797', '1', '387', 'CNTD-054-14', 'N/A', 'ECL01DSL10-EC1-MA53061', '17', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1798', '1', '388', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1799', '1', '389', 'CNTD-057-14', 'N/A', 'ECL01DSL10-EC1-MA53061', '17', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1800', '1', '390', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1801', '1', '391', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1802', '1', '392', 'CNTD-151-15', '1010873236', 'ECL01DSL10-EC1-MA53061', '17', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1803', '1', '393', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1804', '1', '394', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1805', '1', '395', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1806', '1', '396', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK', 'N/A', '3', '0.00');
INSERT INTO `billdetail` VALUES ('1807', '1', '396', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '3', '0.00');
INSERT INTO `billdetail` VALUES ('1808', '1', '396', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '2', '0.00');
INSERT INTO `billdetail` VALUES ('1809', '1', '396', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '6', '0.00');
INSERT INTO `billdetail` VALUES ('1810', '1', '397', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '9', '0.00');
INSERT INTO `billdetail` VALUES ('1811', '1', '398', 'CNT-RAI-205', 'N/A', 'ECL01RED3G-EC1-MA53052', '19', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP11181490B', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1812', '1', '399', 'CNT-RAI-042', 'N/A', 'ECL01RED3G-EC1-MA53052', '22', 'N/A', 'IRREPARABLE 3G REEMPLAZO DEL N/S: SH1219X006D', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1813', '1', '400', 'CNT-RAI-066', 'N/A', 'N/A', '13', 'N/A', 'BODEGA FLEXNET', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1814', '1', '401', 'CNT-RAI-061', 'N/A', 'ECL01RED3G-EC1-MA53052)', '13', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1815', '1', '402', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1816', '1', '403', 'CNTD-313-14', 'N/A', 'N/A', '23', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1817', '1', '404', 'CNTD-340-14', 'N/A', 'N/A', '23', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1818', '1', '405', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1819', '1', '406', 'N/A', 'N/A', 'N/A', '27', 'N/A', '( COSAS DE LA BODEGA DEL 1 PISO )}', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1820', '1', '407', 'CNTDSLAM-005-2015', '1010873236', 'ECL01DSL10-EC1-MA53061', '27', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP1231T441F )', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1821', '1', '408', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA ISRAEL CÁRDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1822', '1', '409', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1823', '1', '410', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'DEVOLUCION POR EL CAMBIO REALIZADO A LUIS CUENCA CNT SHUSHUFINDI', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1824', '1', '411', 'CNTD-314-14', 'N/A', 'N/A', '27', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1825', '1', '412', 'CNTD-138-16', '1011454458', 'ECL01MACCS-EC1-A020690', '27', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1826', '1', '413', 'CNTDSLAM-002-2015', '1010873236', 'ECL01DSL10-EC1-MA53061', '27', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: AA1327FE3YS', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1827', '1', '414', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA ISRAEL CÁRDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1828', '1', '415', 'CNTD-153-15', '1011284615', 'ECL01MACC5-EC1-A020690', '27', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1829', '1', '416', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1830', '1', '417', 'CNTD-338-14', 'N/A', 'N/A', '27', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1831', '1', '418', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA DANIEL DÁVILA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1832', '1', '419', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA ISRAEL CÁRDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1833', '1', '420', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA ISRAEL CÁRDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1834', '1', '421', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA ISRAEL CÁRDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1835', '1', '422', 'CNTDSLAM-006-2015', '1010873236', 'ECL01DSL10-EC1-MA53061', '27', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP1329T5214', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1836', '1', '423', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1837', '1', '424', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1838', '1', '425', 'CNTDSLAM-003-2015', '1010873236', 'ECL01DSL10-EC1-MA53061', '27', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP10291C3C3', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1839', '1', '426', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'DEVOLUCION FLAVIO HERRERA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1840', '1', '427', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'ENTREGA ISRAEL CÁRDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1841', '1', '428', 'CNTDSLAM-004-2015', '1010873236', 'ECL01DSL10-EC1-MA53061', '27', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP1329T520A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1842', '1', '429', 'CNTDSLAM-001-2015', '1010873236', 'ECL01DSL10-EC1-MA53061', '27', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: YP10390F20D', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1843', '1', '430', 'CNTD-311-14', 'N/A', 'N/A', '27', 'N/A', 'MIGRACIÓN DE CENTRALES', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1844', '1', '431', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1845', '1', '432', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1846', '1', '433', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1847', '1', '434', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1848', '1', '435', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1849', '1', '436', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1850', '1', '437', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1851', '1', '438', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1852', '1', '439', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1853', '1', '440', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1854', '1', '441', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1855', '1', '442', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1856', '1', '443', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1857', '1', '444', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1858', '1', '445', 'N/A', 'N/A', 'N/A', '28', 'N/A', '( COSAS DE LA BODEGA DEL 1 PISO )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1859', '1', '446', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1860', '1', '447', 'CNTD-113-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '28', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1861', '1', '448', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1862', '1', '449', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1863', '1', '450', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ISRAEL CÁRDENAS (SIN FLASH MEMORY)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1864', '1', '451', 'CNTD-127-16', '1011454458', 'ECL01MACCS-EC1-A020690', '25', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1865', '1', '452', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1866', '1', '453', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1867', '1', '454', 'CNTD-143-16', '1011454458', 'ECL01MACCS-EC1-A020690', '28', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1868', '1', '455', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1869', '1', '456', 'N/A', 'N/A', 'N/A', '28', 'N/A', '( COSAS DE LA BODEGA DEL 1 PISO )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1870', '1', '457', 'CNTD-016-16', '1011281386', '1011281386-EC1-A030640', '25', 'N/A', 'N/A', 'TRIAL VOIP', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1871', '1', '458', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1872', '1', '459', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1873', '1', '460', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1874', '1', '461', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1875', '1', '462', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1876', '1', '463', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1877', '1', '464', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1878', '1', '465', 'CNTD-139-16', '1011454458', 'ECL01MACCS-EC1-A020690', '25', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1879', '1', '466', 'N/A', 'N/A', 'N/A', '28', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1880', '1', '467', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1881', '1', '468', 'N/A', 'N/A', 'N/A', '29', 'N/A', '( COSAS DE LA BODEGA DEL 1 PISO )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1882', '1', '469', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1883', '1', '470', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1884', '1', '471', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1885', '1', '472', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1886', '1', '473', 'N/A', 'N/A', 'N/A', '25', 'N/A', '( COSAS DE LA BODEGA DEL 1 PISO )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1887', '1', '474', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1888', '1', '475', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1889', '1', '476', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1890', '1', '477', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1891', '1', '478', 'N/A', 'N/A', 'N/A', '25', 'N/A', '( COSAS DE LA BODEGA DEL 1 PISO )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1892', '1', '479', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1893', '1', '480', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1894', '1', '481', 'N/A', 'N/A', 'N/A', '25', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1895', '1', '482', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1896', '1', '483', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1897', '1', '484', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1898', '1', '485', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1899', '1', '486', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1900', '1', '487', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1901', '1', '488', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1902', '1', '489', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1903', '1', '490', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1904', '1', '491', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1905', '1', '492', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1906', '1', '493', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1907', '1', '494', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1908', '1', '495', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1909', '1', '496', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1910', '1', '497', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1911', '1', '498', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1912', '1', '499', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1913', '1', '500', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1914', '1', '501', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1915', '1', '502', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1916', '1', '503', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1917', '1', '504', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1918', '1', '505', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1919', '1', '506', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1920', '1', '507', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1921', '1', '508', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1922', '1', '509', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1923', '1', '510', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1924', '1', '511', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1925', '1', '512', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1926', '1', '513', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1927', '1', '514', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1928', '1', '515', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1929', '1', '516', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1930', '1', '517', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1931', '1', '518', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1932', '1', '519', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1933', '1', '520', 'N/A', 'N/A', 'N/A', '23', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1934', '1', '521', 'CNTD-142-16', '1011454458', 'ECL01MACCS-EC1-A020690', '29', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1935', '1', '522', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'GUIA AEREA: CDG-803079 FLAVIO HERRERA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1936', '1', '523', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1937', '1', '524', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1938', '1', '525', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1939', '1', '526', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVOLUCION DE MANTENIMIENTO DEL CN-4300000287 ENTREGA ISRAEL CARDENAS', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1940', '1', '527', 'N/A', 'N/A', 'N/A', '30', 'N/A', '(DEVOLUCION DE MANTENIMIENTO DEL CN-4300000287) ENTREGA ISRAEL CARDENAS', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1941', '1', '528', 'N/A', 'N/A', 'N/A', '30', 'N/A', '(DEVOLUCION DE MANTENIMIENTO DEL CN-4300000287) ENTREGA ISRAEL CARDENAS', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1942', '1', '529', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA TELYNETWORKING NOTA DE ENTREGA 500', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1943', '1', '530', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1944', '1', '531', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1945', '1', '532', 'CNTD-061-16', '1011329050', 'ECL01MACC4-EC1-A020690', '30', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1946', '1', '533', 'N/A', 'N/A', 'N/A', '16', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1947', '1', '534', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA TELYNETWORKING NOTA DE ENTREGA 500', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1948', '1', '535', 'CNTD-060-16', '1011329050', 'ECL01MACC4-EC1-A020690', '30', 'N/A', '( REEMPLAZO DE LA TARJETA CON N/S: CU103470959)', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1949', '1', '536', 'CNTD-017-16', '1010878401', 'ECL01ACCE1-EC1-MA53061', '18', 'N/A', 'PENDIENTE ENTREGA A CNT IRREPARABLE', 'CN-0254-2011', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1950', '1', '537', 'CNTD-019-16', '1010878401', 'ECL01ACCE1-EC1-MA53061', '30', 'N/A', 'PENDIENTE ENTREGA A CNT', 'CN-0254-2011', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1951', '1', '538', 'CNTD-192-16', '1011454451', 'ECL01MACCS-EC1-A020690', '30', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1952', '1', '539', 'CNTD-065-16', '1010873236', 'ECL01DSL10-EC1-MA53061', '30', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1953', '1', '540', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1954', '1', '541', 'N/A', 'N/A', 'N/A', '16', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1955', '1', '542', 'CNTD-149-15', '1010873236', 'ECL01DSL10-EC1-MA53061', '30', 'N/A', 'DEVUELTA DE ENOKANQUI', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1956', '1', '543', 'CNTD-366-14', 'N/A', 'N/A', '16', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1957', '1', '544', 'CNTD-065-17', '1011308639', '1011308639-EC1-A090600', '30', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1958', '1', '545', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1959', '1', '546', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVOLUCION DE REPUESTOS PARA MANTENIMIENTO DE CONTRATO 287', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1960', '1', '547', 'CNTD-144-15', '1010873236', 'ECL01DSL10-EC1-MA53061', '30', 'N/A', 'DEVUELTA DE ENOKANQUI', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1961', '1', '548', 'CNTD-015-16', '1011064908', 'ECL01ACC13-EC1-A007300', '30', 'N/A', 'N/A', 'CN-4300000251', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1962', '1', '549', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1963', '1', '550', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1964', '1', '551', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1965', '1', '552', 'CNTD-337-13', 'N/A', 'N/A', '18', 'N/A', 'IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1966', '1', '553', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1967', '1', '554', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1968', '1', '555', 'CNTD-252-14', 'N/A', 'N/A', '30', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1969', '1', '556', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVUELVE ANDRES MONTENEGRO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1970', '1', '557', 'CNTD-076-14', 'N/A', 'N/A', '29', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1971', '1', '558', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'DANIEL DAVILA PRUEBAS REALIZADAS OK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1972', '1', '559', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1973', '1', '560', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1974', '1', '561', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1975', '1', '562', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1976', '1', '563', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'COSAS DE LA BODEGA DEL 1 PISO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1977', '1', '564', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA ANDRÉS MONTENEGRO OFICIO 8-8-2016 (INCLUYE MEMORIA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1978', '1', '565', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1979', '1', '566', 'CNTD-064-17', '1011308639', '1011308639-EC1-A090600', '18', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1980', '1', '567', 'CNTD-114-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '18', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1981', '1', '568', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1982', '1', '569', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1983', '1', '570', 'CNTD-198-16', '1011445976', 'ECL01MACCS-EC1-A008200', '18', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1984', '1', '571', 'CNTD-196-16', '1011445976', 'ECL01MACCS-EC1-A008200', '18', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1985', '1', '572', 'CNTD-091-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '30', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1986', '1', '573', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1987', '1', '574', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1988', '1', '575', 'CNTD-199-16A', 'N/A', '1011308639-EC1-A090600)', '18', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1989', '1', '576', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1990', '1', '577', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1991', '1', '578', 'CNTD-101-15', '1010873236', 'ECL01DSL10-EC1-MA53061', '17', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1992', '1', '579', 'N/A', 'N/A', 'N/A', '17', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1993', '1', '580', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1994', '1', '581', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1995', '1', '582', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1996', '1', '583', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1997', '1', '584', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1998', '1', '585', 'N/A', 'N/A', 'N/A', '29', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('1999', '1', '586', 'CNT-RAI-060', 'N/A', 'ECL01RED3G-EC1-MA53052', '13', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: SH1145X00V9', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2000', '1', '587', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA EDISON ZAPATA(DANIEL DAVILA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2001', '1', '588', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA JAVIER VILLAGRAN', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2002', '1', '589', 'N/A', 'N/A', 'N/A', '18', 'N/A', '(DEVOLUCION DE MANTENIMIENTO DEL CN-4300000287) ENTREGA ISRAEL CARDENAS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2003', '1', '590', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA RICHARD ENCALADA - BODEGA CINETO GUAYAQUIL-INCLUYE 2 HERRAJES DE SUJECCION SIN TORNILLOS', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2004', '1', '591', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2005', '1', '592', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2006', '1', '593', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2007', '1', '594', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2008', '1', '595', 'CNT-3G-1004-15', 'ALEC500217', 'ECL01MTCNT-EC1-A015025', '21', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2009', '1', '596', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2010', '1', '597', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2011', '1', '598', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2012', '1', '599', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2013', '1', '600', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2014', '1', '601', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2015', '1', '602', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2016', '1', '603', 'LTE-4G-004-16', '1010883109', 'ECL01LTEGT-EC1-A020180', '12', 'N/A', 'N/A', 'LTE', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2017', '1', '604', 'LTE-4G-002-16', '1010883109', 'ECL01LTEGT-EC1-A020180', '12', 'N/A', 'N/A', 'LTE', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2018', '1', '605', 'LTE-4G-003-16', '1010883109', 'ECL01LTEGT-EC1-A020180', '12', 'N/A', 'N/A', 'LTE', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2019', '1', '606', 'LTE-4G-005-16', '1011103174', 'ECL01LTEGT-EC1-A020180', '12', 'N/A', 'N/A', '4G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2020', '1', '607', 'LTE-4G-001-16', '1010883109', 'ECL01LTEGT-EC1-A020180', '12', 'N/A', 'N/A', '4G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2021', '1', '608', 'CNT-RAI-275', 'N/A', 'ECL01EXP3G-EC1-WL12135', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S:13W345D70163', '3G EXP FASE 4', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2022', '1', '609', 'CNT-RAI-222', 'N/A', 'ECL01RED3G-EC1-MA53052', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 13W329D70040', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2023', '1', '610', 'CNT-3G-1013-16', 'N/A', 'N/A', '12', 'N/A', 'DOA RECHAZADO', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2024', '1', '611', 'CNT-RAI-219', 'N/A', 'N/A', '12', 'N/A', ' DOA RECHAZADO', '3G EXP', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2025', '1', '612', 'CNT-RAI-257', '1011023191', 'ECL01EXP3G-EC1-WL12135', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 13W346D70387', '3G EXP FASE 4', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2026', '1', '613', 'CNT-RAI-274', '1011023191', 'ECL01EXP3G-EC1-WL12135', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 13W366D70112', '3G EXP FASE 5', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2027', '1', '614', 'CNT-RAI-270', 'N/A', 'ECL01EXP3G-EC1-WL12135 1011023191', '12', 'N/A', 'REEMPLAZO DE LA TARJETA CON N/S: 13W335D70618', '3G EXP 4', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2028', '1', '615', 'CNT-RAI-217', 'N/A', 'N/A', '12', 'N/A', 'DOA RECHAZADO', '3G EXP', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2029', '1', '616', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'DEVUELVE DANIEL DAVILA', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2030', '1', '617', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'ENTREGA EDISON ZAPATA ( NO USBRE FALLA )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2031', '1', '618', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2032', '1', '619', 'CNTD-353-14', '1011069152', 'ECL01MIGEN-EC1-A007300', '31', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2033', '1', '620', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'ENTREGA EDISON ZAPATA ( NO USBRE FALLA )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2034', '1', '621', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'DEVUELVE EDISON ZAPATA (SALIDA UNA RIEL)', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2035', '1', '622', 'CNTD-190-16', '1011454451', 'ECL01MACCS-EC1-A020690', '31', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2036', '1', '623', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGADO POR JUAN RECALDE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2037', '1', '624', 'CNTD-195-12', 'N/A', 'N/A', '16', 'N/A', 'CNTD-195-12', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2038', '1', '625', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE (MARCA FINISAR) (3HE00062CB)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2039', '1', '626', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVOLUCION DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2040', '1', '627', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGA LYDY AGUIRRE (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2041', '1', '628', 'N/A', 'N/A', 'N/A', '15', 'N/A', 'ENTREGA LYDY AGUIRRE (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2042', '1', '629', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2043', '1', '630', 'N/A', 'N/A', 'N/A', '10', 'N/A', '(NO UTILIZAR PARA LEVEL 3) ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2044', '105', '631', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2045', '1', '632', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK (TRANSNEXA NUEVO REQUERIMIENTO)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2046', '1', '633', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA LYDY AGUIRRE (TRANSNEXA NUEVO REQUERIMIENTO)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2047', '1', '634', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA LYDY AGUIRRE (TRANSNEXA NUEVO REQUERIMIENTO)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2048', '1', '635', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA LYDY AGUIRRE (TRANSNEXA NUEVO REQUERIMIENTO)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2049', '1', '636', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK (TRANSNEXA NUEVO REQUERIMIENTO)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2050', '1', '637', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2051', '1', '638', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE (DEVOLUCION LILIANA GUANGA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2052', '1', '639', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE (DEVOLUCION LILIANA GUANGA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2053', '1', '640', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2054', '1', '641', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2055', '1', '642', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2056', '1', '643', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2057', '1', '644', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2058', '1', '645', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2059', '1', '646', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2060', '1', '647', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2061', '1', '648', 'N/A', 'N/A', 'N/A', '10', 'N/A', '(NO UTILIZAR PARA LEVEL 3) ENTREGA FLEXNET', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2062', '1', '649', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCION DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2063', '1', '650', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA DE BODEGA FLEXNET (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2064', '1', '651', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA DE BODEGA FLEXNET (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2065', '1', '652', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA DE BODEGA FLEXNET (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2066', '1', '653', 'N/A', 'N/A', 'N/A', '10', 'N/A', 'ENTREGA DE BODEGA FLEXNET (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2067', '1', '654', 'N/A', 'N/A', 'N/A', '10', 'N/A', '(NO UTILIZAR PARA LEVEL 3) ENTREGA FLEXNET', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2068', '1', '655', 'CNT-RAI-325', '1011023191', 'ECL01EXP3G-EC1-WL12135', '19', 'N/A', ' AR GESTIONADO)', 'RED 3G EXPANSION FASE 6', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2069', '1', '656', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '9', '0.00');
INSERT INTO `billdetail` VALUES ('2070', '1', '657', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'FACTURA 10115-1 GUÍA H749437¡Y0001¡OSAO¡', 'N/A', '3', '0.00');
INSERT INTO `billdetail` VALUES ('2071', '1', '658', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2072', '1', '659', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2073', '1', '660', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2074', '1', '657', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'REPUESTO ELTEK (FACTURA 002 - N. 000905REV1)', 'N/A', '3', '0.00');
INSERT INTO `billdetail` VALUES ('2075', '1', '661', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2076', '1', '662', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2077', '1', '663', 'N/A', 'N/A', 'N/A', '19', 'N/A', 'IMPORTACION ELTEK GUIA NO. 1001-7456142 ( DOS CAJAS FACTURAS 09014-04016)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2078', '1', '664', 'CNTMSAN-002-2016', '1011069152', 'ECL01MIGEN-EC1-A007300', '30', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2079', '1', '665', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2080', '1', '666', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'DEVOLUCION DE MANABI POR CAMBIO LOCAL (IRREPARABLE)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2081', '1', '667', 'CNTMSAN-001-2016', '1011069152', 'ECL01MIGEN-EC1-A007300', '30', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2082', '1', '668', 'N/A', '1011214016', 'ECL01MACC2-EC1-A020690', '16', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'CN-0331-2014 ASCAZUBI', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2083', '1', '669', 'CNTD-018-16', '1010878401', 'ECL01ACCE1-EC1-MA53061', '30', 'N/A', 'PENDIENTE ENTREGA A CNT', 'CN-0254-2011', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2084', '1', '670', 'CNTD-025-16', '1010873236', 'ECL01DSL10-EC1-MA53061', '30', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2085', '1', '671', 'CNTD-193-16', '1011454451', 'ECL01MACCS-EC1-A020690', '30', 'N/A', 'N/A', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2086', '1', '672', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'IRREPARABLE SANDRA CORTEZ', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2087', '1', '673', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'DEVOLUCION DE REPUESTOS PARA MANTENIMIENTO DE CONTRATO 287', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2088', '1', '674', 'N/A', '1011284615', 'ECL01MACC5-EC1-A020690', '30', 'N/A', 'DEVOLUCION EDISON ZAPATA', 'CN-0457-2014 ALAUSI', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2089', '1', '675', 'CNTD-194-16', '1011069152', 'ECL01MIGEN-EC1-A007300', '18', 'N/A', 'IRREPARABLE', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2090', '1', '676', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2091', '1', '677', 'CNTD-062-16', 'N/A', 'N/A', '30', 'N/A', '(FDR: CNTD-062-16 DOA RECHAZADO) (CN-4300000380)', 'CN-4300000380', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2092', '1', '678', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA TELYNETWORKING NOTA DE ENTREGA 500', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2093', '1', '679', 'CNTD-365-14', 'N/A', 'N/A', '30', 'N/A', 'N/A', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2094', '1', '680', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2095', '1', '681', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA GIOVANNY CHAVEZ', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2096', '1', '682', 'CNTD-218-14', '1010873236', 'ECL01DSL10-EC1-MA53061', '18', 'N/A', 'IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2097', '1', '683', 'N/A', 'N/A', 'N/A', '30', 'N/A', 'ENTREGA EDIZON ZAPATA ( TARJETAS DE MAQUETA TELPROYEC)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2098', '1', '684', 'CNTD-075-15', '1011069152', 'ECL01MIGEN-EC1-A007300', '30', 'N/A', 'N/A', 'CN-4300000287', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2099', '1', '685', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA IRREPARABLE', 'CN-0394-2010', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2100', '1', '686', 'N/A', 'N/A', 'N/A', '16', 'N/A', 'DEVUELVE DANIEL DÁVILA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2101', '1', '687', 'N/A', 'N/A', 'N/A', '18', 'N/A', 'ENTREGA DANIEL DÁVILA (IRREPARABLE)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2102', '1', '688', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCION ENTREGADO POR LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2103', '1', '689', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCION ENTREGADO POR LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2104', '105', '690', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA) ENTREGA DE BODEGA FLEXNET', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2105', '1', '691', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2106', '1', '692', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCIÓN LILIANA GUANGA DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2107', '1', '693', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'DEVOLUCION DINA LINK', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2108', '1', '694', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2109', '1', '695', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'ENTREGA DE BODEGA FLEXNET (NO UTILIZAR PARA TRANSNEXA) (DEVOLUCION GYE)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2110', '1', '696', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2111', '1', '697', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2112', '1', '698', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA LYDY AGUIRRE', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2373', '100', '699', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2374', '100', '700', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2375', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2376', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2377', '100', '703', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2378', '100', '704', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2379', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2380', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2381', '100', '705', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2382', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2383', '100', '706', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2384', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2385', '100', '707', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-005)', '3G EXP 1 (U_GYE5178_SAUCES_9) TT-000000912869', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2386', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-005)', '3G EXP 1 (U_GYE5178_SAUCES_9) TT-000000912869', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2387', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-005)', '3G EXP 1 (U_GYE5178_SAUCES_9) TT-000000912869', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2388', '100', '708', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-006)', '3G 2 (U_GYE5068_BELLAVISTA) TT-000000912870', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2389', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-006)', '3G 2 (U_GYE5068_BELLAVISTA) TT-000000912870', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2390', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-006)', '3G 2 (U_GYE5068_BELLAVISTA) TT-000000912870', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2391', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2392', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2393', '100', '709', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2394', '100', '710', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2395', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2396', '100', '711', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2397', '100', '712', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2398', '100', '713', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2399', '100', '714', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2400', '100', '715', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2401', '100', '716', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2402', '100', '717', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2403', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2404', '100', '718', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2405', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2406', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2407', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2408', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2409', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2410', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2411', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2412', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2413', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2414', '100', '719', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2415', '100', '720', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2416', '100', '721', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2417', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2418', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2419', '100', '722', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2420', '100', '723', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2421', '100', '724', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2422', '100', '725', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2423', '100', '726', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2424', '100', '727', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2425', '100', '728', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2426', '100', '729', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2427', '100', '730', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2428', '100', '731', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2429', '100', '732', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2430', '100', '733', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2431', '100', '734', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2432', '100', '735', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2433', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2434', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2435', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2436', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2437', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2438', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2439', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2440', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2441', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2442', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2443', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2444', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2445', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2446', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2447', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2448', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2449', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2450', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2451', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2452', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2453', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2454', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2455', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2456', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2457', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2458', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2459', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2460', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2461', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2462', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2463', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2464', '100', '736', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2465', '100', '737', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2466', '100', '738', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2467', '100', '739', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2468', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2469', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2470', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2471', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2472', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2473', '100', '740', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2474', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2475', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2476', '100', '741', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2477', '100', '742', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2478', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2479', '100', '743', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2480', '100', '744', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2481', '100', '745', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2482', '100', '746', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2483', '100', '747', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2484', '100', '748', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2485', '100', '749', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2486', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2487', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2488', '100', '750', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2489', '100', '751', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2490', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2491', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2492', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2493', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2494', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2495', '100', '752', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2496', '100', '753', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2497', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2498', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2499', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2500', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2501', '100', '754', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2502', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2503', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2504', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2505', '100', '755', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2506', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2507', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2508', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2509', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2510', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2511', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2512', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2513', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2514', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2515', '100', '756', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2516', '100', '757', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2517', '100', '758', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2518', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2519', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2520', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2521', '100', '760', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-011)', '3G EXP 2 (U_GYE5396_EL_EMPALME_SUR) TT-000000915345', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2522', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-011)', '3G EXP 2 (U_GYE5396_EL_EMPALME_SUR) TT-000000915345', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2523', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-011)', '3G EXP 2 (U_GYE5396_EL_EMPALME_SUR) TT-000000915345', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2524', '100', '761', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-012)', '3G EXP 1 (U_GYE5395_EL_EMPALME) TT-000000915447', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2525', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-012)', '3G EXP 1 (U_GYE5395_EL_EMPALME) TT-000000915447', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2526', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-012)', '3G EXP 1 (U_GYE5395_EL_EMPALME) TT-000000915447', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2527', '100', '762', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-013)', '3G EXP 1 (U_GYE5919_COW_D_DAULE_PERIPA) TT-000000915346', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2528', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-013)', '3G EXP 1 (U_GYE5919_COW_D_DAULE_PERIPA) TT-000000915346', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2529', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-013)', '3G EXP 1 (U_GYE5919_COW_D_DAULE_PERIPA) TT-000000915346', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2530', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-014)', '3G EXP 2 (U_GYE5385_BALZAR) TT-000000915448', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2531', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-014)', '3G EXP 2 (U_GYE5385_BALZAR) TT-000000915448', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2532', '100', '763', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-014)', '3G EXP 2 (U_GYE5385_BALZAR) TT-000000915448', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2533', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-015)', '3G EXP 2 (U_GYE5386_COLIMES) TT-000000915350', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2534', '100', '764', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-015)', '3G EXP 2 (U_GYE5386_COLIMES) TT-000000915350', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2535', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-015)', '3G EXP 2 (U_GYE5386_COLIMES) TT-000000915350', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2536', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2537', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2538', '100', '765', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2539', '100', '766', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2540', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2541', '100', '767', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2542', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2543', '100', '768', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2544', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-018)', '3G 2 (U_GYE5054_JADE) TT-000000916153', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2545', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-018)', '3G 2 (U_GYE5054_JADE) TT-000000916153', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2546', '100', '769', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-018)', '3G 2 (U_GYE5054_JADE) TT-000000916153', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2547', '100', '770', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-019)', '3G EXP 3 (U_GYE5247_SUCRE_SUR) TT-000000916071', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2548', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-019)', '3G EXP 3 (U_GYE5247_SUCRE_SUR) TT-000000916071', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2549', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-019)', '3G EXP 3 (U_GYE5247_SUCRE_SUR) TT-000000916071', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2550', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-020)', '3G EXP 2 (U_GYE5544_CANUTO) TT-000000916164', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2551', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-020)', '3G EXP 2 (U_GYE5544_CANUTO) TT-000000916164', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2552', '100', '771', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-020)', '3G EXP 2 (U_GYE5544_CANUTO) TT-000000916164', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2553', '100', '772', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2554', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2555', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2556', '100', '773', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2557', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-022)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000916166', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2558', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-022)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000916166', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2559', '100', '774', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-022)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000916166', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2560', '100', '775', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-023)', '3G EXP 1 (U_GYE5470_SAN_PLACIDO) TT-000000916170', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2561', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-023)', '3G EXP 1 (U_GYE5470_SAN_PLACIDO) TT-000000916170', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2562', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-023)', '3G EXP 1 (U_GYE5470_SAN_PLACIDO) TT-000000916170', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2563', '100', '776', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-024)', '3G EXP 3 (U_GYE5460_PORTOVIEJO_LA_ROTONDA) TT-000000916890', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2564', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-024)', '3G EXP 3 (U_GYE5460_PORTOVIEJO_LA_ROTONDA) TT-000000916890', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2565', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-024)', '3G EXP 3 (U_GYE5460_PORTOVIEJO_LA_ROTONDA) TT-000000916890', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2566', '100', '777', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-025)', '3G 1 (U_GYE5454_PORTOVIEJO_NOR) TT-000000916893', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2567', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-025)', '3G 1 (U_GYE5454_PORTOVIEJO_NOR) TT-000000916893', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2568', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-025)', '3G 1 (U_GYE5454_PORTOVIEJO_NOR) TT-000000916893', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2569', '100', '778', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-026)', '3G EXP 1 (U_GYE5463_RIO_PORTOVIEJO) TT-000000916957', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2570', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-026)', '3G EXP 1 (U_GYE5463_RIO_PORTOVIEJO) TT-000000916957', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2571', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-026)', '3G EXP 1 (U_GYE5463_RIO_PORTOVIEJO) TT-000000916957', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2572', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-027)', '3G EXP 2 (U_GYE5531_CIUDAD_DEL_MAR) TT-000000917910', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2573', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-027)', '3G EXP 2 (U_GYE5531_CIUDAD_DEL_MAR) TT-000000917910', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2574', '100', '779', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-027)', '3G EXP 2 (U_GYE5531_CIUDAD_DEL_MAR) TT-000000917910', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2575', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-028)', '3G EXP 2 (U_GYE5719_ZARUMA) TT-000000918613', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2576', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-028)', '3G EXP 2 (U_GYE5719_ZARUMA) TT-000000918613', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2577', '100', '780', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-028)', '3G EXP 2 (U_GYE5719_ZARUMA) TT-000000918613', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2578', '100', '781', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-029)', '3G EXP 1 (U_GYE5717_PORTOVELO) TT-000000918622', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2579', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-029)', '3G EXP 1 (U_GYE5717_PORTOVELO) TT-000000918622', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2580', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-029)', '3G EXP 1 (U_GYE5717_PORTOVELO) TT-000000918622', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2581', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-030)', '3G 2 (U_GYE5064_LAGUNA_CLUB) TT-000000919413', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2582', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-030)', '3G 2 (U_GYE5064_LAGUNA_CLUB) TT-000000919413', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2583', '100', '782', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-030)', '3G 2 (U_GYE5064_LAGUNA_CLUB) TT-000000919413', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2584', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-031)', '3G 2 (U_GYE5060_SAN_IGNACIO_DE_LOYOLA) TT-000000919455', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2585', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-031)', '3G 2 (U_GYE5060_SAN_IGNACIO_DE_LOYOLA) TT-000000919455', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2586', '100', '783', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-031)', '3G 2 (U_GYE5060_SAN_IGNACIO_DE_LOYOLA) TT-000000919455', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2587', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-032)', '3G 1 (U_GYE5288_ESTRELLA_DE_BELEN) TT-000000919461', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2588', '100', '784', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-032)', '3G 1 (U_GYE5288_ESTRELLA_DE_BELEN) TT-000000919461', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2589', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-032)', '3G 1 (U_GYE5288_ESTRELLA_DE_BELEN) TT-000000919461', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2590', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-033)', '3G EXP 3 (U_GYE5123_ALBORADA_ESTE) TT-000000919462', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2591', '100', '785', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-033)', '3G EXP 3 (U_GYE5123_ALBORADA_ESTE) TT-000000919462', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2592', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-033)', '3G EXP 3 (U_GYE5123_ALBORADA_ESTE) TT-000000919462', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2593', '100', '786', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2594', '100', '787', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2595', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2596', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2597', '100', '788', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2598', '100', '789', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2599', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2600', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2601', '100', '790', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-036)', '3G EXP 3 (U_GYE5232_CDLA_SIMON_BOLIVAR) TT-000000920673', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2602', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-036)', '3G EXP 3 (U_GYE5232_CDLA_SIMON_BOLIVAR) TT-000000920673', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2603', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-036)', '3G EXP 3 (U_GYE5232_CDLA_SIMON_BOLIVAR) TT-000000920673', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2604', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-037)', '3G EXP 1 (U_GYE5533_MANTA_LA_VICTORIA) TT-000000920772', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2605', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-037)', '3G EXP 1 (U_GYE5533_MANTA_LA_VICTORIA) TT-000000920772', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2606', '100', '791', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-037)', '3G EXP 1 (U_GYE5533_MANTA_LA_VICTORIA) TT-000000920772', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2607', '100', '792', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-038)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000920778', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2608', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-038)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000920778', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2609', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-038)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000920778', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2610', '100', '793', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-039)', '3G EXP 2 (U_GYE5515_MANTA_SAN_ANTONIO) TT-000000920804', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2611', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-039)', '3G EXP 2 (U_GYE5515_MANTA_SAN_ANTONIO) TT-000000920804', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2612', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-039)', '3G EXP 2 (U_GYE5515_MANTA_SAN_ANTONIO) TT-000000920804', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2613', '100', '794', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2614', '100', '795', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2615', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2616', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2617', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2618', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2619', '100', '796', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2620', '100', '797', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2621', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-042)', '3G EXP 1 (U_GYE5461_LOS_PINOS) TT-000000920606', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2622', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-042)', '3G EXP 1 (U_GYE5461_LOS_PINOS) TT-000000920606', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2623', '100', '798', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-042)', '3G EXP 1 (U_GYE5461_LOS_PINOS) TT-000000920606', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2624', '100', '799', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-043)', '3G 1 (U_GYE5039_AGUAS) TT-000000920945', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2625', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-043)', '3G 1 (U_GYE5039_AGUAS) TT-000000920945', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2626', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-043)', '3G 1 (U_GYE5039_AGUAS) TT-000000920945', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2627', '100', '800', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-044)', '3G 1 (U_GYE5049_SUCRE) TT-000000920946', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2628', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-044)', '3G 1 (U_GYE5049_SUCRE) TT-000000920946', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2629', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-044)', '3G 1 (U_GYE5049_SUCRE) TT-000000920946', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2630', '100', '801', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-045)', '3G 2 (U_GYE5062_SAN_EDUARDO) TT-000000920882', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2631', '100', '701', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-045)', '3G 2 (U_GYE5062_SAN_EDUARDO) TT-000000920882', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2632', '100', '702', 'N/A', 'N/A', 'N/A', '35', 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-045)', '3G 2 (U_GYE5062_SAN_EDUARDO) TT-000000920882', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2638', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2639', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2640', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2641', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-020)', '3G EXP 2 (U_GYE5544_CANUTO) TT-000000916164', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2642', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-027)', '3G EXP 2 (U_GYE5531_CIUDAD_DEL_MAR) TT-000000917910', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2643', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-044)', '3G 1 (U_GYE5049_SUCRE) TT-000000920946', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2644', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-045)', '3G 2 (U_GYE5062_SAN_EDUARDO) TT-000000920882', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2645', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2646', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2647', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2648', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2649', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-042)', '3G EXP 1 (U_GYE5461_LOS_PINOS) TT-000000920606', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2650', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2651', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-022)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000916166', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2652', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2653', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2654', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2655', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2656', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2657', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2658', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2659', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2660', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2661', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2662', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-043)', '3G 1 (U_GYE5039_AGUAS) TT-000000920945', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2663', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2664', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-038)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000920778', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2665', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-033)', '3G EXP 3 (U_GYE5123_ALBORADA_ESTE) TT-000000919462', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2666', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2667', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-032)', '3G 1 (U_GYE5288_ESTRELLA_DE_BELEN) TT-000000919461', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2668', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2669', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-011)', '3G EXP 2 (U_GYE5396_EL_EMPALME_SUR) TT-000000915345', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2670', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-031)', '3G 2 (U_GYE5060_SAN_IGNACIO_DE_LOYOLA) TT-000000919455', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2671', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-036)', '3G EXP 3 (U_GYE5232_CDLA_SIMON_BOLIVAR) TT-000000920673', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2672', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-012)', '3G EXP 1 (U_GYE5395_EL_EMPALME) TT-000000915447', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2673', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-030)', '3G 2 (U_GYE5064_LAGUNA_CLUB) TT-000000919413', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2674', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-037)', '3G EXP 1 (U_GYE5533_MANTA_LA_VICTORIA) TT-000000920772', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2675', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2676', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-029)', '3G EXP 1 (U_GYE5717_PORTOVELO) TT-000000918622', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2677', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2678', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-014)', '3G EXP 2 (U_GYE5385_BALZAR) TT-000000915448', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2679', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-028)', '3G EXP 2 (U_GYE5719_ZARUMA) TT-000000918613', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2680', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-039)', '3G EXP 2 (U_GYE5515_MANTA_SAN_ANTONIO) TT-000000920804', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2681', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-015)', '3G EXP 2 (U_GYE5386_COLIMES) TT-000000915350', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2682', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-026)', '3G EXP 1 (U_GYE5463_RIO_PORTOVIEJO) TT-000000916957', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2683', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2684', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-025)', '3G 1 (U_GYE5454_PORTOVIEJO_NOR) TT-000000916893', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2685', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2686', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-024)', '3G EXP 3 (U_GYE5460_PORTOVIEJO_LA_ROTONDA) TT-000000916890', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2687', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2688', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-023)', '3G EXP 1 (U_GYE5470_SAN_PLACIDO) TT-000000916170', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2689', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-013)', '3G EXP 1 (U_GYE5919_COW_D_DAULE_PERIPA) TT-000000915346', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2690', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2691', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2692', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2693', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2694', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2695', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2696', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2697', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2698', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2699', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2700', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2701', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2702', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2703', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2704', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2705', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-006)', '3G 2 (U_GYE5068_BELLAVISTA) TT-000000912870', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2706', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-005)', '3G EXP 1 (U_GYE5178_SAUCES_9) TT-000000912869', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2707', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2708', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2709', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2710', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2711', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2712', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-018)', '3G 2 (U_GYE5054_JADE) TT-000000916153', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2713', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2714', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '2', '0.00');
INSERT INTO `billdetail` VALUES ('2715', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-019)', '3G EXP 3 (U_GYE5247_SUCRE_SUR) TT-000000916071', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2716', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2717', '101', '701', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2718', '101', '699', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2719', '101', '700', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2720', '101', '703', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2721', '101', '704', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2722', '101', '705', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2723', '101', '706', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2724', '101', '707', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-005)', '3G EXP 1 (U_GYE5178_SAUCES_9) TT-000000912869', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2725', '101', '708', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-006)', '3G 2 (U_GYE5068_BELLAVISTA) TT-000000912870', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2726', '101', '710', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2727', '101', '709', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2728', '101', '722', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2729', '101', '735', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2730', '101', '721', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2731', '101', '720', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2732', '101', '719', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2733', '101', '734', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2734', '101', '723', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2735', '101', '725', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2736', '101', '727', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2737', '101', '728', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2738', '101', '729', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2739', '101', '730', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2740', '101', '731', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2741', '101', '732', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2742', '101', '733', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2743', '101', '718', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2744', '101', '726', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2745', '101', '724', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2746', '101', '711', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2747', '101', '712', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2748', '101', '713', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2749', '101', '714', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2750', '101', '715', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2751', '101', '716', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2752', '101', '717', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2753', '101', '752', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2754', '101', '753', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2755', '101', '739', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2756', '101', '738', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2757', '101', '737', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2758', '101', '736', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2759', '101', '741', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2760', '101', '754', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2761', '101', '743', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2762', '101', '751', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2763', '101', '755', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2764', '101', '742', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2765', '101', '744', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2766', '101', '745', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2767', '101', '750', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2768', '101', '746', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2769', '101', '740', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2770', '101', '747', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2771', '101', '748', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2772', '101', '749', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2773', '101', '756', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2774', '101', '757', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2775', '101', '758', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2776', '101', '760', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-011)', '3G EXP 2 (U_GYE5396_EL_EMPALME_SUR) TT-000000915345', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2777', '101', '761', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-012)', '3G EXP 1 (U_GYE5395_EL_EMPALME) TT-000000915447', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2778', '101', '762', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-013)', '3G EXP 1 (U_GYE5919_COW_D_DAULE_PERIPA) TT-000000915346', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2779', '101', '763', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-014)', '3G EXP 2 (U_GYE5385_BALZAR) TT-000000915448', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2780', '101', '764', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-015)', '3G EXP 2 (U_GYE5386_COLIMES) TT-000000915350', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2781', '101', '766', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2782', '101', '765', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2783', '101', '767', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2784', '101', '768', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2785', '101', '769', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-018)', '3G 2 (U_GYE5054_JADE) TT-000000916153', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2786', '101', '770', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-019)', '3G EXP 3 (U_GYE5247_SUCRE_SUR) TT-000000916071', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2787', '101', '771', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-020)', '3G EXP 2 (U_GYE5544_CANUTO) TT-000000916164', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2788', '101', '773', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2789', '101', '772', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2790', '101', '774', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-022)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000916166', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2791', '101', '775', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-023)', '3G EXP 1 (U_GYE5470_SAN_PLACIDO) TT-000000916170', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2792', '101', '776', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-024)', '3G EXP 3 (U_GYE5460_PORTOVIEJO_LA_ROTONDA) TT-000000916890', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2793', '101', '777', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-025)', '3G 1 (U_GYE5454_PORTOVIEJO_NOR) TT-000000916893', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2794', '101', '778', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-026)', '3G EXP 1 (U_GYE5463_RIO_PORTOVIEJO) TT-000000916957', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2795', '101', '779', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-027)', '3G EXP 2 (U_GYE5531_CIUDAD_DEL_MAR) TT-000000917910', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2796', '101', '780', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-028)', '3G EXP 2 (U_GYE5719_ZARUMA) TT-000000918613', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2797', '101', '781', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-029)', '3G EXP 1 (U_GYE5717_PORTOVELO) TT-000000918622', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2798', '101', '782', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-030)', '3G 2 (U_GYE5064_LAGUNA_CLUB) TT-000000919413', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2799', '101', '783', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-031)', '3G 2 (U_GYE5060_SAN_IGNACIO_DE_LOYOLA) TT-000000919455', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2800', '101', '784', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-032)', '3G 1 (U_GYE5288_ESTRELLA_DE_BELEN) TT-000000919461', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2801', '101', '785', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-033)', '3G EXP 3 (U_GYE5123_ALBORADA_ESTE) TT-000000919462', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2802', '101', '786', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2803', '101', '787', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2804', '101', '788', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2805', '101', '789', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2806', '101', '790', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-036)', '3G EXP 3 (U_GYE5232_CDLA_SIMON_BOLIVAR) TT-000000920673', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2807', '101', '791', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-037)', '3G EXP 1 (U_GYE5533_MANTA_LA_VICTORIA) TT-000000920772', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2808', '101', '792', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-038)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000920778', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2809', '101', '793', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-039)', '3G EXP 2 (U_GYE5515_MANTA_SAN_ANTONIO) TT-000000920804', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2810', '101', '794', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2811', '101', '795', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2812', '101', '797', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2813', '101', '796', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2814', '101', '798', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-042)', '3G EXP 1 (U_GYE5461_LOS_PINOS) TT-000000920606', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2815', '101', '799', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-043)', '3G 1 (U_GYE5039_AGUAS) TT-000000920945', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2816', '101', '800', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-044)', '3G 1 (U_GYE5049_SUCRE) TT-000000920946', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2817', '101', '801', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-045)', '3G 2 (U_GYE5062_SAN_EDUARDO) TT-000000920882', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2818', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2819', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-042)', '3G EXP 1 (U_GYE5461_LOS_PINOS) TT-000000920606', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2820', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2821', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2822', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2823', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2824', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2825', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2826', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2827', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-007)', '3G 1 (U_GYE5195_CHONGON) TT-000000913023', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2828', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2829', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2830', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2831', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2832', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2833', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2834', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2835', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2836', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2837', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-004)', '3G 2 (U_GYE5066_BARRIO_PUERTO_LISA) TT-000000912867', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2838', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2839', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2840', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-002)', '3G 1 (U_GYE5035_CAPEIRA) TT-000000912834', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2841', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2842', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2843', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2844', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-003)', '3G EXP 1 (U_GYE5179_SOLCA_GY) TT-000000912839', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2845', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2846', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2847', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2848', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2849', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2850', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2851', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-005)', '3G EXP 1 (U_GYE5178_SAUCES_9) TT-000000912869', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2852', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2853', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2854', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-006)', '3G 2 (U_GYE5068_BELLAVISTA) TT-000000912870', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2855', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2856', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2857', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-009)', '3G 1 (U_GYE5358_EL_TRIUNFO) TT-000000914625', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2858', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-033)', '3G EXP 3 (U_GYE5123_ALBORADA_ESTE) TT-000000919462', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2859', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2860', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-036)', '3G EXP 3 (U_GYE5232_CDLA_SIMON_BOLIVAR) TT-000000920673', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2861', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-025)', '3G 1 (U_GYE5454_PORTOVIEJO_NOR) TT-000000916893', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2862', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-035)', '3G 2 (U_GYE5058_BATALLON) TT-000000920660', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2863', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-026)', '3G EXP 1 (U_GYE5463_RIO_PORTOVIEJO) TT-000000916957', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2864', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-015)', '3G EXP 2 (U_GYE5386_COLIMES) TT-000000915350', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2865', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-034)', '3G EXP 1 (U_GYE5462_PORTOVIEJO_SHOPPING) TT-000000919463', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2866', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-037)', '3G EXP 1 (U_GYE5533_MANTA_LA_VICTORIA) TT-000000920772', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2867', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-014)', '3G EXP 2 (U_GYE5385_BALZAR) TT-000000915448', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2868', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-016)', '3G EXP 1 (U_GYE5124_ALBORADA_OESTE) TT-000000916151', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2869', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-028)', '3G EXP 2 (U_GYE5719_ZARUMA) TT-000000918613', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2870', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-032)', '3G 1 (U_GYE5288_ESTRELLA_DE_BELEN) TT-000000919461', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2871', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2872', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-013)', '3G EXP 1 (U_GYE5919_COW_D_DAULE_PERIPA) TT-000000915346', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2873', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-031)', '3G 2 (U_GYE5060_SAN_IGNACIO_DE_LOYOLA) TT-000000919455', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2874', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-011)', '3G EXP 2 (U_GYE5396_EL_EMPALME_SUR) TT-000000915345', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2875', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-029)', '3G EXP 1 (U_GYE5717_PORTOVELO) TT-000000918622', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2876', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-030)', '3G 2 (U_GYE5064_LAGUNA_CLUB) TT-000000919413', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2877', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-010)', '3G EXP 1 (U_GYE5916_COW_B_PORTOVIEJO_CRISTO_REY) TT-000000914725', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2878', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-041)', '3G EXP 1 (U_GYE5538_VIA_ROCAFUERTE) TT-000000920605', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2879', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-012)', '3G EXP 1 (U_GYE5395_EL_EMPALME) TT-000000915447', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2880', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2881', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2882', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-045)', '3G 2 (U_GYE5062_SAN_EDUARDO) TT-000000920882', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2883', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-044)', '3G 1 (U_GYE5049_SUCRE) TT-000000920946', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2884', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-043)', '3G 1 (U_GYE5039_AGUAS) TT-000000920945', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2885', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-027)', '3G EXP 2 (U_GYE5531_CIUDAD_DEL_MAR) TT-000000917910', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2886', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-024)', '3G EXP 3 (U_GYE5460_PORTOVIEJO_LA_ROTONDA) TT-000000916890', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2887', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-018)', '3G 2 (U_GYE5054_JADE) TT-000000916153', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2888', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-008)', '3G 1 (U_GYE5504_MANTA_UNIVERSIDAD ) TT-000000914724', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2889', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-020)', '3G EXP 2 (U_GYE5544_CANUTO) TT-000000916164', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2890', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-017)', '3G 2 (U_GYE5078_LA_CHALA) TT-000000916152', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2891', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-040)', '3G EXP 1 (U_GYE5615_LIBERTAD_SUROESTE) TT-000000920815', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2892', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-021)', '3G EXP 2 (U_GYE5517_MANTA_TARQUI) TT-000000916072', '8', '0.00');
INSERT INTO `billdetail` VALUES ('2893', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-022)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000916166', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2894', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-039)', '3G EXP 2 (U_GYE5515_MANTA_SAN_ANTONIO) TT-000000920804', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2895', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-023)', '3G EXP 1 (U_GYE5470_SAN_PLACIDO) TT-000000916170', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2896', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-038)', '3G EXP 3 (U_GYE5514_MANTA_REYES) TT-000000920778', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2897', '101', '702', 'N/A', 'N/A', 'N/A', null, 'N/A', 'ENTREGADO EN ALU GUAYAQUIL (ACT-ENT-018-019)', '3G EXP 3 (U_GYE5247_SUCRE_SUR) TT-000000916071', '4', '0.00');
INSERT INTO `billdetail` VALUES ('2898', '102', '401', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2899', '103', '127', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2900', '103', '128', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2901', '103', '202', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2902', '103', '218', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2903', '103', '219', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2904', '103', '220', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2905', '103', '399', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2906', '104', '366', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2907', '104', '367', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'N/A', '3G', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2908', '105', '803', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'N/A', 'IP RAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2909', '106', '372', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2910', '107', '29', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2911', '107', '28', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2912', '107', '30', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2913', '107', '39', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2914', '107', '41', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2915', '107', '40', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2916', '107', '42', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2917', '107', '112', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2918', '107', '27', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2919', '107', '113', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2920', '108', '627', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2921', '108', '626', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2922', '109', '280', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2923', '109', '368', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2924', '109', '371', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2925', '109', '374', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2926', '110', '114', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2927', '105', '16', 'N/A', 'N/A', 'N/A', '27', 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2928', '105', '18', 'N/A', 'N/A', 'N/A', '26', 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2929', '111', '804', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2930', '111', '14', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2931', '111', '805', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2932', '111', '281', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2933', '111', '282', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2934', '111', '369', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2935', '111', '373', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2936', '111', '631', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2937', '111', '628', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2938', '111', '695', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2939', '111', '690', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2940', '113', '803', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2941', '113', '15', 'N/A', 'N/A', 'N/A', null, 'N/A', 'N/A', 'IPRAN', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2942', '1', '114', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'NO UTILIZAR PARA LEVEL 3 ENVIO DE BODEGA FLEX.NET PARA LEVEL 3', 'LEVEL 3', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2943', '1', '280', 'N/A', 'N/A', 'N/A', '12', 'N/A', '(NO UTILIZAR PARA LEVEL 3)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2944', '1', '281', 'TRANS-001-17', '1011030506', 'ECL14ARRES-EC1-A009800', '12', 'N/A', 'N/A', 'TRANSNEXA', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2945', '1', '282', 'POR-031-15', '1010874994', 'ECL02NODOB-EC1-IP60043', '12', 'N/A', 'N/A', 'TRANSNEXA', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2946', '1', '368', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2947', '1', '369', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2948', '1', '371', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2949', '1', '373', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2950', '1', '374', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGA DE BODEGA FLEXNET (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2951', '1', '631', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('2952', '1', '690', 'N/A', 'N/A', 'N/A', '11', 'N/A', '(NO UTILIZAR PARA TRANSNEXA) ENTREGA DE BODEGA FLEXNET', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3338', '120', '806', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-048', 'U_GYE5713_LA_VICTORIA_EL_ORO', '3G EXP 1 (TT-000000917969)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3339', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-048', 'U_GYE5713_LA_VICTORIA_EL_ORO', '3G EXP 1 (TT-000000917969)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3340', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-048', 'U_GYE5713_LA_VICTORIA_EL_ORO', '3G EXP 1 (TT-000000917969)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3341', '120', '807', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3342', '120', '808', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3343', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3344', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3345', '120', '809', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-050', 'U_GYE5625_LA_LIBERTAD', '3G 1 (TT-000000920949)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3346', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-050', 'U_GYE5625_LA_LIBERTAD', '3G 1 (TT-000000920949)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3347', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-050', 'U_GYE5625_LA_LIBERTAD', '3G 1 (TT-000000920949)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3348', '120', '810', 'N/A', 'N/A', 'N/A', '31', 'ENTREGADO POR FLEXNET ACT-ENT-018-051', 'U_GYE5537_VIA_MONTECRISTI', '3G EXP 1 (TT-000000920884)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3349', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-051', 'U_GYE5537_VIA_MONTECRISTI', '3G EXP 1 (TT-000000920884)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3350', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-051', 'U_GYE5537_VIA_MONTECRISTI', '3G EXP 1 (TT-000000920884)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3351', '120', '811', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-052', 'U_GYE5510_MANTA_LA_FABRIL', '3G 3 (TT-000000920885)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3352', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-052', 'U_GYE5510_MANTA_LA_FABRIL', '3G 3 (TT-000000920885)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3353', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-052', 'U_GYE5510_MANTA_LA_FABRIL', '3G 3 (TT-000000920885)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3354', '120', '812', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-053', 'U_GYE5619_SALINAS_ESTE', '3G EXP 1 (TT-000000920891)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3355', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-053', 'U_GYE5619_SALINAS_ESTE', '3G EXP 1 (TT-000000920891)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3356', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-053', 'U_GYE5619_SALINAS_ESTE', '3G EXP 1 (TT-000000920891)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3357', '120', '813', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-054', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000920898)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3358', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-054', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000920898)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3359', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-054', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000920898)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3360', '120', '814', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-055', 'U_GYE5522_BAHIA_NORTE', '3G 1 (TT-000000920901)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3361', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-055', 'U_GYE5522_BAHIA_NORTE', '3G 1 (TT-000000920901)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3362', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-055', 'U_GYE5522_BAHIA_NORTE', '3G 1 (TT-000000920901)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3363', '120', '815', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-056', 'U_GYE5805_QUEVEDO_ISLA', '3G EXP 1 (TT-000000920902)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3364', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-056', 'U_GYE5805_QUEVEDO_ISLA', '3G EXP 1 (TT-000000920902)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3365', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-056', 'U_GYE5805_QUEVEDO_ISLA', '3G EXP 1 (TT-000000920902)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3366', '120', '816', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-057', 'U_GYE5501_MANTA_ESTE', '3G 1 (TT-000000920905)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3367', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-057', 'U_GYE5501_MANTA_ESTE', '3G 1 (TT-000000920905)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3368', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-057', 'U_GYE5501_MANTA_ESTE', '3G 1 (TT-000000920905)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3369', '120', '817', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-058', 'U_GYE5512_MANTA_ARROYO', '3G EXP 2 (TT-000000920906)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3370', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-058', 'U_GYE5512_MANTA_ARROYO', '3G EXP 2 (TT-000000920906)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3371', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-058', 'U_GYE5512_MANTA_ARROYO', '3G EXP 2 (TT-000000920906)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3372', '120', '818', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-059', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000920953)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3373', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-059', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000920953)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3374', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-059', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000920953)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3375', '120', '819', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3376', '120', '820', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3377', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3378', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3379', '120', '821', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3380', '120', '822', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3381', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3382', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3383', '120', '823', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3384', '120', '824', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3385', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3386', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3387', '120', '825', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3388', '120', '826', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3389', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3390', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3391', '120', '827', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3392', '120', '828', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3393', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3394', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3395', '120', '829', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-065', 'U_GYE5456_REALES_TAMARINDOS', '3G 3 (TT-000000921758)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3396', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-065', 'U_GYE5456_REALES_TAMARINDOS', '3G 3 (TT-000000921758)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3397', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-065', 'U_GYE5456_REALES_TAMARINDOS', '3G 3 (TT-000000921758)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3398', '120', '830', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3399', '120', '831', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3400', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3401', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3402', '120', '832', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-067', 'U_GYE5608_LIBERTAD_SURESTE', '3G 3 (TT-000000922134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3403', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-067', 'U_GYE5608_LIBERTAD_SURESTE', '3G 3 (TT-000000922134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3404', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-067', 'U_GYE5608_LIBERTAD_SURESTE', '3G 3 (TT-000000922134)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3405', '120', '833', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-068', 'U_GYE5021_EL_JORDAN', '3G 1 (TT-000000922568)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3406', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-068', 'U_GYE5021_EL_JORDAN', '3G 1 (TT-000000922568)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3407', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-068', 'U_GYE5021_EL_JORDAN', '3G 1 (TT-000000922568)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3408', '120', '834', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-069', 'U_GYE5107_URDENOR_NORTE', '3G 2 (TT-000000922649)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3409', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-069', 'U_GYE5107_URDENOR_NORTE', '3G 2 (TT-000000922649)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3410', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-069', 'U_GYE5107_URDENOR_NORTE', '3G 2 (TT-000000922649)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3411', '120', '835', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-070', 'U_GYE5004_CENTRAL_NORTE', '3G 1 (TT-000000922962)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3412', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-070', 'U_GYE5004_CENTRAL_NORTE', '3G 1 (TT-000000922962)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3413', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-070', 'U_GYE5004_CENTRAL_NORTE', '3G 1 (TT-000000922962)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3414', '120', '836', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-071', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000923057)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3415', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-071', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000923057)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3416', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-071', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000923057)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3417', '120', '837', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-072', 'U_GYE5612_LIBERTAD_NORESTE', '3G EXP 1 (TT-000000923343)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3418', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-072', 'U_GYE5612_LIBERTAD_NORESTE', '3G EXP 1 (TT-000000923343)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3419', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-072', 'U_GYE5612_LIBERTAD_NORESTE', '3G EXP 1 (TT-000000923343)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3420', '120', '838', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-073', 'U_GYE5613_LIBERTAD_NORTE', '3G EXP 1 (TT-000000923351)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3421', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-073', 'U_GYE5613_LIBERTAD_NORTE', '3G EXP 1 (TT-000000923351)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3422', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-073', 'U_GYE5613_LIBERTAD_NORTE', '3G EXP 1 (TT-000000923351)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3423', '120', '839', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-074', 'U_GYE5623_JOSE_LUIS_TAMAYO', '3G EXP 1 (TT-000000923353)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3424', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-074', 'U_GYE5623_JOSE_LUIS_TAMAYO', '3G EXP 1 (TT-000000923353)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3425', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-074', 'U_GYE5623_JOSE_LUIS_TAMAYO', '3G EXP 1 (TT-000000923353)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3426', '120', '840', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3427', '120', '841', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3428', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3429', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3430', '120', '842', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-076', 'U_GYE5518_URBIRIOS_MA', '3G EXP 1 (TT-000000924066)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3431', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-076', 'U_GYE5518_URBIRIOS_MA', '3G EXP 1 (TT-000000924066)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3432', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-076', 'U_GYE5518_URBIRIOS_MA', '3G EXP 1 (TT-000000924066)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3433', '120', '843', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-077', 'U_GYE5615_LIBERTAD_SUROESTE', '3G EXP 1 (TT-000000924563)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3434', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-077', 'U_GYE5615_LIBERTAD_SUROESTE', '3G EXP 1 (TT-000000924563)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3435', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-077', 'U_GYE5615_LIBERTAD_SUROESTE', '3G EXP 1 (TT-000000924563)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3436', '120', '844', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-078', 'U_GYE5550_SANTA_ELENA_CENTRO', '3G 1 (TT-000000924824)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3437', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-078', 'U_GYE5550_SANTA_ELENA_CENTRO', '3G 1 (TT-000000924824)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3438', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-078', 'U_GYE5550_SANTA_ELENA_CENTRO', '3G 1 (TT-000000924824)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3439', '120', '845', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3440', '120', '846', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3441', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3442', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3443', '120', '847', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3444', '120', '848', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3445', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3446', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3447', '120', '849', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3448', '120', '850', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3449', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3450', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3451', '120', '851', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-082', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000928241)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3452', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-082', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000928241)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3453', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-082', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000928241)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3454', '120', '852', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3455', '120', '853', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3456', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3457', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3458', '120', '854', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-084', 'U_GYE5461_LOS_PINOS', '3G EXP 1 (TT-000000928449)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3459', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-084', 'U_GYE5461_LOS_PINOS', '3G EXP 1 (TT-000000928449)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3460', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-084', 'U_GYE5461_LOS_PINOS', '3G EXP 1 (TT-000000928449)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3461', '120', '855', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3462', '120', '856', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3463', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3464', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3465', '120', '857', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-086', 'U_GYE5402_JESUS_MARIA', '3G EXP 2 (TT-000000928929)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3466', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-086', 'U_GYE5402_JESUS_MARIA', '3G EXP 2 (TT-000000928929)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3467', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-086', 'U_GYE5402_JESUS_MARIA', '3G EXP 2 (TT-000000928929)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3468', '120', '858', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-087', 'U_GYE5071 CHONGON CENTRO', '3G 1 (TT-000000930430)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3469', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-087', 'U_GYE5071 CHONGON CENTRO', '3G 1 (TT-000000930430)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3470', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-087', 'U_GYE5071 CHONGON CENTRO', '3G 1 (TT-000000930430)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3471', '120', '859', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3472', '120', '860', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3473', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3474', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3475', '120', '861', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3476', '120', '862', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3477', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3478', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3479', '120', '863', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3480', '120', '864', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3481', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3482', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3483', '120', '865', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3484', '120', '866', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3485', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3486', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3487', '120', '867', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3488', '120', '868', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3489', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3490', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3491', '120', '869', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3492', '120', '870', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3493', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3494', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3495', '120', '871', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3496', '120', '872', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3497', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3498', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3499', '120', '873', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3500', '120', '874', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3501', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3502', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3503', '120', '875', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-096', 'U_GYE5617_CHIPIPE', '3G 3 (TT-000000935804)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3504', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-096', 'U_GYE5617_CHIPIPE', '3G 3 (TT-000000935804)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3505', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-096', 'U_GYE5617_CHIPIPE', '3G 3 (TT-000000935804)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3506', '120', '876', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-097', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000937130)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3507', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-097', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000937130)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3508', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-097', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000937130)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3509', '120', '877', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-098', 'U_GYE5514_MANTA_REYES', '3G EXP 3 (TT-000000937132)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3510', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-098', 'U_GYE5514_MANTA_REYES', '3G EXP 3 (TT-000000937132)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3511', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-098', 'U_GYE5514_MANTA_REYES', '3G EXP 3 (TT-000000937132)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3512', '120', '878', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-099', 'U_GYE5545_CHONE_ESTE', '3G EXP 3 (TT-000000937134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3513', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-099', 'U_GYE5545_CHONE_ESTE', '3G EXP 3 (TT-000000937134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3514', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-099', 'U_GYE5545_CHONE_ESTE', '3G EXP 3 (TT-000000937134)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3515', '120', '879', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-100', 'U_GYE5460_PORTOVIEJO_LA_ROTONDA', '3G EXP 3 (TT-000000937228)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3516', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-100', 'U_GYE5460_PORTOVIEJO_LA_ROTONDA', '3G EXP 3 (TT-000000937228)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3517', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-100', 'U_GYE5460_PORTOVIEJO_LA_ROTONDA', '3G EXP 3 (TT-000000937228)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3518', '120', '880', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-101', 'U_GYE5493_CHARAPOTO', '3G EXP 3 (TT-000000937231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3519', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-101', 'U_GYE5493_CHARAPOTO', '3G EXP 3 (TT-000000937231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3520', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-101', 'U_GYE5493_CHARAPOTO', '3G EXP 3 (TT-000000937231)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3521', '120', '881', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-102', 'U_GYE5495_ANGEL_PEDRO_GILER', '3G EXP 3 (TT-000000937233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3522', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-102', 'U_GYE5495_ANGEL_PEDRO_GILER', '3G EXP 3 (TT-000000937233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3523', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-102', 'U_GYE5495_ANGEL_PEDRO_GILER', '3G EXP 3 (TT-000000937233)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3524', '120', '882', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-103', 'U_GYE5541_JIPIJAPA_SUR', '3G EXP 3 (TT-000000937237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3525', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-103', 'U_GYE5541_JIPIJAPA_SUR', '3G EXP 3 (TT-000000937237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3526', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-103', 'U_GYE5541_JIPIJAPA_SUR', '3G EXP 3 (TT-000000937237)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3527', '120', '883', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-104', 'U_GYE5750_BABAHOYO', '3G 1 (TT-000000938381)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3528', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-104', 'U_GYE5750_BABAHOYO', '3G 1 (TT-000000938381)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3529', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-104', 'U_GYE5750_BABAHOYO', '3G 1 (TT-000000938381)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3530', '120', '884', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-105', 'U_GYE5071_CHONGON_CENTRO', '3G 2 (TT-000000939372)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3531', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-105', 'U_GYE5071_CHONGON_CENTRO', '3G 2 (TT-000000939372)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3532', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-105', 'U_GYE5071_CHONGON_CENTRO', '3G 2 (TT-000000939372)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3533', '120', '885', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-106', 'U_GYE5806_VALENCIA', '3G EXP 1 (TT-000000942396)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3534', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-106', 'U_GYE5806_VALENCIA', '3G EXP 1 (TT-000000942396)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3535', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-106', 'U_GYE5806_VALENCIA', '3G EXP 1 (TT-000000942396)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3536', '120', '886', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3537', '120', '887', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3538', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3539', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3540', '120', '888', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3541', '120', '889', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3542', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3543', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3544', '120', '890', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3545', '120', '891', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3546', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3547', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3548', '120', '892', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3549', '120', '893', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3550', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3551', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3552', '120', '894', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3553', '120', '895', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3554', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3555', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3556', '120', '896', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3557', '120', '897', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3558', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3559', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3560', '120', '898', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-113', 'U_GYE5044_VILLA_CLUB', '3G 1 (TT-000000946670)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3561', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-113', 'U_GYE5044_VILLA_CLUB', '3G 1 (TT-000000946670)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3562', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-113', 'U_GYE5044_VILLA_CLUB', '3G 1 (TT-000000946670)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3563', '120', '899', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3564', '120', '900', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3565', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3566', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3567', '120', '901', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3568', '120', '902', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3569', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3570', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3571', '120', '903', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-116', 'U_GYE5075_GARAY', '3G 2 (TT-000000950737)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3572', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-116', 'U_GYE5075_GARAY', '3G 2 (TT-000000950737)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3573', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-116', 'U_GYE5075_GARAY', '3G 2 (TT-000000950737)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3574', '120', '904', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3575', '120', '905', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3576', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3577', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3578', '120', '906', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-118', 'U_GYE5093_PRADERA_SUR', '3G 2 (TT-000000951448)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3579', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-118', 'U_GYE5093_PRADERA_SUR', '3G 2 (TT-000000951448)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3580', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-118', 'U_GYE5093_PRADERA_SUR', '3G 2 (TT-000000951448)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3581', '121', '806', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-048', 'U_GYE5713_LA_VICTORIA_EL_ORO', '3G EXP 1 (TT-000000917969)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3582', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-048', 'U_GYE5713_LA_VICTORIA_EL_ORO', '3G EXP 1 (TT-000000917969)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3583', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-048', 'U_GYE5713_LA_VICTORIA_EL_ORO', '3G EXP 1 (TT-000000917969)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3584', '121', '807', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3585', '121', '808', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3586', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3587', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-049', 'U_GYE5705_SANTA_ROSA_SUR', '3G EXP 1 (TT-000000918255)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3588', '121', '809', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-050', 'U_GYE5625_LA_LIBERTAD', '3G 1 (TT-000000920949)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3589', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-050', 'U_GYE5625_LA_LIBERTAD', '3G 1 (TT-000000920949)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3590', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-050', 'U_GYE5625_LA_LIBERTAD', '3G 1 (TT-000000920949)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3591', '121', '810', 'N/A', 'N/A', 'N/A', null, 'ENTREGADO POR FLEXNET ACT-ENT-018-051', 'U_GYE5537_VIA_MONTECRISTI', '3G EXP 1 (TT-000000920884)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3592', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-051', 'U_GYE5537_VIA_MONTECRISTI', '3G EXP 1 (TT-000000920884)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3593', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-051', 'U_GYE5537_VIA_MONTECRISTI', '3G EXP 1 (TT-000000920884)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3594', '121', '811', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-052', 'U_GYE5510_MANTA_LA_FABRIL', '3G 3 (TT-000000920885)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3595', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-052', 'U_GYE5510_MANTA_LA_FABRIL', '3G 3 (TT-000000920885)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3596', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-052', 'U_GYE5510_MANTA_LA_FABRIL', '3G 3 (TT-000000920885)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3597', '121', '812', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-053', 'U_GYE5619_SALINAS_ESTE', '3G EXP 1 (TT-000000920891)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3598', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-053', 'U_GYE5619_SALINAS_ESTE', '3G EXP 1 (TT-000000920891)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3599', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-053', 'U_GYE5619_SALINAS_ESTE', '3G EXP 1 (TT-000000920891)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3600', '121', '813', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-054', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000920898)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3601', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-054', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000920898)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3602', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-054', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000920898)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3603', '121', '814', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-055', 'U_GYE5522_BAHIA_NORTE', '3G 1 (TT-000000920901)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3604', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-055', 'U_GYE5522_BAHIA_NORTE', '3G 1 (TT-000000920901)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3605', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-055', 'U_GYE5522_BAHIA_NORTE', '3G 1 (TT-000000920901)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3606', '121', '815', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-056', 'U_GYE5805_QUEVEDO_ISLA', '3G EXP 1 (TT-000000920902)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3607', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-056', 'U_GYE5805_QUEVEDO_ISLA', '3G EXP 1 (TT-000000920902)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3608', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-056', 'U_GYE5805_QUEVEDO_ISLA', '3G EXP 1 (TT-000000920902)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3609', '121', '816', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-057', 'U_GYE5501_MANTA_ESTE', '3G 1 (TT-000000920905)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3610', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-057', 'U_GYE5501_MANTA_ESTE', '3G 1 (TT-000000920905)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3611', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-057', 'U_GYE5501_MANTA_ESTE', '3G 1 (TT-000000920905)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3612', '121', '817', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-058', 'U_GYE5512_MANTA_ARROYO', '3G EXP 2 (TT-000000920906)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3613', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-058', 'U_GYE5512_MANTA_ARROYO', '3G EXP 2 (TT-000000920906)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3614', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-058', 'U_GYE5512_MANTA_ARROYO', '3G EXP 2 (TT-000000920906)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3615', '121', '818', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-059', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000920953)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3616', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-059', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000920953)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3617', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-059', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000920953)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3618', '121', '819', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3619', '121', '820', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3620', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3621', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-060', 'U_GYE5663_MACHALA_NORESTE', '3G EXP 1 (TT-000000921143)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3622', '121', '821', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3623', '121', '822', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3624', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3625', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-061', 'U_GYE5666_MACHALA_URDESA', '3G EXP 1 (TT-000000921231)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3626', '121', '823', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3627', '121', '824', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3628', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3629', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-062', 'U_GYE5658_MACHALA_AEROPUERTO', '3G EXP 2 (TT-000000921232)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3630', '121', '825', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3631', '121', '826', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3632', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3633', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-063', 'U_GYE5668_MACHALA_VERGELES', '3G EXP 2 (TT-000000921233)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3634', '121', '827', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3635', '121', '828', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3636', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3637', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-064', 'U_GYE5375_MILAGRO_ESTE', '3G EXP 1 (TT-000000921710)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3638', '121', '829', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-065', 'U_GYE5456_REALES_TAMARINDOS', '3G 3 (TT-000000921758)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3639', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-065', 'U_GYE5456_REALES_TAMARINDOS', '3G 3 (TT-000000921758)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3640', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-065', 'U_GYE5456_REALES_TAMARINDOS', '3G 3 (TT-000000921758)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3641', '121', '830', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3642', '121', '831', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3643', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3644', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-066', 'U_GYE5912_COW_MSP_H_ALCIVAR', '3G 1 (TT-000000921935)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3645', '121', '832', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-067', 'U_GYE5608_LIBERTAD_SURESTE', '3G 3 (TT-000000922134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3646', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-067', 'U_GYE5608_LIBERTAD_SURESTE', '3G 3 (TT-000000922134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3647', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-067', 'U_GYE5608_LIBERTAD_SURESTE', '3G 3 (TT-000000922134)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3648', '121', '833', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-068', 'U_GYE5021_EL_JORDAN', '3G 1 (TT-000000922568)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3649', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-068', 'U_GYE5021_EL_JORDAN', '3G 1 (TT-000000922568)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3650', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-068', 'U_GYE5021_EL_JORDAN', '3G 1 (TT-000000922568)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3651', '121', '834', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-069', 'U_GYE5107_URDENOR_NORTE', '3G 2 (TT-000000922649)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3652', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-069', 'U_GYE5107_URDENOR_NORTE', '3G 2 (TT-000000922649)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3653', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-069', 'U_GYE5107_URDENOR_NORTE', '3G 2 (TT-000000922649)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3654', '121', '835', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-070', 'U_GYE5004_CENTRAL_NORTE', '3G 1 (TT-000000922962)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3655', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-070', 'U_GYE5004_CENTRAL_NORTE', '3G 1 (TT-000000922962)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3656', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-070', 'U_GYE5004_CENTRAL_NORTE', '3G 1 (TT-000000922962)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3657', '121', '836', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-071', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000923057)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3658', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-071', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000923057)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3659', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-071', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000923057)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3660', '121', '837', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-072', 'U_GYE5612_LIBERTAD_NORESTE', '3G EXP 1 (TT-000000923343)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3661', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-072', 'U_GYE5612_LIBERTAD_NORESTE', '3G EXP 1 (TT-000000923343)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3662', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-072', 'U_GYE5612_LIBERTAD_NORESTE', '3G EXP 1 (TT-000000923343)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3663', '121', '838', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-073', 'U_GYE5613_LIBERTAD_NORTE', '3G EXP 1 (TT-000000923351)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3664', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-073', 'U_GYE5613_LIBERTAD_NORTE', '3G EXP 1 (TT-000000923351)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3665', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-073', 'U_GYE5613_LIBERTAD_NORTE', '3G EXP 1 (TT-000000923351)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3666', '121', '839', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-074', 'U_GYE5623_JOSE_LUIS_TAMAYO', '3G EXP 1 (TT-000000923353)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3667', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-074', 'U_GYE5623_JOSE_LUIS_TAMAYO', '3G EXP 1 (TT-000000923353)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3668', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-074', 'U_GYE5623_JOSE_LUIS_TAMAYO', '3G EXP 1 (TT-000000923353)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3669', '121', '840', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3670', '121', '841', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3671', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3672', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-075', 'U_GYE5129_BATALLON_CENTRO', '3G EXP 1 (TT-000000923355)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3673', '121', '842', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-076', 'U_GYE5518_URBIRIOS_MA', '3G EXP 1 (TT-000000924066)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3674', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-076', 'U_GYE5518_URBIRIOS_MA', '3G EXP 1 (TT-000000924066)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3675', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-076', 'U_GYE5518_URBIRIOS_MA', '3G EXP 1 (TT-000000924066)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3676', '121', '843', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-077', 'U_GYE5615_LIBERTAD_SUROESTE', '3G EXP 1 (TT-000000924563)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3677', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-077', 'U_GYE5615_LIBERTAD_SUROESTE', '3G EXP 1 (TT-000000924563)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3678', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-077', 'U_GYE5615_LIBERTAD_SUROESTE', '3G EXP 1 (TT-000000924563)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3679', '121', '844', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-078', 'U_GYE5550_SANTA_ELENA_CENTRO', '3G 1 (TT-000000924824)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3680', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-078', 'U_GYE5550_SANTA_ELENA_CENTRO', '3G 1 (TT-000000924824)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3681', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-078', 'U_GYE5550_SANTA_ELENA_CENTRO', '3G 1 (TT-000000924824)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3682', '121', '845', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3683', '121', '846', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3684', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3685', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-079', 'U_GYE5202_PORTO_SEYMOUR', '3G EXP 2 (TT-000000928046)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3686', '121', '847', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3687', '121', '848', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3688', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3689', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-080', 'U_GYE5039_AGUAS', '3G 1 (TT-000000928230)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3690', '121', '849', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3691', '121', '850', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3692', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3693', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-081', 'U_GYE5146_GARCIA_MORENO', '3G EXP 1 (TT-000000928237)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3694', '121', '851', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-082', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000928241)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3695', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-082', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000928241)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3696', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-082', 'U_GYE5453_CDLA_LOS_TAMARINDOS', '3G 3 (TT-000000928241)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3697', '121', '852', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3698', '121', '853', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3699', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3700', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-083', 'U_GYE5176_ROCAFUERTE_GYE', '3G EXP 1 (TT-000000928378)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3701', '121', '854', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-084', 'U_GYE5461_LOS_PINOS', '3G EXP 1 (TT-000000928449)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3702', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-084', 'U_GYE5461_LOS_PINOS', '3G EXP 1 (TT-000000928449)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3703', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-084', 'U_GYE5461_LOS_PINOS', '3G EXP 1 (TT-000000928449)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3704', '121', '855', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3705', '121', '856', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3706', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3707', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-085', 'U_GYE5548_SAN_ANTONIO', '3G EXP 3 (TT-000000928450)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3708', '121', '857', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-086', 'U_GYE5402_JESUS_MARIA', '3G EXP 2 (TT-000000928929)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3709', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-086', 'U_GYE5402_JESUS_MARIA', '3G EXP 2 (TT-000000928929)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3710', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-086', 'U_GYE5402_JESUS_MARIA', '3G EXP 2 (TT-000000928929)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3711', '121', '858', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-087', 'U_GYE5071 CHONGON CENTRO', '3G 1 (TT-000000930430)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3712', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-087', 'U_GYE5071 CHONGON CENTRO', '3G 1 (TT-000000930430)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3713', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-087', 'U_GYE5071 CHONGON CENTRO', '3G 1 (TT-000000930430)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3714', '121', '859', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3715', '121', '860', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3716', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3717', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-088', 'U_GYE5132_BOLIVARIANA', '3G EXP 1 (TT-000000931050)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3718', '121', '861', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3719', '121', '862', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3720', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3721', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-089', 'U_GYE5163_MAPASINGUE_OESTE', '3G EXP 1 (TT-000000931549)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3722', '121', '863', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3723', '121', '864', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3724', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3725', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-090', 'U_GYE5201_PORTAL_AL_SOL', '3G EXP 3 (TT-000000931551)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3726', '121', '865', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3727', '121', '866', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3728', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3729', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-091', 'U_GYE5102_TERMINAL_TERRESTRE_GYE', '3G 3 (TT-000000931641)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3730', '121', '867', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3731', '121', '868', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3732', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3733', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-092', 'U_GYE_5035 CAPEIRA', '3G 1 (TT-000000931643)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3734', '121', '869', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3735', '121', '870', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3736', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3737', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-093', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000931665)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3738', '121', '871', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3739', '121', '872', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3740', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3741', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-094', 'U_GYE5165 MERCADO OESTE', '3G EXP 1 (TT-000000932562)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3742', '121', '873', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3743', '121', '874', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3744', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3745', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-095', 'U_GYE5045_KENNEDY_SUR', '3G 1 (TT-000000934834)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3746', '121', '875', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-096', 'U_GYE5617_CHIPIPE', '3G 3 (TT-000000935804)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3747', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-096', 'U_GYE5617_CHIPIPE', '3G 3 (TT-000000935804)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3748', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-096', 'U_GYE5617_CHIPIPE', '3G 3 (TT-000000935804)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3749', '121', '876', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-097', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000937130)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3750', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-097', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000937130)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3751', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-097', 'U_GYE5468_CRUCITA_CENTRO', '3G EXP 3 (TT-000000937130)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3752', '121', '877', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-098', 'U_GYE5514_MANTA_REYES', '3G EXP 3 (TT-000000937132)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3753', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-098', 'U_GYE5514_MANTA_REYES', '3G EXP 3 (TT-000000937132)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3754', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-098', 'U_GYE5514_MANTA_REYES', '3G EXP 3 (TT-000000937132)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3755', '121', '878', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-099', 'U_GYE5545_CHONE_ESTE', '3G EXP 3 (TT-000000937134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3756', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-099', 'U_GYE5545_CHONE_ESTE', '3G EXP 3 (TT-000000937134)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3757', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-099', 'U_GYE5545_CHONE_ESTE', '3G EXP 3 (TT-000000937134)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3758', '121', '879', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-100', 'U_GYE5460_PORTOVIEJO_LA_ROTONDA', '3G EXP 3 (TT-000000937228)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3759', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-100', 'U_GYE5460_PORTOVIEJO_LA_ROTONDA', '3G EXP 3 (TT-000000937228)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3760', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-100', 'U_GYE5460_PORTOVIEJO_LA_ROTONDA', '3G EXP 3 (TT-000000937228)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3761', '121', '880', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-101', 'U_GYE5493_CHARAPOTO', '3G EXP 3 (TT-000000937231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3762', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-101', 'U_GYE5493_CHARAPOTO', '3G EXP 3 (TT-000000937231)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3763', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-101', 'U_GYE5493_CHARAPOTO', '3G EXP 3 (TT-000000937231)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3764', '121', '881', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-102', 'U_GYE5495_ANGEL_PEDRO_GILER', '3G EXP 3 (TT-000000937233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3765', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-102', 'U_GYE5495_ANGEL_PEDRO_GILER', '3G EXP 3 (TT-000000937233)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3766', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-102', 'U_GYE5495_ANGEL_PEDRO_GILER', '3G EXP 3 (TT-000000937233)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3767', '121', '882', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-103', 'U_GYE5541_JIPIJAPA_SUR', '3G EXP 3 (TT-000000937237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3768', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-103', 'U_GYE5541_JIPIJAPA_SUR', '3G EXP 3 (TT-000000937237)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3769', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-103', 'U_GYE5541_JIPIJAPA_SUR', '3G EXP 3 (TT-000000937237)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3770', '121', '883', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-104', 'U_GYE5750_BABAHOYO', '3G 1 (TT-000000938381)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3771', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-104', 'U_GYE5750_BABAHOYO', '3G 1 (TT-000000938381)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3772', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-104', 'U_GYE5750_BABAHOYO', '3G 1 (TT-000000938381)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3773', '121', '884', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-105', 'U_GYE5071_CHONGON_CENTRO', '3G 2 (TT-000000939372)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3774', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-105', 'U_GYE5071_CHONGON_CENTRO', '3G 2 (TT-000000939372)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3775', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-105', 'U_GYE5071_CHONGON_CENTRO', '3G 2 (TT-000000939372)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3776', '121', '885', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-106', 'U_GYE5806_VALENCIA', '3G EXP 1 (TT-000000942396)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3777', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-106', 'U_GYE5806_VALENCIA', '3G EXP 1 (TT-000000942396)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3778', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-106', 'U_GYE5806_VALENCIA', '3G EXP 1 (TT-000000942396)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3779', '121', '886', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3780', '121', '887', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3781', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3782', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-107', 'U_GYE5060_SAN_IGNACIO_DE_LOYOLA', '3G 2 (TT-000000943574)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3783', '121', '888', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3784', '121', '889', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3785', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3786', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-108', 'U_GYE5015_PUERTO_NUEVO', '3G 1 (TT-000000945080)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3787', '121', '890', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3788', '121', '891', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3789', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3790', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-109', 'U_GYE5037_GUASMO_SUR_TEM', '3G 1 (TT-000000946339)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3791', '121', '892', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3792', '121', '893', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3793', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3794', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-110', 'U_GYE5073 FLOR DE BASTION ', '3G 2 (TT-000000946377)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3795', '121', '894', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3796', '121', '895', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3797', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3798', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-111', 'U_GYE5094_PROSPERINA', '3G 2 (TT-000000946432)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3799', '121', '896', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3800', '121', '897', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3801', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3802', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-112', 'U_GYE5355_BOLICHE', '3G 1 (TT-000000946437)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3803', '121', '898', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-113', 'U_GYE5044_VILLA_CLUB', '3G 1 (TT-000000946670)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3804', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-113', 'U_GYE5044_VILLA_CLUB', '3G 1 (TT-000000946670)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3805', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-113', 'U_GYE5044_VILLA_CLUB', '3G 1 (TT-000000946670)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3806', '121', '899', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3807', '121', '900', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3808', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3809', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-114', 'U_GYE5184_URDANETA_SUR', '3G EXP 2 (TT-000000947975)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3810', '121', '901', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3811', '121', '902', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3812', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3813', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-115', 'U_GYE5090_NAVAL_NORTE', '3G 2 (TT-000000947977)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3814', '121', '903', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-116', 'U_GYE5075_GARAY', '3G 2 (TT-000000950737)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3815', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-116', 'U_GYE5075_GARAY', '3G 2 (TT-000000950737)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3816', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-116', 'U_GYE5075_GARAY', '3G 2 (TT-000000950737)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3817', '121', '904', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3818', '121', '905', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3819', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '2', '0.00');
INSERT INTO `billdetail` VALUES ('3820', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-117', 'U_GYE5104_TRINIPUERTO', '3G 2 (TT-000000951446)', '8', '0.00');
INSERT INTO `billdetail` VALUES ('3821', '121', '906', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-118', 'U_GYE5093_PRADERA_SUR', '3G 2 (TT-000000951448)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3822', '121', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-118', 'U_GYE5093_PRADERA_SUR', '3G 2 (TT-000000951448)', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3823', '121', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-118', 'U_GYE5093_PRADERA_SUR', '3G 2 (TT-000000951448)', '4', '0.00');
INSERT INTO `billdetail` VALUES ('3824', '120', '907', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3825', '120', '908', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3826', '120', '909', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3827', '120', '910', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3828', '120', '911', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3829', '120', '912', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3830', '120', '913', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3831', '120', '914', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3832', '120', '915', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3833', '120', '916', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3834', '120', '917', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3835', '120', '918', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3836', '120', '919', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3837', '120', '920', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3838', '120', '921', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3839', '120', '922', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3840', '120', '923', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3841', '120', '924', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3842', '120', '925', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3843', '120', '926', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3844', '120', '927', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3845', '120', '928', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3846', '120', '929', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3847', '120', '930', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3848', '120', '931', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3849', '120', '932', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3850', '120', '933', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3851', '120', '934', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3852', '120', '935', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3853', '120', '936', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3854', '120', '937', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3855', '120', '938', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3856', '120', '939', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3857', '120', '940', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3858', '120', '941', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3859', '120', '942', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3860', '120', '943', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3861', '120', '944', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3862', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '40', '0.00');
INSERT INTO `billdetail` VALUES ('3863', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '160', '0.00');
INSERT INTO `billdetail` VALUES ('3864', '120', '945', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3865', '120', '946', 'N/A', 'N/A', 'N/A', '31', 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3866', '123', '907', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3867', '123', '908', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3868', '123', '909', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3869', '123', '910', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3870', '123', '911', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3871', '123', '912', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3872', '123', '913', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3873', '123', '914', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3874', '123', '915', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3875', '123', '916', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3876', '123', '917', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3877', '123', '918', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3878', '123', '919', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3879', '123', '920', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3880', '123', '921', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3881', '123', '922', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3882', '123', '923', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3883', '123', '924', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3884', '123', '925', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3885', '123', '926', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3886', '123', '927', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3887', '123', '928', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3888', '123', '929', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3889', '123', '930', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3890', '123', '931', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3891', '123', '932', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3892', '123', '933', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3893', '123', '934', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3894', '123', '935', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3895', '123', '936', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3896', '123', '937', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3897', '123', '938', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3898', '123', '939', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3899', '123', '940', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3900', '123', '941', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3901', '123', '942', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3902', '123', '943', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3903', '123', '944', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3904', '123', '701', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '40', '0.00');
INSERT INTO `billdetail` VALUES ('3905', '123', '702', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '160', '0.00');
INSERT INTO `billdetail` VALUES ('3906', '123', '945', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3907', '123', '946', 'N/A', 'N/A', 'N/A', null, 'ACT-ENT-018-119', 'VARIAS', '3G EXP 2', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3908', '120', '947', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3909', '120', '948', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3910', '120', '949', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3911', '120', '950', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3912', '120', '951', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3913', '120', '952', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3914', '120', '953', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3915', '120', '954', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3916', '120', '955', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3917', '120', '956', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3918', '120', '957', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3919', '120', '958', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3920', '120', '959', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3921', '120', '960', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3922', '120', '961', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3923', '120', '962', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3924', '120', '963', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3925', '120', '964', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3926', '120', '965', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3927', '120', '966', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3928', '120', '967', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3929', '120', '968', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3930', '120', '969', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3931', '120', '970', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3932', '120', '971', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3933', '120', '972', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3934', '120', '973', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3935', '120', '974', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3936', '120', '975', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3937', '120', '976', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3938', '120', '977', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3939', '120', '978', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3940', '120', '979', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3941', '120', '980', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3942', '120', '981', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3943', '120', '982', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3944', '120', '983', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3945', '120', '984', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3946', '120', '985', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3947', '120', '986', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3948', '120', '987', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3949', '120', '988', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3950', '120', '989', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3951', '120', '990', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3952', '120', '991', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3953', '120', '992', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3954', '120', '993', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3955', '120', '994', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3956', '120', '995', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3957', '120', '996', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3958', '120', '701', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '59', '0.00');
INSERT INTO `billdetail` VALUES ('3959', '120', '702', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '236', '0.00');
INSERT INTO `billdetail` VALUES ('3960', '120', '997', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3961', '120', '998', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3962', '120', '999', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3972', '124', '1008', 'N/A', 'N/A', 'N/A', '38', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3973', '124', '1009', 'N/A', 'N/A', 'N/A', '38', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3974', '124', '1010', 'N/A', 'N/A', 'N/A', '39', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3975', '124', '1011', 'N/A', 'N/A', 'N/A', '38', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3976', '124', '1012', 'N/A', 'N/A', 'N/A', '38', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3977', '124', '1013', 'N/A', 'N/A', 'N/A', '38', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3978', '124', '1014', 'N/A', 'N/A', 'N/A', '38', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3979', '124', '1000', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'DEVOLUCION UNION ELECTRICA S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3980', '124', '1001', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'DEVOLUCION UNION ELECTRICA S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3981', '124', '1002', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3982', '124', '1003', 'N/A', 'N/A', 'N/A', '31', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3983', '124', '803', 'N/A', 'N/A', 'N/A', '12', 'N/A', 'DEVOLUCION DINA LINK TARJETA CONECTOR DAÑADO (RETIRADA PARA PRUEBAS OK)  (NO UTILIZAR PARA TRANSNEXA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3984', '124', '1015', 'N/A', 'N/A', 'N/A', '39', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3985', '124', '1016', 'N/A', 'N/A', 'N/A', '38', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3986', '124', '1017', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA TELPROYEC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3987', '124', '1018', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3988', '124', '1019', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3989', '124', '1020', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3990', '124', '1021', 'POR-0041-12', 'N/A', 'N/A', '45', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3991', '124', '1022', 'POR-0051-11', 'N/A', 'N/A', '45', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3992', '124', '1023', 'POR-0056-12', 'N/A', 'N/A', '45', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3993', '124', '1024', 'POR-0045-12', 'N/A', 'N/A', '45', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3994', '124', '1025', 'N/A', 'N/A', 'N/A', '39', 'N/A', 'DEVOLUCION DINALINK S.A (TRANSNEXA NUEVO REQUERIMIENTO)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3995', '124', '1026', 'CNTD-344-12', 'N/A', 'N/A', '45', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3996', '124', '1027', 'POR-0025-12', 'N/A', 'N/A', '45', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3997', '124', '1028', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3998', '124', '1004', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE (3HE00036AA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('3999', '124', '1029', 'POR-0042-12', 'N/A', 'N/A', '45', 'N/A', 'N/A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4000', '124', '1030', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4001', '124', '1031', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION MAQUETA GYE UNION ELECTRIC', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4002', '124', '1005', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE (3HE00036AA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4003', '124', '1006', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE (3HE00036AA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4004', '124', '1007', 'N/A', 'N/A', 'N/A', '11', 'N/A', 'ENTREGADO POR LYDY AGUIRRE (3HE00036AA)', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4005', '124', '1032', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A ( NUEVOS )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4006', '124', '1033', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A ( NUEVOS )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4007', '124', '1034', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A ( NUEVOS )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4008', '124', '1035', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A ( NUEVOS )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4009', '124', '1036', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A ( NUEVOS )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4010', '124', '1037', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A ( NUEVOS )', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4011', '124', '1038', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4012', '124', '1039', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A DARWIN CANCHIGNIA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4013', '124', '1040', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'ENTREGA UNION ELECTRICA S.A DARWIN CANCHIGNIA', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4014', '124', '1041', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4015', '124', '1042', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4016', '124', '1043', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4017', '124', '1044', 'N/A', 'N/A', 'N/A', '45', 'N/A', 'DEVOLUCION DINALINK S.A', 'N/A', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4018', '125', '1', 'N/A', '1011584067', 'ECL01LTS15-EC1-A000107', null, 'ENTREGADO DE LA BASE ANTIGUA', 'N/A', 'PROYECTO LTE CNT', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4019', '126', '1045', 'POR-091-17', '1011515416', 'ECL02IOM23-EC1-A000107', '10', 'INGRESO SOLICITADO POR EL PM', 'N/A', 'CAMBIO DE IOM', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4020', '126', '1046', 'POR-092-17', '1011515416', 'ECL02IOM23-EC1-A000107', '12', 'INGRESO SOLICITADO POR EL PM', 'N/A', 'CAMBIO DE IOM', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4021', '127', '1047', 'POR-083-17', '1011523601', '1011523601-EC1-A020360', '26', 'SEPARADO PARA TELCONET', 'N/A', 'TELCONET', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4022', '127', '1048', 'POR-097-17', '1011642357', 'ECL02R2017-EC1-A030430', '26', 'INGRESADO LUEGO DE LA REPARACIÓN', 'N/A', 'IPRAN FASE', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4023', '127', '1049', 'POR-096-17', '1011642357', 'ECL02R2017-EC1-A030430', '26', 'INGRESADO LUEGO DE LA REPARACIÓN', 'N/A', 'IPRAN FASE', '1', '0.00');
INSERT INTO `billdetail` VALUES ('4024', '127', '1050', 'POR-095-17', '1011642357', 'ECL02R2017-EC1-A030430', '26', 'INGRESADO LUEGO DE LA REPARACION', 'N/A', 'IPRAN FASE', '1', '0.00');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukbrand` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('2', 'ALCATEL LUCENT');
INSERT INTO `brand` VALUES ('5', 'ELTEK');
INSERT INTO `brand` VALUES ('6', 'NOKIA');
INSERT INTO `brand` VALUES ('1', 'SIN ASIGNAR');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukcategory` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', '3G');
INSERT INTO `category` VALUES ('7', 'DSLAM');
INSERT INTO `category` VALUES ('8', 'ENERGIA');
INSERT INTO `category` VALUES ('1', 'IP RAN');
INSERT INTO `category` VALUES ('5', 'LTE');
INSERT INTO `category` VALUES ('6', 'OTR');
INSERT INTO `category` VALUES ('3', 'WIFI');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukdni` (`dni`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', null, 'CRISTIAN MONTENEGRO', null, '', null, 'CNT EP');
INSERT INTO `client` VALUES ('7', null, 'GABRIEL RODAS', null, '', null, 'FLEXNET UIO');
INSERT INTO `client` VALUES ('8', null, 'CARLOS GUEVARA', null, '', null, 'CNT');
INSERT INTO `client` VALUES ('9', null, 'BODEGA FLEXNET SCRAPT', null, '', null, 'FLEXNET');
INSERT INTO `client` VALUES ('10', null, 'JUAN MORÁN', null, '', null, 'NOKIA');
INSERT INTO `client` VALUES ('11', null, 'DINALINK', null, '', null, 'DINALINK');
INSERT INTO `client` VALUES ('12', null, 'PEDRO APARICIO', null, '', null, 'DINALINK');
INSERT INTO `client` VALUES ('13', null, 'MARIBEL HERRERA', null, '', null, 'CNT EP');

-- ----------------------------
-- Table structure for codigo
-- ----------------------------
DROP TABLE IF EXISTS `codigo`;
CREATE TABLE `codigo` (
  `year` year(4) NOT NULL,
  `type` int(5) NOT NULL,
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `bill` int(11) DEFAULT NULL,
  PRIMARY KEY (`year`,`type`,`id`),
  KEY `billfk` (`bill`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of codigo
-- ----------------------------
INSERT INTO `codigo` VALUES ('2018', '1', '1', '1');
INSERT INTO `codigo` VALUES ('2018', '1', '2', '100');
INSERT INTO `codigo` VALUES ('2018', '2', '1', '101');
INSERT INTO `codigo` VALUES ('2018', '2', '2', '102');
INSERT INTO `codigo` VALUES ('2018', '2', '3', '103');
INSERT INTO `codigo` VALUES ('2018', '1', '3', '104');
INSERT INTO `codigo` VALUES ('2018', '1', '4', '105');
INSERT INTO `codigo` VALUES ('2018', '2', '4', '106');
INSERT INTO `codigo` VALUES ('2018', '2', '5', '107');
INSERT INTO `codigo` VALUES ('2018', '2', '6', '108');
INSERT INTO `codigo` VALUES ('2018', '2', '7', '109');
INSERT INTO `codigo` VALUES ('2018', '2', '8', '110');
INSERT INTO `codigo` VALUES ('2018', '2', '9', '111');
INSERT INTO `codigo` VALUES ('2018', '2', '10', '112');
INSERT INTO `codigo` VALUES ('2018', '2', '11', '113');
INSERT INTO `codigo` VALUES ('2018', '2', '12', '117');
INSERT INTO `codigo` VALUES ('2018', '1', '5', '120');
INSERT INTO `codigo` VALUES ('2018', '2', '13', '121');
INSERT INTO `codigo` VALUES ('2018', '1', '6', '122');
INSERT INTO `codigo` VALUES ('2018', '2', '14', '123');
INSERT INTO `codigo` VALUES ('2018', '1', '7', '124');
INSERT INTO `codigo` VALUES ('2018', '2', '15', '125');
INSERT INTO `codigo` VALUES ('2018', '1', '8', '126');
INSERT INTO `codigo` VALUES ('2018', '1', '9', '127');

-- ----------------------------
-- Table structure for error
-- ----------------------------
DROP TABLE IF EXISTS `error`;
CREATE TABLE `error` (
  `id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `message` text,
  `user` varchar(255) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of error
-- ----------------------------
INSERT INTO `error` VALUES ('000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000029', 'ER_ROW_IS_REFERENCED_2', '2018-02-06 17:24:22', 'Cannot delete or update a parent row: a foreign key constraint fails (`nokia`.`bill`, CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`))', 'GABRIEL SALAZAR', 'PROVIDER');
INSERT INTO `error` VALUES ('000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030', 'ER_ROW_IS_REFERENCED_2', '2018-02-06 17:24:24', 'Cannot delete or update a parent row: a foreign key constraint fails (`nokia`.`bill`, CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`))', 'GABRIEL SALAZAR', 'PROVIDER');
INSERT INTO `error` VALUES ('000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000031', 'ER_ROW_IS_REFERENCED_2', '2018-02-06 17:24:26', 'Cannot delete or update a parent row: a foreign key constraint fails (`nokia`.`bill`, CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`))', 'GABRIEL SALAZAR', 'PROVIDER');
INSERT INTO `error` VALUES ('000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000032', 'ER_ROW_IS_REFERENCED_2', '2018-02-07 11:00:06', 'Cannot delete or update a parent row: a foreign key constraint fails (`nokia`.`bill`, CONSTRAINT `client` FOREIGN KEY (`client`) REFERENCES `client` (`id`))', 'GABRIEL SALAZAR', 'CLIENT');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT NULL,
  `values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `user` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2642 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1633', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 15:21:54', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1634', 'LOCATION', 0x7B226964223A22222C226E616D65223A2275626963616369C3B36E2031227D, 'GABRIEL SALAZAR', '2018-02-05 15:22:06', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1635', 'LOCATION', 0x7B226964223A22222C226E616D65223A2275626963616369706E2032227D, 'GABRIEL SALAZAR', '2018-02-05 15:22:15', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1636', 'LOCATION', 0x7B226964223A2232222C226E616D65223A2255424943414349C3B36E4E2032227D, 'GABRIEL SALAZAR', '2018-02-05 15:22:25', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1637', 'LOCATION', 0x7B226964223A2232222C226E616D65223A2255424943414349C3934E2032227D, 'GABRIEL SALAZAR', '2018-02-05 15:22:33', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1638', 'CATEGORY', 0x7B226964223A22222C226E616D65223A227469706F2031227D, 'GABRIEL SALAZAR', '2018-02-05 15:23:49', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1639', 'CATEGORY', 0x7B226964223A22222C226E616D65223A227469706F2032227D, 'GABRIEL SALAZAR', '2018-02-05 15:23:55', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1640', 'CATEGORY', 0x7B226964223A2231222C226E616D65223A225449504F20317364227D, 'GABRIEL SALAZAR', '2018-02-05 15:23:59', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1641', 'CATEGORY', 0x7B226964223A2231222C226E616D65223A225449504F2031227D, 'GABRIEL SALAZAR', '2018-02-05 15:24:05', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1642', 'BRAND', 0x7B226964223A22222C226E616D65223A226D617263612031227D, 'GABRIEL SALAZAR', '2018-02-05 15:24:57', '::1', 'CREATE');
INSERT INTO `event` VALUES ('1643', 'BRAND', 0x7B226964223A22222C226E616D65223A226D617263612032227D, 'GABRIEL SALAZAR', '2018-02-05 15:25:09', '::1', 'CREATE');
INSERT INTO `event` VALUES ('1644', 'MODEL', 0x7B226964223A22222C22636F6465223A2231222C226465736372697074696F6E223A2270726F647563746F2031222C226272616E64223A2231222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-02-05 15:31:20', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1645', 'MODEL', 0x7B226964223A22222C22636F6465223A22312D7364222C226465736372697074696F6E223A2270726F647563746F2031222C226272616E64223A2231222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-02-05 15:31:46', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1646', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 15:47:52', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1647', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 15:49:14', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1648', 'PROVIDER', 0x7B226964223A22222C226E616D65223A2270726F766565646F722031222C22636F6D70616E79223A22656D70726573612031227D, 'GABRIEL SALAZAR', '2018-02-05 15:55:21', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1649', 'PROVIDER', 0x7B226964223A22222C226E616D65223A2270726F766565646F722032222C22636F6D70616E79223A22656D70726573612032227D, 'GABRIEL SALAZAR', '2018-02-05 15:55:38', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1650', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A224D6F6E2046656220303520323031382031353A35353A343420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22303235303532222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-05 15:55:54', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1651', 'MODEL', 0x7B226964223A22222C22636F6465223A2231323231222C226465736372697074696F6E223A2232313231222C226272616E64223A2231222C2263617465676F7279223A2231222C22626172636F6465223A2231323231227D, 'GABRIEL SALAZAR', '2018-02-05 16:03:17', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1652', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 16:07:02', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1653', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 16:11:51', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1654', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 16:13:57', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1655', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 16:38:13', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1656', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 16:48:58', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1657', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2231222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A223132227D, 'GABRIEL SALAZAR', '2018-02-05 16:49:12', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1658', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2232222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A223131363531353631227D, 'GABRIEL SALAZAR', '2018-02-05 16:49:27', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1659', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:03:38', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1660', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:06:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1661', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:07:40', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1662', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:08:19', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1663', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2233222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A22343134313431227D, 'GABRIEL SALAZAR', '2018-02-05 17:08:32', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1664', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2231222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A22313431343134227D, 'GABRIEL SALAZAR', '2018-02-05 17:09:13', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1665', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:20:53', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1666', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:21:47', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1667', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:22:58', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1668', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:35:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1669', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-05 17:36:14', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1670', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 10:08:30', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1671', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 10:29:37', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1672', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 10:40:15', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1673', 'CLIENT', 0x7B226964223A22222C226E616D65223A227061626C6F2073616C617A6172222C22636F6D70616E79223A22656D70726573612031227D, 'GABRIEL SALAZAR', '2018-02-06 10:48:47', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1674', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2232222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A22313233227D, 'GABRIEL SALAZAR', '2018-02-06 10:54:03', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1675', 'PRODUCT', 0x7B226964223A22222C2250726F647563746F223A22222C22626172636F6465223A223235222C226272616E64223A22222C2263617465676F7279223A22222C226465736372697074696F6E223A22222C2262696C6C223A2231222C2269646C6F636174696F6E223A2230222C22636F6465223A2231222C226C6F636174696F6E5B746578745D223A2255424943414349C3934E2031222C226C6F636174696F6E5B76616C75655D223A2231222C22666472223A2232353235222C2263736F223A2232353234222C22776273223A22343532343532222C22636F6D6D656E74223A22343532343532227D, 'GABRIEL SALAZAR', '2018-02-06 11:11:06', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1676', 'PRODUCT', 0x7B226964223A22222C2250726F647563746F223A22222C22626172636F6465223A223431343134222C226272616E64223A22222C2263617465676F7279223A22222C226465736372697074696F6E223A22222C2262696C6C223A2231222C2269646C6F636174696F6E223A2230222C22636F6465223A2231222C226C6F636174696F6E5B746578745D223A2255424943414349C3934E2032222C226C6F636174696F6E5B76616C75655D223A2232222C22666472223A2231343431222C2263736F223A2231343134222C22776273223A22313431222C22636F6D6D656E74223A223431227D, 'GABRIEL SALAZAR', '2018-02-06 11:12:36', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1677', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:15:41', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1678', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:25:11', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1679', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:26:59', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1680', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:28:44', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1681', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:35:21', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1682', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:39:41', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1683', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:44:11', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1684', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 11:47:15', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1685', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:06:41', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1686', 'PRODUCT', 0x7B226964223A2237222C22666472223A227364617364617364222C2263736F223A2261736461222C22776273223A227364617364222C226C6F636174696F6E223A2232222C22626172636F6465223A22313536343635313531363531222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2231222C22636F6D6D656E74223A22617364617364617364227D, 'GABRIEL SALAZAR', '2018-02-06 12:06:48', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1687', 'PRODUCT', 0x7B226964223A2236222C22666472223A22666472313233222C2263736F223A22736163617363222C22776273223A22617363617363222C226C6F636174696F6E223A2232222C22626172636F6465223A2231323533222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2231222C22636F6D6D656E74223A226E6F207469656E65206461C3B16F227D, 'GABRIEL SALAZAR', '2018-02-06 12:06:52', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1688', 'PRODUCT', 0x7B226964223A2235222C22666472223A223235222C2263736F223A223235222C22776273223A223235222C226C6F636174696F6E223A2232222C22626172636F6465223A22323532353235222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2231222C22636F6D6D656E74223A223235227D, 'GABRIEL SALAZAR', '2018-02-06 12:06:53', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1689', 'PRODUCT', 0x7B226964223A2234222C22666472223A22333234222C2263736F223A2234323334222C22776273223A22323334222C226C6F636174696F6E223A2231222C22626172636F6465223A22313233222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2231222C22636F6D6D656E74223A22323334227D, 'GABRIEL SALAZAR', '2018-02-06 12:06:55', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1690', 'PRODUCT', 0x7B226964223A2233222C22666472223A2273222C2263736F223A2273222C22776273223A2273222C226C6F636174696F6E223A2231222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2231222C22636F6D6D656E74223A2273227D, 'GABRIEL SALAZAR', '2018-02-06 12:06:57', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1691', 'MODEL', 0x7B226964223A22222C22636F6465223A22313233222C226465736372697074696F6E223A2270726F647563746F313233222C226272616E64223A2231222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-02-06 12:08:41', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1692', 'MODEL', 0x7B226964223A22222C22636F6465223A223132332D62222C226465736372697074696F6E223A2270726F647563746F313233222C226272616E64223A2231222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-02-06 12:08:58', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1693', 'PRODUCT', 0x7B226964223A2231222C22666472223A2246445231222C2263736F223A2243534F31222C22776273223A2257425331222C226C6F636174696F6E223A2231222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2231222C22636F6D6D656E74223A22454E54524F2044414E41444F227D, 'GABRIEL SALAZAR', '2018-02-06 12:09:20', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1694', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:22:42', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1695', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:28:45', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1696', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:33:08', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1697', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:34:26', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1698', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:36:27', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1699', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:40:50', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1700', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 12:42:42', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1701', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2231222C2264617465223A225475652046656220303620323031382031323A34393A333820474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235323532222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 12:49:50', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1702', 'PRODUCT', 0x7B226964223A223131222C22666472223A223731222C2263736F223A22373134222C22776273223A22373431222C226C6F636174696F6E223A2232222C22626172636F6465223A22373431383532222C22636F6465223A2233222C226465736372697074696F6E223A2232313231222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2233222C22636F6D6D656E74223A22373431227D, 'GABRIEL SALAZAR', '2018-02-06 12:52:33', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1703', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 14:20:01', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1704', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 14:21:06', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1705', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 14:22:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1706', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 14:24:00', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1707', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 14:25:01', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1708', 'VOUCHER', 0x7B226964223A2232222C2270726F7669646572223A22222C22646F63756D656E74223A2231222C2264617465223A224D6F6E2046656220303520323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2230353935222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-06 14:38:30', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1709', 'BILL', 0x7B226964223A2233222C2270726F7669646572223A2232222C22646F63756D656E74223A2231222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235323532222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-06 14:38:35', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1710', 'BILL', 0x7B226964223A2231222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A224D6F6E2046656220303520323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22303235303532222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-06 14:38:40', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1711', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2233222C2264617465223A225475652046656220303620323031382031343A33393A333920474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223035353135222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 14:39:50', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1712', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225475652046656220303620323031382031343A34313A353420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A226173222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 14:42:01', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1713', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2231222C2264617465223A225475652046656220303620323031382031343A35353A343120474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A227364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 14:55:48', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1714', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 15:06:44', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1715', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 15:07:13', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1716', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 15:07:24', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1717', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 16:27:37', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1718', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 16:27:44', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1719', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 16:28:53', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1720', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 16:29:01', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1721', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 16:58:57', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1722', 'LOCATION', 0x7B226964223A2231222C226E616D65223A2255424943414349C3934E2033227D, 'GABRIEL SALAZAR', '2018-02-06 16:59:29', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1723', 'LOCATION', 0x7B226964223A2231222C226E616D65223A2255424943414349C3934E2031227D, 'GABRIEL SALAZAR', '2018-02-06 16:59:36', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1724', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2232222C2264617465223A225475652046656220303620323031382031373A30313A343620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A226466222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:01:57', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1725', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2231222C2264617465223A225475652046656220303620323031382031373A30313A343620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2273647364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:02:11', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1726', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2232222C2264617465223A225475652046656220303620323031382031373A30333A343220474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A227364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:03:49', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1727', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2232222C2264617465223A225475652046656220303620323031382031373A30373A313920474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223431343134222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:07:31', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1728', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2234222C2264617465223A225475652046656220303620323031382031373A30373A313920474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223731373437222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:07:49', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1729', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225475652046656220303620323031382031373A30383A333020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223134313431222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:08:39', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1730', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225475652046656220303620323031382031373A30393A303420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2264617364617364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:09:13', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1731', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225475652046656220303620323031382031373A30393A303420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A226173647364617364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:09:21', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1732', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225475652046656220303620323031382031373A30393A303420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22313431343134222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:09:40', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1733', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225765642046656220303720323031382031373A31303A333620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223431343134222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:10:46', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1734', 'BRAND', 0x7B226964223A22222C226E616D65223A22617364617364227D, 'GABRIEL SALAZAR', '2018-02-06 17:11:33', '::1', 'CREATE');
INSERT INTO `event` VALUES ('1735', 'BRAND', 0x7B226964223A2233222C226E616D65223A22415344415344227D, 'GABRIEL SALAZAR', '2018-02-06 17:11:36', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1736', 'BRAND', 0x7B226964223A22222C226E616D65223A22617364617364227D, 'GABRIEL SALAZAR', '2018-02-06 17:11:39', '::1', 'CREATE');
INSERT INTO `event` VALUES ('1737', 'BRAND', 0x7B226964223A2234222C226E616D65223A22415344415344227D, 'GABRIEL SALAZAR', '2018-02-06 17:11:43', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1738', 'BRAND', 0x7B226964223A2232222C226E616D65223A224D415243412032227D, 'GABRIEL SALAZAR', '2018-02-06 17:11:47', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1739', 'BRAND', 0x7B226964223A22222C226E616D65223A2231313431227D, 'GABRIEL SALAZAR', '2018-02-06 17:12:03', '::1', 'CREATE');
INSERT INTO `event` VALUES ('1740', 'BRAND', 0x7B226964223A2235222C226E616D65223A2231313431686A68676A227D, 'GABRIEL SALAZAR', '2018-02-06 17:12:09', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1741', 'BRAND', 0x7B226964223A2235222C226E616D65223A22646673646673646664662F23227D, 'GABRIEL SALAZAR', '2018-02-06 17:12:22', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1742', 'BRAND', 0x7B226964223A22222C226E616D65223A223431316667227D, 'GABRIEL SALAZAR', '2018-02-06 17:12:47', '::1', 'CREATE');
INSERT INTO `event` VALUES ('1743', 'CATEGORY', 0x7B226964223A22222C226E616D65223A223431227D, 'GABRIEL SALAZAR', '2018-02-06 17:13:11', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1744', 'CATEGORY', 0x7B226964223A2232222C226E616D65223A225449504F2032227D, 'GABRIEL SALAZAR', '2018-02-06 17:13:14', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1745', 'CATEGORY', 0x7B226964223A2233222C226E616D65223A223431227D, 'GABRIEL SALAZAR', '2018-02-06 17:13:26', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1746', 'MODEL', 0x7B226964223A22222C22636F6465223A22343737222C226465736372697074696F6E223A2234373437222C226272616E64223A2236222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-02-06 17:13:58', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1747', 'MODEL', 0x7B226964223A22222C22636F6465223A2261222C226465736372697074696F6E223A2261222C226272616E64223A2236222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-02-06 17:14:19', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1748', 'MODEL', 0x7B226964223A2237222C22636F6465223A2241726572222C226465736372697074696F6E223A2241657265222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2236227D, 'GABRIEL SALAZAR', '2018-02-06 17:14:30', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1749', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2237222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A227364227D, 'GABRIEL SALAZAR', '2018-02-06 17:15:32', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1750', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2231222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A22707275656261227D, 'GABRIEL SALAZAR', '2018-02-06 17:15:44', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1751', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2236222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A2261616161227D, 'GABRIEL SALAZAR', '2018-02-06 17:17:36', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1752', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225475652046656220303620323031382031373A31383A313220474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A225344222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-06 17:18:38', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1753', 'VOUCHER', 0x7B226964223A223132222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223134313431222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-06 17:19:14', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1754', 'VOUCHER', 0x7B226964223A223136222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225765642046656220303720323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223431343134222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-06 17:19:17', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1755', 'VOUCHER', 0x7B226964223A223135222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22313431343134222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-06 17:19:19', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1756', 'VOUCHER', 0x7B226964223A223134222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224153445344415344222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-06 17:19:21', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1757', 'VOUCHER', 0x7B226964223A223133222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2244415344415344222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-06 17:19:23', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1758', 'PRODUCT', 0x7B226964223A223431222C22666472223A223134222C2263736F223A223431222C22776273223A223431222C226C6F636174696F6E223A22222C22626172636F6465223A223431222C22636F6465223A2237222C226465736372697074696F6E223A2241455245222C2263617465676F7279223A225449504F2031222C226272616E64223A223431314647222C2262696C6C223A2235222C22636F6D6D656E74223A223431227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:36', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1759', 'PRODUCT', 0x7B226964223A223430222C22666472223A223134222C2263736F223A223134222C22776273223A223431222C226C6F636174696F6E223A22222C22626172636F6465223A223134222C22636F6465223A2237222C226465736372697074696F6E223A2241455245222C2263617465676F7279223A225449504F2031222C226272616E64223A223431314647222C2262696C6C223A2235222C22636F6D6D656E74223A223431227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:37', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1760', 'PRODUCT', 0x7B226964223A223336222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A223435227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:38', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1761', 'PRODUCT', 0x7B226964223A223334222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A226667227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:38', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1762', 'PRODUCT', 0x7B226964223A223332222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A2232333332313331222C22636F6465223A2235222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A22343731373431227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:39', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1763', 'PRODUCT', 0x7B226964223A223330222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A223435227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:40', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1764', 'PRODUCT', 0x7B226964223A223238222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A226667227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:41', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1765', 'PRODUCT', 0x7B226964223A223236222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A2232333332313331222C22636F6465223A2235222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A22343731373431227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:42', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1766', 'PRODUCT', 0x7B226964223A223234222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A223435227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:42', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1767', 'PRODUCT', 0x7B226964223A223232222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A226667227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:43', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1768', 'PRODUCT', 0x7B226964223A223230222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A2232333332313331222C22636F6465223A2235222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A22343731373431227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:44', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1769', 'PRODUCT', 0x7B226964223A223138222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A223435227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:45', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1770', 'PRODUCT', 0x7B226964223A223136222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A22323331415331325341222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A226667227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:46', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1771', 'PRODUCT', 0x7B226964223A223134222C22666472223A22534144415344222C2263736F223A22534144415344222C22776273223A22534144415344222C226C6F636174696F6E223A22222C22626172636F6465223A2232333332313331222C22636F6465223A2235222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A2235222C22636F6D6D656E74223A22343731373431227D, 'GABRIEL SALAZAR', '2018-02-06 17:21:46', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1772', 'CLIENT', 0x7B226964223A22222C226E616D65223A226C75636173206573636F626172222C22636F6D70616E79223A2263696E65746F227D, 'GABRIEL SALAZAR', '2018-02-06 17:22:48', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1773', 'CLIENT', 0x7B226964223A22222C226E616D65223A226C75636173206465206C61206375657661222C22636F6D70616E79223A223233227D, 'GABRIEL SALAZAR', '2018-02-06 17:23:17', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1774', 'CLIENT', 0x7B226964223A22222C226E616D65223A22616C69636961222C22636F6D70616E79223A22616C696361227D, 'GABRIEL SALAZAR', '2018-02-06 17:23:31', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1775', 'CLIENT', 0x7B226964223A22222C226E616D65223A227A6F6C6120736F6C61222C22636F6D70616E79223A22617364227D, 'GABRIEL SALAZAR', '2018-02-06 17:23:44', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1776', 'PROVIDER', 0x7B226964223A22222C226E616D65223A2237346466736466222C22636F6D70616E79223A22736466736466227D, 'GABRIEL SALAZAR', '2018-02-06 17:24:14', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1777', 'PROVIDER', 0x7B226964223A2233222C22646E69223A22222C226E616D65223A2237344446534446222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22637265617465644174223A22222C22757064617465644174223A22222C22636F6D70616E79223A22534446534446227D, 'GABRIEL SALAZAR', '2018-02-06 17:24:18', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1778', 'LOCATION', 0x7B226964223A22222C226E616D65223A223731373431227D, 'GABRIEL SALAZAR', '2018-02-06 17:25:00', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1779', 'LOCATION', 0x7B226964223A2233222C226E616D65223A223731373431227D, 'GABRIEL SALAZAR', '2018-02-06 17:25:03', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1780', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 17:28:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1781', 'CLIENT', 0x7B226964223A22222C226E616D65223A227364617364222C22636F6D70616E79223A22617364617364227D, 'GABRIEL SALAZAR', '2018-02-06 17:29:04', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1782', 'PRODUCT', 0x7B226964223A2236222C22626172636F6465223A22313233222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:09', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1783', 'PRODUCT', 0x7B226964223A223331222C22626172636F6465223A22505255454241222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:12', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1784', 'PRODUCT', 0x7B226964223A223130222C22626172636F6465223A22323532353235222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:14', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1785', 'PRODUCT', 0x7B226964223A2239222C22626172636F6465223A22353432222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:15', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1786', 'PRODUCT', 0x7B226964223A2238222C22626172636F6465223A223431343134222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:16', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1787', 'PRODUCT', 0x7B226964223A223131222C22626172636F6465223A2231323533222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:17', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1788', 'PRODUCT', 0x7B226964223A223132222C22626172636F6465223A22313536343635313531363531222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:18', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1789', 'PRODUCT', 0x7B226964223A223135222C22626172636F6465223A22353433222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:19', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1790', 'PRODUCT', 0x7B226964223A223138222C22626172636F6465223A22353432222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:20', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1791', 'PRODUCT', 0x7B226964223A223139222C22626172636F6465223A22222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:21', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1792', 'PRODUCT', 0x7B226964223A223230222C22626172636F6465223A22222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:21', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1793', 'PRODUCT', 0x7B226964223A223236222C22626172636F6465223A223132222C22636F6465223A2232222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:22', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1794', 'PRODUCT', 0x7B226964223A2237222C22626172636F6465223A223235222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:26', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1795', 'PRODUCT', 0x7B226964223A2235222C22626172636F6465223A22313431343134222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:30', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1796', 'PRODUCT', 0x7B226964223A2233222C22626172636F6465223A223131363531353631222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:32', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1797', 'PRODUCT', 0x7B226964223A2232222C22626172636F6465223A223132222C22636F6465223A2231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:34', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1798', 'PRODUCT', 0x7B226964223A2234222C22626172636F6465223A22343134313431222C22636F6465223A2233222C226465736372697074696F6E223A2232313231222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:46', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1799', 'PRODUCT', 0x7B226964223A223234222C22626172636F6465223A22373431383532222C22636F6465223A2233222C226465736372697074696F6E223A2232313231222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:48', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1800', 'PRODUCT', 0x7B226964223A223133222C22626172636F6465223A22313233222C22636F6465223A2234222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:51', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1801', 'PRODUCT', 0x7B226964223A223231222C22626172636F6465223A223435222C22636F6465223A2234222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:52', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1802', 'PRODUCT', 0x7B226964223A223232222C22626172636F6465223A22343534353435222C22636F6465223A2234222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:53', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1803', 'PRODUCT', 0x7B226964223A223134222C22626172636F6465223A22313233222C22636F6465223A2235222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:54', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1804', 'PRODUCT', 0x7B226964223A223233222C22626172636F6465223A22373431383532222C22636F6465223A2235222C226465736372697074696F6E223A2250524F445543544F313233222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031227D, 'GABRIEL SALAZAR', '2018-02-06 17:30:55', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1805', 'PRODUCT', 0x7B226964223A223330222C22626172636F6465223A225344222C22636F6465223A2237222C226465736372697074696F6E223A2241455245222C2263617465676F7279223A225449504F2031222C226272616E64223A223431314647227D, 'GABRIEL SALAZAR', '2018-02-06 17:31:07', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1806', 'PRODUCT', 0x7B226964223A223333222C22626172636F6465223A223134222C22636F6465223A2237222C226465736372697074696F6E223A2241455245222C2263617465676F7279223A225449504F2031222C226272616E64223A223431314647227D, 'GABRIEL SALAZAR', '2018-02-06 17:31:11', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1807', 'PRODUCT', 0x7B226964223A223332222C22626172636F6465223A2241414141222C22636F6465223A2236222C226465736372697074696F6E223A2234373437222C2263617465676F7279223A225449504F2031222C226272616E64223A223431314647227D, 'GABRIEL SALAZAR', '2018-02-06 17:31:28', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1808', 'PRODUCT', 0x7B226964223A223334222C22626172636F6465223A223431222C22636F6465223A2237222C226465736372697074696F6E223A2241455245222C2263617465676F7279223A225449504F2031222C226272616E64223A223431314647227D, 'GABRIEL SALAZAR', '2018-02-06 17:31:30', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1809', 'PRODUCT', 0x7B226964223A22222C22636F6465223A2231222C226465736372697074696F6E223A22222C226272616E64223A22222C2263617465676F7279223A22222C22626172636F6465223A223731373431373431227D, 'GABRIEL SALAZAR', '2018-02-06 17:36:03', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1810', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 17:40:49', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1811', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-06 17:46:56', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1812', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 10:08:13', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1813', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 10:14:45', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1814', 'BILL', 0x7B226964223A223137222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A225344222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-07 10:45:20', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1815', 'BILL', 0x7B226964223A223130222C2270726F7669646572223A2232222C22646F63756D656E74223A2232222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223431343134222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-07 10:45:27', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1816', 'BILL', 0x7B226964223A2238222C2270726F7669646572223A2232222C22646F63756D656E74223A2231222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2253445344222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-07 10:45:33', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1817', 'BILL', 0x7B226964223A2237222C2270726F7669646572223A2232222C22646F63756D656E74223A2232222C2264617465223A225475652046656220303620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224446222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-07 10:45:36', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1818', 'CLIENT', 0x7B226964223A2235222C22646E69223A22222C226E616D65223A225A4F4C4120534F4C41222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22636F6D70616E79223A22415344227D, 'GABRIEL SALAZAR', '2018-02-07 10:59:55', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1819', 'CLIENT', 0x7B226964223A2236222C22646E69223A22222C226E616D65223A225344415344222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22636F6D70616E79223A22415344415344227D, 'GABRIEL SALAZAR', '2018-02-07 10:59:57', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1820', 'CLIENT', 0x7B226964223A2232222C22646E69223A22222C226E616D65223A224C55434153204553434F424152222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22636F6D70616E79223A2243494E45544F227D, 'GABRIEL SALAZAR', '2018-02-07 11:00:00', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1821', 'CLIENT', 0x7B226964223A2233222C22646E69223A22222C226E616D65223A224C55434153204445204C41204355455641222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22636F6D70616E79223A223233227D, 'GABRIEL SALAZAR', '2018-02-07 11:00:01', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1822', 'CLIENT', 0x7B226964223A2234222C22646E69223A22222C226E616D65223A22414C49434941222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22636F6D70616E79223A22414C494341227D, 'GABRIEL SALAZAR', '2018-02-07 11:00:03', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1823', 'CLIENT', 0x7B226964223A2231222C22646E69223A22222C226E616D65223A22636C69656E74652031222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22636F6D70616E79223A22454D50524553412031227D, 'GABRIEL SALAZAR', '2018-02-07 11:00:16', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1824', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 11:21:00', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1825', 'BRAND', 0x7B226964223A2236222C226E616D65223A224D415243412032227D, 'GABRIEL SALAZAR', '2018-02-07 11:41:59', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1826', 'BRAND', 0x7B226964223A2235222C226E616D65223A224D415243412033227D, 'GABRIEL SALAZAR', '2018-02-07 11:42:08', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1827', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 11:45:51', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1828', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A22576564204A616E20333120323031382031313A34353A353320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A226E7565766F222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-07 11:46:08', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1829', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225765642046656220303720323031382031313A34363A343820474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2273647364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-07 11:46:55', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1830', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 11:55:27', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1831', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 11:55:41', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1832', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 11:59:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1833', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 12:11:06', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1834', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 12:16:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1835', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 12:21:37', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1836', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 12:27:30', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1837', 'PRODUCT', 0x7B226964223A223435222C22666472223A2253444F50373447222C2263736F223A22534441222C22776273223A225344222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A2253444153353131355344222C22636F6465223A2231222C22636F646532223A223231222C226465736372697074696F6E223A2250524F445543544F2031222C2263617465676F7279223A225449504F2031222C226272616E64223A224D415243412031222C2262696C6C223A223139222C22636F6D6D656E74223A225344227D, 'GABRIEL SALAZAR', '2018-02-07 12:28:05', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1838', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 13:50:21', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1839', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 13:50:21', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1840', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A225765642046656220303720323031382031333A35303A353320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2231222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-07 13:51:10', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1841', 'BILL', 0x7B226964223A2231222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A224672692053657020303120323031372030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2231222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-07 13:51:38', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1842', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 15:42:58', '::ffff:172.30.2.40', 'LOGIN');
INSERT INTO `event` VALUES ('1843', 'PRODUCT', 0x7B226964223A223437222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A22303030313036222C22636F6465223A22313331222C22636F646532223A2233484530333339354141222C226465736372697074696F6E223A2250414E454C204531C2B45320434F4158204D58222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2231222C22636F6D6D656E74223A22686F6C61227D, 'GABRIEL SALAZAR', '2018-02-07 16:10:24', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1844', 'PRODUCT', 0x7B226964223A223436222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A22303030313036222C22636F6465223A22313331222C22636F646532223A2233484530333339354141222C226465736372697074696F6E223A2250414E454C204531C2B45320434F4158204D58222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2231222C22636F6D6D656E74223A22686F6C61227D, 'GABRIEL SALAZAR', '2018-02-07 16:10:25', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1845', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 16:13:43', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1846', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-07 16:36:42', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1847', 'PRODUCT', 0x7B226964223A223530222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A22303754343032393033313239222C22636F6465223A22313434222C22636F646532223A22334845303030323841413032222C226465736372697074696F6E223A22534650202D2047494745204C58202D204C4320524F485320362F362044444D202D34302F383543222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2231222C22636F6D6D656E74223A22535853227D, 'GABRIEL SALAZAR', '2018-02-07 16:36:53', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1848', 'PRODUCT', 0x7B226964223A223531222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223130222C226C6F636174696F6E32223A224734222C22626172636F6465223A224E53313335304631313436222C22636F6465223A2231222C22636F646532223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2231222C22636F6D6D656E74223A224445564F4C5543494F4E204341524C4F53204C4F4E444FC3914F202844415257494E2043414E434849474E494129227D, 'GABRIEL SALAZAR', '2018-02-07 16:36:55', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1849', 'PRODUCT', 0x7B226964223A223439222C22666472223A225853222C2263736F223A225853222C22776273223A225853222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A22303754343032393033313239222C22636F6465223A22313434222C22636F646532223A22334845303030323841413032222C226465736372697074696F6E223A22534650202D2047494745204C58202D204C4320524F485320362F362044444D202D34302F383543222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2231222C22636F6D6D656E74223A2244535344227D, 'GABRIEL SALAZAR', '2018-02-07 16:36:57', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1850', 'PRODUCT', 0x7B226964223A223532222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223130222C226C6F636174696F6E32223A224734222C22626172636F6465223A224E53313335304631313436222C22636F6465223A2231222C22636F646532223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2231222C22636F6D6D656E74223A224445564F4C5543494F4E204341524C4F53204C4F4E444FC3914F202844415257494E2043414E434849474E494129227D, 'GABRIEL SALAZAR', '2018-02-07 16:40:31', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1851', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 10:05:43', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1852', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 10:11:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1853', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 10:30:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1854', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 10:31:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1855', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 10:51:17', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1856', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225468752046656220303820323031382031303A35313A323120474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A227364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-08 10:51:30', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1857', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:06:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1858', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:11:48', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1859', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:17:36', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1860', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:21:44', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1861', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:24:29', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1862', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:26:39', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1863', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:29:23', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1864', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:30:53', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1865', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:32:05', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1866', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:42:27', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1867', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:53:13', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1868', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 11:54:25', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1869', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 12:10:44', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1870', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A225468752046656220303820323031382031323A31313A343020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22505255454241222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-08 12:11:52', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1871', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 12:43:02', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1872', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:07:48', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1873', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:17:55', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1874', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:19:18', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1875', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:22:59', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1876', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:26:03', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1877', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:26:55', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1878', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:27:55', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1879', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:28:12', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1880', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:31:08', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1881', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:32:04', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1882', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 14:45:42', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1883', 'PRODUCT', 0x7B226964223A22373639222C22666472223A225745222C2263736F223A225745222C22776273223A225745222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A224557373738222C22636F6465223A2235222C22636F646532223A223348453033363539414141423031222C226465736372697074696F6E223A22373735302053522D4331322044432D50454D33222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2233222C22636F6D6D656E74223A225745227D, 'GABRIEL SALAZAR', '2018-02-08 14:53:54', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1884', 'PRODUCT', 0x7B226964223A22373638222C22666472223A224557222C2263736F223A225745222C22776273223A225745222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A224557222C22636F6465223A2232222C22636F646532223A223348453035393438414141463032222C226465736372697074696F6E223A22373735302053522053464D342D3132222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2233222C22636F6D6D656E74223A225745227D, 'GABRIEL SALAZAR', '2018-02-08 14:53:57', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1885', 'PRODUCT', 0x7B226964223A22373637222C22666472223A223231222C2263736F223A223231222C22776273223A223231222C226C6F636174696F6E223A223131222C226C6F636174696F6E32223A224733222C22626172636F6465223A22555350304A4431222C22636F6465223A22313538222C22636F646532223A223348453030353634434141413031222C226465736372697074696F6E223A225846502D31304745204C522D4C4320524F485320362F3620302F373043222C2263617465676F7279223A2249502052414E222C226272616E64223A22222C2262696C6C223A2233222C22636F6D6D656E74223A223132227D, 'GABRIEL SALAZAR', '2018-02-08 14:53:59', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1886', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 15:44:40', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1887', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 15:56:12', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1888', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 15:56:42', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1889', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 15:58:27', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1890', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 15:59:12', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1891', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:00:35', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1892', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:02:59', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1893', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:13:37', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1894', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:16:36', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1895', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:19:10', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1896', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:22:55', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1897', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:26:24', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1898', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:27:34', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1899', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:35:20', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1900', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:37:17', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1901', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:38:39', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1902', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 16:44:28', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1903', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-08 17:28:53', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1904', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 10:18:56', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1905', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:14:38', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1906', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:15:35', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1907', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:17:04', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1908', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:18:04', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1909', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:18:45', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1910', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:23:14', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1911', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:30:22', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1912', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:35:16', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1913', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:38:37', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1914', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:39:24', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1915', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:41:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1916', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:46:35', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1917', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:47:18', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1918', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:48:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1919', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:51:18', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1920', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 11:51:47', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1921', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:06:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1922', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:21:04', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1923', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:27:12', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1924', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:33:56', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1925', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:36:29', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1926', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:37:29', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1927', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:39:32', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1928', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:40:53', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1929', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:41:34', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1930', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:43:44', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1931', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:45:20', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1932', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:45:56', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1933', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:51:11', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1934', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 12:54:13', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1935', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 13:31:09', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1936', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 13:31:55', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1937', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 13:35:49', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1938', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 15:46:04', '::ffff:172.30.2.47', 'LOGIN');
INSERT INTO `event` VALUES ('1939', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A22547565204A616E20333020323031382031353A35353A323320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22617364222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-09 15:55:25', '::ffff:172.30.2.47', 'INSERT');
INSERT INTO `event` VALUES ('1940', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 16:54:39', '::ffff:172.30.2.47', 'LOGIN');
INSERT INTO `event` VALUES ('1941', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-09 17:41:44', '::ffff:172.30.2.40', 'LOGIN');
INSERT INTO `event` VALUES ('1942', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A225468752046656220303820323031382031373A34333A353520474D542D3035303020284561737465726E205374616E646172642054696D6529222C227265666572656E6365223A2236373637222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-09 17:44:59', '::ffff:172.30.2.40', 'INSERT');
INSERT INTO `event` VALUES ('1943', 'MODEL', 0x7B226964223A22222C22636F6465223A22707275656261312D333031382D313228612927222C226465736372697074696F6E223A22636F6469676F20707275656261222C226272616E64223A2231222C2263617465676F7279223A2237227D, 'GABRIEL SALAZAR', '2018-02-09 17:47:10', '::ffff:172.30.2.40', 'INSERT');
INSERT INTO `event` VALUES ('1944', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303920323031382031373A35343A353720474D542D3035303020284561737465726E205374616E646172642054696D6529222C227265666572656E6365223A223536222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-09 17:55:03', '::ffff:172.30.2.40', 'INSERT');
INSERT INTO `event` VALUES ('1945', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 09:58:59', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1946', 'MODEL', 0x7B2263617465676F7279223A2232222C226272616E64223A2235222C22636F6465223A22313233343536222C226465736372697074696F6E223A2250524F445543544F2031222C2273746F636B6D696E223A2230222C22756E6974223A2230227D, 'GABRIEL SALAZAR', '2018-02-14 10:15:02', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1947', 'MODEL', 0x7B2263617465676F7279223A2232222C226272616E64223A2231222C22636F6465223A22313233222C226465736372697074696F6E223A2250524F445543544F2031222C2273746F636B6D696E223A2230222C22756E6974223A2230227D, 'GABRIEL SALAZAR', '2018-02-14 10:19:06', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1948', 'LOCATION', 0x7B226964223A22222C226E616D65223A22313233227D, 'GABRIEL SALAZAR', '2018-02-14 10:19:46', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1949', 'MODEL', 0x7B2263617465676F7279223A2232222C226272616E64223A2231222C22636F6465223A2231323334222C226465736372697074696F6E223A2250524F445543544F2031222C2273746F636B6D696E223A2230222C22756E6974223A2230227D, 'GABRIEL SALAZAR', '2018-02-14 10:24:52', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1950', 'MODEL', 0x7B2263617465676F7279223A2238222C226272616E64223A2236222C22636F6465223A223132333435363438222C226465736372697074696F6E223A2250524F445543544F2031227D, 'GABRIEL SALAZAR', '2018-02-14 10:35:54', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1951', 'MODEL', 0x7B2263617465676F7279223A2232222C226272616E64223A2231222C22636F6465223A2248344834222C226465736372697074696F6E223A2250524F445543544F2031227D, 'GABRIEL SALAZAR', '2018-02-14 10:43:54', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1952', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:02:24', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1953', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:08:19', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1954', 'MODEL', 0x7B2263617465676F7279223A2232222C226272616E64223A2231222C22636F6465223A223231222C226465736372697074696F6E223A2250524F445543544F2031227D, 'GABRIEL SALAZAR', '2018-02-14 11:09:04', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1955', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:10:22', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1956', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:20:28', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1957', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:21:43', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1958', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:22:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1959', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:23:54', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1960', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:27:33', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1961', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:29:58', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1962', 'MODEL', 0x7B2263617465676F7279223A2232222C226272616E64223A2231222C22636F6465223A223232222C226465736372697074696F6E223A2250524F445543544F2032227D, 'GABRIEL SALAZAR', '2018-02-14 11:34:51', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1963', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 11:35:57', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1964', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 12:06:33', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1965', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225765642046656220313420323031382031323A30363A333520474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-14 12:06:47', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1966', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 12:25:12', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1967', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 12:39:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1968', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 14:05:19', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1969', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 14:09:50', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1970', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 14:13:16', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1971', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 14:32:17', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1972', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 14:34:52', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1973', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 15:00:17', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1974', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 15:33:50', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1975', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2232222C22646F63756D656E74223A2231222C2264617465223A225765642046656220313420323031382031353A33343A303420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A226466222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-14 15:34:22', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1976', 'MODEL', 0x7B2263617465676F7279223A2234222C226272616E64223A2231222C22636F6465223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29227D, 'GABRIEL SALAZAR', '2018-02-14 15:35:26', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1977', 'MODEL', 0x7B2263617465676F7279223A2234222C226272616E64223A2231222C22636F6465223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29227D, 'GABRIEL SALAZAR', '2018-02-14 15:35:28', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1978', 'MODEL', 0x7B2263617465676F7279223A2234222C226272616E64223A2231222C22636F6465223A225445524D494E414C20454C54454B222C226465736372697074696F6E223A225445524D494E414C4553205041524120434F4E4543544F52202846414E20454C54454B29227D, 'GABRIEL SALAZAR', '2018-02-14 15:35:31', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1979', 'LOCATION', 0x7B226964223A22222C226E616D65223A22475945227D, 'GABRIEL SALAZAR', '2018-02-14 15:36:02', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1980', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-14 15:55:10', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1981', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 10:15:51', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1982', 'BILL', 0x7B226964223A2237222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225765642046656220313420323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 10:56:00', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1983', 'BILL', 0x7B226964223A2235222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A225468752046656220303820323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2236373637222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 10:56:01', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1984', 'BILL', 0x7B226964223A2234222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A22547565204A616E20333020323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22415344222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 10:56:03', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1985', 'BILL', 0x7B226964223A2233222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A225468752046656220303820323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22505255454241222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 10:56:05', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1986', 'BILL', 0x7B226964223A2231222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A224672692053657020303120323031372030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2231222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 10:56:07', '::1', 'DELETE');
INSERT INTO `event` VALUES ('1987', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A225468752046656220313520323031382031313A30363A333620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224558495354454E434941222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-15 11:06:55', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1988', 'BILL', 0x7B226964223A2231222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A225468752046656220313520323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224558495354454E4349415320544F54414C4553222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 11:19:48', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1989', 'BILL', 0x7B226964223A2231222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A224D6F6E204F637420303220323031372030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224558495354454E4349415320544F54414C4553222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 11:20:07', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1990', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A225468752046656220313520323031382031313A31393A333720474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F2046414E222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-15 11:20:26', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1991', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A225468752046656220313520323031382031313A32393A333120474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E54524547412046414E222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-15 11:29:46', '::1', 'INSERT');
INSERT INTO `event` VALUES ('1992', 'VOUCHER', 0x7B226964223A2233222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225468752046656220313520323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E54524547412046414E53222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-15 11:34:50', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('1993', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 12:37:48', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1994', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 12:39:00', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('1995', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 14:00:44', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('1996', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 14:03:07', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('1997', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 14:04:51', '::ffff:172.30.2.40', 'LOGIN');
INSERT INTO `event` VALUES ('1998', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 14:38:11', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('1999', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 15:15:10', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2000', 'USER', 0x7B226964223A223431222C226E616D65223A2253414E544941474F222C226C6173746E616D65223A225245594553222C22757365726E616D65223A22737265796573222C22656D61696C223A227372657965734063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2231222C2270617373776F7264223A2224326124303824337354596B7861673074756541384C447166434B4E4F5263564D79744236543738345863376F4C2F6A78664C4F743659516C783465222C2276616C6964223A22227D, 'GABRIEL SALAZAR', '2018-02-15 15:15:32', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2001', 'USER', 0x7B226964223A22222C226E616D65223A2253616E746961676F222C226C6173746E616D65223A225265796573222C22757365726E616D65223A22737265796573222C22656D61696C223A227372657965734063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2231227D, 'GABRIEL SALAZAR', '2018-02-15 15:15:57', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2002', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-15 15:16:11', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2003', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-15 15:17:29', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2004', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 15:19:31', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2005', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-15 15:19:54', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2006', 'PROVIDER', 0x7B226964223A2231222C22646E69223A22222C226E616D65223A22416E67656C612052696F73222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22637265617465644174223A22222C22757064617465644174223A22222C22636F6D70616E79223A2250616E616C70696E61227D, 'SANTIAGO REYES', '2018-02-15 15:31:42', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2007', 'PROVIDER', 0x7B226964223A2232222C22646E69223A22222C226E616D65223A2253616E746961676F20506572657A222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22637265617465644174223A22222C22757064617465644174223A22222C22636F6D70616E79223A2243696E65746F227D, 'SANTIAGO REYES', '2018-02-15 15:31:57', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2008', 'BILL', 0x7B226964223A2231222C2270726F7669646572223A2232222C22646F63756D656E74223A2234222C2264617465223A224D6F6E204F637420303220323031372030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224558495354454E4349415320544F54414C4553222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'SANTIAGO REYES', '2018-02-15 15:32:28', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2009', 'BRAND', 0x7B226964223A2231222C226E616D65223A22414C434154454C204C5543454E54227D, 'SANTIAGO REYES', '2018-02-15 15:35:41', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2010', 'BRAND', 0x7B226964223A2236222C226E616D65223A224E4F4B4941227D, 'SANTIAGO REYES', '2018-02-15 15:35:47', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2011', 'BRAND', 0x7B226964223A2235222C226E616D65223A22454C54454B227D, 'SANTIAGO REYES', '2018-02-15 15:36:00', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2012', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-15 18:02:08', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2013', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-15 18:14:31', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2014', 'LOCATION', 0x7B226964223A223332222C226E616D65223A22464C45584E455420475945227D, 'SANTIAGO REYES', '2018-02-15 18:14:54', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2015', 'LOCATION', 0x7B226964223A22222C226E616D65223A22464C45584E45542055494F227D, 'SANTIAGO REYES', '2018-02-15 18:15:19', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2016', 'LOCATION', 0x7B226964223A223333222C226E616D65223A22475945227D, 'SANTIAGO REYES', '2018-02-15 18:15:53', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2017', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 09:15:11', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2018', 'CATEGORY', 0x7B226964223A2238222C226E616D65223A22454E4552474941227D, 'SANTIAGO REYES', '2018-02-16 09:20:49', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2019', 'CATEGORY', 0x7B226964223A2233222C226E616D65223A224C4954455350414E227D, 'SANTIAGO REYES', '2018-02-16 09:25:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2020', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 09:41:47', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2021', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 09:49:44', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2022', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 09:59:17', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2023', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 10:47:11', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2024', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-16 10:54:35', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2025', 'MODEL', 0x7B226964223A2231222C22636F6465223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'GABRIEL SALAZAR', '2018-02-16 10:54:47', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2026', 'MODEL', 0x7B226964223A2231222C22636F6465223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2231227D, 'GABRIEL SALAZAR', '2018-02-16 10:54:55', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2027', 'MODEL', 0x7B226964223A2231222C22636F6465223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:56:51', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2028', 'MODEL', 0x7B226964223A2232222C22636F6465223A223348453035393438414141463032222C226465736372697074696F6E223A22373735302053522053464D342D3132222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:56:58', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2029', 'MODEL', 0x7B226964223A2233222C22636F6465223A223348453033363633414141433034222C226465736372697074696F6E223A22373735302053522D313220313735412050454D33222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:05', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2030', 'MODEL', 0x7B226964223A2234222C22636F6465223A223348453035313036414152423032222C226465736372697074696F6E223A22373735302053522D313220454E48414E4345442046414E2054524159222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:11', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2031', 'MODEL', 0x7B226964223A2235222C22636F6465223A223348453033363539414141423031222C226465736372697074696F6E223A22373735302053522D4331322044432D50454D33222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:16', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2032', 'MODEL', 0x7B226964223A2236222C22636F6465223A223348453034353830414141413031222C226465736372697074696F6E223A22373735302053522D433132205345525649434520524F55544552222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:22', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2033', 'MODEL', 0x7B226964223A2237222C22636F6465223A223348453031313731414141463032222C226465736372697074696F6E223A22373735302053522D53464D322D32303047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:30', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2034', 'MODEL', 0x7B226964223A2238222C22636F6465223A223348453031313731414141453032222C226465736372697074696F6E223A22373735302053522D53464D322D32303047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:36', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2035', 'MODEL', 0x7B226964223A223131222C22636F6465223A223348453031313730414141453032222C226465736372697074696F6E223A22373735302053522D53464D322D34303047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:42', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2036', 'MODEL', 0x7B226964223A223130222C22636F6465223A223348453031313730414141463032222C226465736372697074696F6E223A22373735302053522D53464D322D34303047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:57:51', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2037', 'MODEL', 0x7B226964223A22313030222C22636F6465223A223346453631323333424141453032222C226465736372697074696F6E223A224E414C532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:58:07', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2038', 'MODEL', 0x7B226964223A223939222C22636F6465223A2233464536313233334243434B3031222C226465736372697074696F6E223A224E414C532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:58:15', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2039', 'MODEL', 0x7B226964223A223938222C22636F6465223A223346453631323333424142463031222C226465736372697074696F6E223A224E414C532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:58:33', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2040', 'MODEL', 0x7B226964223A223937222C22636F6465223A223346453631323333424141433032222C226465736372697074696F6E223A224E414C532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:58:38', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2041', 'MODEL', 0x7B226964223A223936222C22636F6465223A223346453631323333424142463032222C226465736372697074696F6E223A224E414C532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:58:44', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2042', 'MODEL', 0x7B226964223A223935222C22636F6465223A2233464536313233334143434B3031222C226465736372697074696F6E223A224E414C532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:58:53', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2043', 'MODEL', 0x7B226964223A22313039222C22636F6465223A223346453236363938444242413031222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:58:58', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2044', 'MODEL', 0x7B226964223A223836222C22636F6465223A223348453031333634414141433031222C226465736372697074696F6E223A224D342D43483043332D41532D534650222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:59:13', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2045', 'MODEL', 0x7B226964223A223331222C22636F6465223A223348453033363038414141413031222C226465736372697074696F6E223A224D434D2D5850222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:59:17', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2046', 'MODEL', 0x7B226964223A223837222C22636F6465223A223348453035393436414152413031222C226465736372697074696F6E223A224D44412D3737353020342D5054204F4334382F53544D313620504F53222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:59:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2047', 'MODEL', 0x7B226964223A223838222C22636F6465223A2233414D3230323434414241413031222C226465736372697074696F6E223A224D4450532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 10:59:51', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2048', 'MODEL', 0x7B226964223A223839222C22636F6465223A224E5333222C226465736372697074696F6E223A224D4943524F20535749434854202853454E534F5245532044452050554552544129222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 10:59:58', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2049', 'MODEL', 0x7B226964223A223930222C22636F6465223A2234302E353253222C226465736372697074696F6E223A224D494E492052454C452034385643432046494E444552222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:00:10', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2050', 'MODEL', 0x7B226964223A223931222C22636F6465223A22334A523038303231414341413031222C226465736372697074696F6E223A224D4F44554C452046414E535241434B2032202D34385620444E4F444542203255222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:00:24', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2051', 'MODEL', 0x7B226964223A223833222C22636F6465223A223348453033303738414141423031222C226465736372697074696F6E223A224D312D43484F43332D4345532D534650222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:00:36', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2052', 'MODEL', 0x7B226964223A223832222C22636F6465223A223348453034323734414152413031222C226465736372697074696F6E223A224D312D313047422D58502D584650222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:00:42', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2053', 'MODEL', 0x7B226964223A223830222C22636F6465223A2233414D3139393637414141413034222C226465736372697074696F6E223A224C494F43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:00:48', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2054', 'MODEL', 0x7B226964223A223737222C22636F6465223A223348453033363139414141503031222C226465736372697074696F6E223A22494F4D332D5850222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:00:54', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2055', 'MODEL', 0x7B226964223A223739222C22636F6465223A223348453031343733414141433031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:00:59', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2056', 'MODEL', 0x7B226964223A223738222C22636F6465223A223348453031343733414141443031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:01:04', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2057', 'MODEL', 0x7B226964223A223736222C22636F6465223A223348453037333035424152423031222C226465736372697074696F6E223A22494D4D2D375835302032302D5054203130474520534650202B202D204C334251222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:01:09', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2058', 'MODEL', 0x7B226964223A223735222C22636F6465223A223348453033363630414141413031222C226465736372697074696F6E223A224849474820464C4F572046414E20554E4954222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:01:17', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2059', 'MODEL', 0x7B226964223A223732222C22636F6465223A2233414D3230343230414141413031222C226465736372697074696F6E223A2247494F3342222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:01:23', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2060', 'MODEL', 0x7B226964223A223733222C22636F6465223A2233414D3230343230414141413032222C226465736372697074696F6E223A2247494F3342222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:01:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2061', 'MODEL', 0x7B226964223A223633222C22636F6465223A22314146313635303041414141222C226465736372697074696F6E223A22464C41545041434B20322034382F32303030204845222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:01:40', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2062', 'MODEL', 0x7B226964223A223634222C22636F6465223A223234313131392E313030222C226465736372697074696F6E223A22464C41545041434B322034382F33303030222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:01:46', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2063', 'MODEL', 0x7B226964223A223635222C22636F6465223A2233414D3230313031414141423032222C226465736372697074696F6E223A22474542332D42222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:01:53', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2064', 'MODEL', 0x7B226964223A223636222C22636F6465223A2233414D3230313031414141413032222C226465736372697074696F6E223A22474542332D42222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:02:02', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2065', 'MODEL', 0x7B226964223A223637222C22636F6465223A2233414D3230313031414141443032222C226465736372697074696F6E223A22474542332D42222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:02:08', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2066', 'MODEL', 0x7B226964223A223638222C22636F6465223A22334845303038363741413033222C226465736372697074696F6E223A224749474520455820534650204F5054494353204D4F44554C45202D204C43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:02:13', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2067', 'MODEL', 0x7B226964223A223639222C22636F6465223A22334845303030323741413032222C226465736372697074696F6E223A2247494745205358205346502044444D2D4C43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:02:17', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2068', 'MODEL', 0x7B226964223A223730222C22636F6465223A2233414D3139393637434141413031222C226465736372697074696F6E223A2247494F3341222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:02:26', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2069', 'MODEL', 0x7B226964223A223731222C22636F6465223A2233414D3139393637424141413033222C226465736372697074696F6E223A2247494F3341222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:02:30', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2070', 'MODEL', 0x7B226964223A223734222C22636F6465223A2233414D3230343230414141413033222C226465736372697074696F6E223A2247494F3342222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:02:36', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2071', 'MODEL', 0x7B226964223A223632222C22636F6465223A223234313131352E3130355344222C226465736372697074696F6E223A22464C41545041434B20322034382F32303030204845222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:02:51', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2072', 'MODEL', 0x7B226964223A223631222C22636F6465223A223234313131352E313035222C226465736372697074696F6E223A22464C41545041434B20322034382F32303030204845222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:02:57', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2073', 'MODEL', 0x7B226964223A223630222C22636F6465223A224346443030303920442D31383738222C226465736372697074696F6E223A2246494C54524F2053454341444F5220554B53433232222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:03:07', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2074', 'MODEL', 0x7B226964223A223539222C22636F6465223A2233464532363638354141434C3036222C226465736372697074696F6E223A2246442D37333032204953414D222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:03:15', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2075', 'MODEL', 0x7B226964223A223538222C22636F6465223A22334A523337353137414541413031222C226465736372697074696F6E223A2246414E545259222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2235222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:03:21', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2076', 'MODEL', 0x7B226964223A223537222C22636F6465223A22334A523337353137414541423032222C226465736372697074696F6E223A2246414E545259222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2235222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:03:28', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2077', 'MODEL', 0x7B226964223A223536222C22636F6465223A223346453533373031414341413034222C226465736372697074696F6E223A2246414E542D46222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:03:35', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2078', 'MODEL', 0x7B226964223A223533222C22636F6465223A223348453032373738414241423031222C226465736372697074696F6E223A2246414E204D4F44554C4520464F52205341522D38222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:03:42', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2079', 'MODEL', 0x7B226964223A223534222C22636F6465223A223348453032373738414241433031222C226465736372697074696F6E223A2246414E204D4F44554C45285341522D3820563129222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:03:47', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2080', 'MODEL', 0x7B226964223A223535222C22636F6465223A2233414D323030373142474141203031222C226465736372697074696F6E223A2246414E205356454E5441222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:03:54', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2081', 'MODEL', 0x7B226964223A223432222C22636F6465223A22334A523230303539424141473032222C226465736372697074696F6E223A224543454D2D55222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:03', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2082', 'MODEL', 0x7B226964223A223431222C22636F6465223A22334A523230303539444141423031222C226465736372697074696F6E223A224543454D2D55222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:07', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2083', 'MODEL', 0x7B226964223A223430222C22636F6465223A22334A523230303539444141433031222C226465736372697074696F6E223A224543454D2D55222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:12', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2084', 'MODEL', 0x7B226964223A223434222C22636F6465223A2233454333373533334E4241433031222C226465736372697074696F6E223A22454D412D4146414E2D4820572E52222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:17', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2085', 'MODEL', 0x7B226964223A223435222C22636F6465223A223346453239313932414141413036222C226465736372697074696F6E223A22454D412D46414E5F4E554954222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:22', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2086', 'MODEL', 0x7B226964223A223436222C22636F6465223A2235313333303733373339395143222C226465736372697074696F6E223A22454D425241434F20504F57455220494E2E204348414E4745204F4E2E2028434F4D50524553534F5229222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:29', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2087', 'MODEL', 0x7B226964223A223530222C22636F6465223A22523245313930222C226465736372697074696F6E223A2246414E2028454C54454B202D2056454E54494C41444F5245532044454C20434F4E44454E5341444F5229222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2234222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:36', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2088', 'MODEL', 0x7B226964223A22313637222C22636F6465223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2234222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:41', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2089', 'MODEL', 0x7B226964223A223531222C22636F6465223A223348453036373932414141433033222C226465736372697074696F6E223A2246414E2037373035205341522D38205632222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:45', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2090', 'MODEL', 0x7B226964223A223532222C22636F6465223A223348453030303136414141433031222C226465736372697074696F6E223A2246414E20373735302053522D31322046414E2054524159222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:04:50', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2091', 'MODEL', 0x7B226964223A223334222C22636F6465223A223344423138333236414341443034222C226465736372697074696F6E223A2243534D2039353030204D5052222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:12', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2092', 'MODEL', 0x7B226964223A223335222C22636F6465223A22334A523337353236414141433032222C226465736372697074696F6E223A2244325520563520434841534953222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2235222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:16', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2093', 'MODEL', 0x7B226964223A223336222C22636F6465223A22313039373335323636222C226465736372697074696F6E223A2245414D4F20313A32222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2236222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:21', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2094', 'MODEL', 0x7B226964223A223337222C22636F6465223A22334A523230303733424242433031222C226465736372697074696F6E223A224543434D2D55222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:25', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2095', 'MODEL', 0x7B226964223A223338222C22636F6465223A22334A523230303733414241433031222C226465736372697074696F6E223A224543434D2D55222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:29', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2096', 'MODEL', 0x7B226964223A223339222C22636F6465223A22334A523230303733424241433031222C226465736372697074696F6E223A224543434D2D55222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:33', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2097', 'MODEL', 0x7B226964223A223433222C22636F6465223A22334A5232303035394241414C3032222C226465736372697074696F6E223A224543454D2D55222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:40', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2098', 'MODEL', 0x7B226964223A223332222C22636F6465223A223348453030313034414141433032222C226465736372697074696F6E223A22434841532D373735302D31322043484153534953205350415245222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:47', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2099', 'MODEL', 0x7B226964223A223239222C22636F6465223A223348453033363037414141423031222C226465736372697074696F6E223A2243464D2D5850222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:52', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2100', 'MODEL', 0x7B226964223A223238222C22636F6465223A223348453033363037414141433031222C226465736372697074696F6E223A2243464D2D5850222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:05:58', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2101', 'MODEL', 0x7B226964223A223330222C22636F6465223A223348453033363037414141413031222C226465736372697074696F6E223A2243464D2D5850222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:06:03', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2102', 'MODEL', 0x7B226964223A223237222C22636F6465223A22434150414349544F5220454C54454B222C226465736372697074696F6E223A22434150414349544F522043494C494E445249434F20554B53203255462033383056222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:06:11', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2103', 'MODEL', 0x7B226964223A223236222C22636F6465223A2233414D32303031354141222C226465736372697074696F6E223A224341424C45204B495420464F52204D4C532D3346222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:06:19', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2104', 'MODEL', 0x7B226964223A223231222C22636F6465223A2233414D3230323437414141423033222C226465736372697074696F6E223A2241544C3348222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:06:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2105', 'MODEL', 0x7B226964223A223233222C22636F6465223A2233414D323030323541434141222C226465736372697074696F6E223A224341424C4520444520454E455247494120444520545255222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:06:32', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2106', 'MODEL', 0x7B226964223A223234222C22636F6465223A2233414D323030323541424141222C226465736372697074696F6E223A224341424C4520444520454E455247494120444520545255222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:06:36', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2107', 'MODEL', 0x7B226964223A223235222C22636F6465223A2233414D323030323641414141222C226465736372697074696F6E223A224341424C4520444520455854454E43494F4E20425553204E4C43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:06:41', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2108', 'MODEL', 0x7B226964223A223136222C22636F6465223A223348453032373735414141443031222C226465736372697074696F6E223A224131362D4348445331222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:07:22', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2109', 'MODEL', 0x7B226964223A223138222C22636F6465223A223348453037393433414141433031222C226465736372697074696F6E223A2241362D4554482D313047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:07:28', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2110', 'MODEL', 0x7B226964223A223139222C22636F6465223A223348453036313531414141443031222C226465736372697074696F6E223A2241382D3147422D534650222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:07:34', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2111', 'MODEL', 0x7B226964223A223230222C22636F6465223A223348453032373736414241423031222C226465736372697074696F6E223A2241382D455448205632222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:07:39', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2112', 'MODEL', 0x7B226964223A223232222C22636F6465223A2233414D3230323437414141423032222C226465736372697074696F6E223A2241544C3348222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:07:43', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2113', 'MODEL', 0x7B226964223A2239222C22636F6465223A223348453031313730414141413032222C226465736372697074696F6E223A22373735302053522D53464D322D34303047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:13', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2114', 'MODEL', 0x7B226964223A223132222C22636F6465223A223348453037353535414141413031222C226465736372697074696F6E223A22375835302044494D4D2055504752414445204B4954222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:20', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2115', 'MODEL', 0x7B226964223A223133222C22636F6465223A22333031303030373137222C226465736372697074696F6E223A2239333431205252482036305720313930304D485A222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2116', 'MODEL', 0x7B226964223A223134222C22636F6465223A22334A52333735323641413032222C226465736372697074696F6E223A223939323620424255205632222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:32', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2117', 'MODEL', 0x7B226964223A223137222C22636F6465223A223348453032373735414141453031222C226465736372697074696F6E223A224131362D4348445331222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:37', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2118', 'MODEL', 0x7B226964223A22313638222C22636F6465223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2234222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:42', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2119', 'MODEL', 0x7B226964223A223333222C22636F6465223A2243574341302D32322D3030443233222C226465736372697074696F6E223A22434F4E544143544F52204D435241303232415435222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2234222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:48', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2120', 'MODEL', 0x7B226964223A223135222C22636F6465223A223348453032373734414141433031222C226465736372697074696F6E223A22434F4E54524F4C20535749544348204D4F44554C45222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:08:54', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2121', 'MODEL', 0x7B226964223A223831222C22636F6465223A223348453033363131414141433031222C226465736372697074696F6E223A224D31302D3147422D58502D534650222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:00', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2122', 'MODEL', 0x7B226964223A223834222C22636F6465223A223348453033363835414141413031222C226465736372697074696F6E223A224D322D313047422D58502D584650222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:05', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2123', 'MODEL', 0x7B226964223A223835222C22636F6465223A223348453033363835414152413031222C226465736372697074696F6E223A224D322D313047422D58502D584650222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:09', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2124', 'MODEL', 0x7B226964223A223932222C22636F6465223A223344423230383232414141423033222C226465736372697074696F6E223A224D50542D4D4320313547485A204F4455222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:16', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2125', 'MODEL', 0x7B226964223A223933222C22636F6465223A223344423230383538414341413130222C226465736372697074696F6E223A224D50542D4D432D4F4455222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:23', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2126', 'MODEL', 0x7B226964223A223934222C22636F6465223A223344423230383539414141413035222C226465736372697074696F6E223A224D50542D4D432D4F4455222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2127', 'MODEL', 0x7B226964223A22313038222C22636F6465223A223346453236363938444142413032222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:32', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2128', 'MODEL', 0x7B226964223A22313037222C22636F6465223A223346453236363938444241413031222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:37', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2129', 'MODEL', 0x7B226964223A22313036222C22636F6465223A223346453236363938414141413036222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:42', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2130', 'MODEL', 0x7B226964223A22313035222C22636F6465223A223346453236363938444141413032222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:47', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2131', 'MODEL', 0x7B226964223A22313034222C22636F6465223A223346453236363938414141423034222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:51', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2132', 'MODEL', 0x7B226964223A22313033222C22636F6465223A223346453236363938414142433036222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:09:57', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2133', 'MODEL', 0x7B226964223A22313137222C22636F6465223A223346453237373830414441423033222C226465736372697074696F6E223A224E4746432D43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:05', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2134', 'MODEL', 0x7B226964223A22313138222C22636F6465223A223346453237343230414241413031222C226465736372697074696F6E223A224E504F542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:10', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2135', 'MODEL', 0x7B226964223A22313139222C22636F6465223A223346453630383538414244413032222C226465736372697074696F6E223A224E504F542D42222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:14', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2136', 'MODEL', 0x7B226964223A22313230222C22636F6465223A223346453237373235414141443031222C226465736372697074696F6E223A224E5053502D42222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:19', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2137', 'MODEL', 0x7B226964223A22313231222C22636F6465223A223346453634333938414141413032222C226465736372697074696F6E223A224E524E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:28', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2138', 'MODEL', 0x7B226964223A22313232222C22636F6465223A2233414D3139393633414141413031222C226465736372697074696F6E223A224E5345432D43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:33', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2139', 'MODEL', 0x7B226964223A22313136222C22636F6465223A2233414D31393730394E4350413031222C226465736372697074696F6E223A224E4548432D43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:39', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2140', 'MODEL', 0x7B226964223A22313134222C22636F6465223A223346453239353334414141433033222C226465736372697074696F6E223A224E434E432D44222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:44', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2141', 'MODEL', 0x7B226964223A22313133222C22636F6465223A223346453239353334414141433032222C226465736372697074696F6E223A224E434E432D44222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:49', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2142', 'MODEL', 0x7B226964223A22313234222C22636F6465223A2233414D3230313834414141413033222C226465736372697074696F6E223A224E54494F2D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:10:54', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2143', 'MODEL', 0x7B226964223A22313132222C22636F6465223A223346453238323132414141413033222C226465736372697074696F6E223A224E434E432D43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:11:00', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2144', 'MODEL', 0x7B226964223A22313538222C22636F6465223A223348453030353634434141413031222C226465736372697074696F6E223A225846502D31304745204C522D4C4320524F485320362F3620302F373043222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:11:11', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2145', 'MODEL', 0x7B226964223A22313534222C22636F6465223A2250534C502030332D3135222C226465736372697074696F6E223A2253574954434820454C47494E20285052454F535441544F29222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:11:22', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2146', 'MODEL', 0x7B226964223A22313639222C22636F6465223A225445524D494E414C20454C54454B222C226465736372697074696F6E223A225445524D494E414C4553205041524120434F4E4543544F52202846414E20454C54454B29222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:11:31', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2147', 'MODEL', 0x7B226964223A22313533222C22636F6465223A2239352E30352E535041222C226465736372697074696F6E223A22534F5155455445204D494E492052454C452046494E444552203130412D32353056222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:11:40', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2148', 'MODEL', 0x7B226964223A22313532222C22636F6465223A223234323130302E313138222C226465736372697074696F6E223A22534D4152545041434B205745422F534E4D50222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:11:49', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2149', 'MODEL', 0x7B226964223A22313537222C22636F6465223A22334845303135343543413031222C226465736372697074696F6E223A22584650202D2031304745205A52202D204C4320524F485320362F3620302F373043222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:11:57', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2150', 'MODEL', 0x7B226964223A22313536222C22636F6465223A2233414D3230303537414241413032222C226465736372697074696F6E223A225649533342222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:03', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2151', 'MODEL', 0x7B226964223A22313535222C22636F6465223A2233414D3230303537414141413032222C226465736372697074696F6E223A225649533342222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:08', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2152', 'MODEL', 0x7B226964223A22313531222C22636F6465223A223348453030303436434141413031222C226465736372697074696F6E223A225346502D4F432D34382F53544D2D31362049522D312052362F362044444D202D34302F383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:13', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2153', 'MODEL', 0x7B226964223A22313530222C22636F6465223A223348453030303238434141413031222C226465736372697074696F6E223A225346502D47494745204C582D4C4320524F485320362F362044444D2D34302D383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:17', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2154', 'MODEL', 0x7B226964223A22313439222C22636F6465223A22334845303038373641413031222C226465736372697074696F6E223A225346502D474947452045582D4C4320524F485320362F36202044444D2D34382F383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:23', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2155', 'MODEL', 0x7B226964223A22313434222C22636F6465223A22334845303030323841413032222C226465736372697074696F6E223A22534650202D2047494745204C58202D204C4320524F485320362F362044444D202D34302F383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:31', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2156', 'MODEL', 0x7B226964223A22313432222C22636F6465223A22334845303030323843413031222C226465736372697074696F6E223A22534650202D2047494745204C58202D204C4320524F485320362F362044444D202D34302F383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:37', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2157', 'MODEL', 0x7B226964223A22313431222C22636F6465223A2246434C462D383532312D33222C226465736372697074696F6E223A22534650202D204749474520424153452D5420524A34352052362F362044444D202D34302F383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:45', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2158', 'MODEL', 0x7B226964223A22313430222C22636F6465223A2233414D3139393534414241413032222C226465736372697074696F6E223A225253412D4D4C532D3346222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:49', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2159', 'MODEL', 0x7B226964223A22313433222C22636F6465223A22334845303038363743413031222C226465736372697074696F6E223A22534650202D2047494745204558202D204C4320524F485320362F362044444D202D34302F383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:53', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2160', 'MODEL', 0x7B226964223A22313435222C22636F6465223A22334845303030363241413031222C226465736372697074696F6E223A22534650202D20474947452054582053465020434F50504552204D4F44202D20524A3435222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:12:57', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2161', 'MODEL', 0x7B226964223A22313436222C22636F6465223A22334845303030333443413031222C226465736372697074696F6E223A22534650202D204F432D332F53544D2D31204D4D2D4C432052362F362044444D202D34302F383543222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:02', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2162', 'MODEL', 0x7B226964223A22313339222C22636F6465223A22334A523130383031414141463031222C226465736372697074696F6E223A2252524820325836302D31393030222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:06', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2163', 'MODEL', 0x7B226964223A22313437222C22636F6465223A22334845303030333541413032222C226465736372697074696F6E223A22534650202D204F432D332F53544D2D3120534650204F50544943204D4F442049522D31222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:09', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2164', 'MODEL', 0x7B226964223A22313438222C22636F6465223A223348453034383233414141413031222C226465736372697074696F6E223A225346502B2031304745204C522D4C4320524F4853362F3620302F373043222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:14', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2165', 'MODEL', 0x7B226964223A22313335222C22636F6465223A22313039373737323530222C226465736372697074696F6E223A225252482032583430222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2235222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:21', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2166', 'MODEL', 0x7B226964223A22313336222C22636F6465223A22313039373939333631222C226465736372697074696F6E223A225252482032583430222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2235222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:25', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2167', 'MODEL', 0x7B226964223A22313334222C22636F6465223A2233414D3139393538434141413031222C226465736372697074696F6E223A22504F573342222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:29', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2168', 'MODEL', 0x7B226964223A22313331222C22636F6465223A2233484530333339354141222C226465736372697074696F6E223A2250414E454C204531C2B45320434F4158204D58222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:37', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2169', 'MODEL', 0x7B226964223A22313332222C22636F6465223A22334845303030333441413032222C226465736372697074696F6E223A22504241204F432D332F53544D2D3120534650204D4D204F5054494353204D4F44554C452D4C43222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2231222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:40', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2170', 'MODEL', 0x7B226964223A22313330222C22636F6465223A2233414D323030363941414141222C226465736372697074696F6E223A224F454D2D5452552034204D4C53222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:44', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2171', 'MODEL', 0x7B226964223A22313333222C22636F6465223A224E544858333041413035222C226465736372697074696F6E223A22504B5453455256535033222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:49', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2172', 'MODEL', 0x7B226964223A22313337222C22636F6465223A22334A523130383031414141423133222C226465736372697074696F6E223A2252524820325836302D31393030222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:55', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2173', 'MODEL', 0x7B226964223A22313239222C22636F6465223A2233414D323030363941434141222C226465736372697074696F6E223A224F454D2D5452552032204D4C53222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:13:59', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2174', 'MODEL', 0x7B226964223A22313338222C22636F6465223A22334A523130383031414141443031222C226465736372697074696F6E223A2252524820325836302D31393030222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:04', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2175', 'MODEL', 0x7B226964223A22313235222C22636F6465223A223346453237353632414341413032222C226465736372697074696F6E223A224E5650532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:11', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2176', 'MODEL', 0x7B226964223A22313130222C22636F6465223A223346453238323039414141423034222C226465736372697074696F6E223A224E434E432D42222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:17', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2177', 'MODEL', 0x7B226964223A22313032222C22636F6465223A223346453236363938414242433036222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:22', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2178', 'MODEL', 0x7B226964223A22313131222C22636F6465223A223346453238323039414141413033222C226465736372697074696F6E223A224E434E432D42222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2179', 'MODEL', 0x7B226964223A22313135222C22636F6465223A223346453239353334414141413032222C226465736372697074696F6E223A224E434E432D44222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:32', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2180', 'MODEL', 0x7B226964223A22313233222C22636F6465223A2233414D3230313834414141413032222C226465736372697074696F6E223A224E54494F2D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:37', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2181', 'MODEL', 0x7B226964223A22313236222C22636F6465223A223346453237353632414342413032222C226465736372697074696F6E223A224E5650532D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:41', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2182', 'MODEL', 0x7B226964223A22313237222C22636F6465223A223344423230383538414141413133222C226465736372697074696F6E223A224F4455204D50542D4D4320372F382047485A20494E46222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:45', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2183', 'MODEL', 0x7B226964223A22313238222C22636F6465223A22334543343333353641414142203031222C226465736372697074696F6E223A224F454D2D545255222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2233222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:50', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2184', 'MODEL', 0x7B226964223A22313031222C22636F6465223A223346453236363938414142433037222C226465736372697074696F6E223A224E414E542D41222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2237222C226272616E64223A2232227D, 'SANTIAGO REYES', '2018-02-16 11:14:53', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2185', 'CATEGORY', 0x7B226964223A2239222C226E616D65223A22495052414E227D, 'SANTIAGO REYES', '2018-02-16 11:16:22', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2186', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-16 11:17:30', '::ffff:172.30.2.40', 'LOGIN');
INSERT INTO `event` VALUES ('2187', 'MODEL', 0x7B226964223A22313638222C22636F6465223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:26:03', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2188', 'MODEL', 0x7B226964223A223333222C22636F6465223A2243574341302D32322D3030443233222C226465736372697074696F6E223A22434F4E544143544F52204D435241303232415435222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:26:11', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2189', 'MODEL', 0x7B226964223A223530222C22636F6465223A22523245313930222C226465736372697074696F6E223A2246414E2028454C54454B202D2056454E54494C41444F5245532044454C20434F4E44454E5341444F5229222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:26:17', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2190', 'MODEL', 0x7B226964223A22313637222C22636F6465223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2238222C226272616E64223A2235227D, 'SANTIAGO REYES', '2018-02-16 11:26:26', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2191', 'CATEGORY', 0x7B226964223A2234222C226E616D65223A22454C54454B227D, 'SANTIAGO REYES', '2018-02-16 11:27:19', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2192', 'CLIENT', 0x7B226964223A2231222C22646E69223A22222C226E616D65223A22435249535449414E204D4F4E54454E4547524F222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22636F6D70616E79223A22434E54204550227D, 'SANTIAGO REYES', '2018-02-16 11:34:18', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2193', 'CLIENT', 0x7B226964223A22222C226E616D65223A224741425249454C20524F444153222C22636F6D70616E79223A22464C45584E45542055494F227D, 'SANTIAGO REYES', '2018-02-16 11:36:37', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2194', 'PROVIDER', 0x7B226964223A22222C226E616D65223A22504544524F20415041524943494F222C22636F6D70616E79223A2244494E414C494E4B227D, 'SANTIAGO REYES', '2018-02-16 11:49:13', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2195', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2237222C2264617465223A225765642046656220303720323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303437222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-16 11:51:58', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2196', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 11:56:39', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2197', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 12:01:47', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2198', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-16 12:08:35', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2199', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 12:16:37', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2200', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-16 12:43:25', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2201', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 12:45:02', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2202', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-16 14:02:55', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2203', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-16 14:10:32', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2204', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 16:16:27', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2205', 'VOUCHER', 0x7B226964223A2233222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225468752046656220313520323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303032222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'SANTIAGO REYES', '2018-02-16 16:18:48', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2206', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220313620323031382031363A34343A353320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303032222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-16 16:24:59', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2207', 'VOUCHER', 0x7B226964223A2235222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303033222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'SANTIAGO REYES', '2018-02-16 16:25:21', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2208', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-16 17:51:30', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2209', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303034222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-16 17:52:42', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2210', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303035222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-16 17:58:16', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2211', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303036222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-16 18:02:11', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2212', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-19 10:06:29', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2213', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-19 15:16:06', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2214', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303037222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 15:17:17', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2215', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303038222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 15:24:04', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2216', 'VOUCHER', 0x7B226964223A223130222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353530345F4D414E54415F554E495645525349444144222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'SANTIAGO REYES', '2018-02-19 15:28:55', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2217', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353435305F504F52544F5649454A4F5F43454E54524F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 15:30:29', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2218', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353035335F4C415F4D4552434544222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 15:34:19', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2219', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353031315F475541594143414E4553222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 15:37:12', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2220', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353335365F4441554C45222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 15:40:49', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2221', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353830325F50415452494349415F50494C4152222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 15:47:26', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2222', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-19 16:01:39', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2223', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-19 16:02:06', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2224', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303038222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 16:03:39', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2225', 'VOUCHER', 0x7B226964223A223136222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353030375F43454E5452414C5F4349534E45202F20555F475945353030375F47554159415155494C5F4349534E45222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'SANTIAGO REYES', '2018-02-19 16:04:38', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2226', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-19 16:05:37', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2227', 'PRODUCT', 0x7B226964223A2238353139222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224543552D31383035303139222C22636F6465223A22313637222C22636F646532223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223136222C22636F6D6D656E74223A22227D, 'SANTIAGO REYES', '2018-02-19 16:07:10', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2228', 'PRODUCT', 0x7B226964223A2238353138222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224543552D31383035303139222C22636F6465223A22313637222C22636F646532223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223136222C22636F6D6D656E74223A22227D, 'SANTIAGO REYES', '2018-02-19 16:07:28', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2229', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-19 17:08:06', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2230', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A224D6F6E2046656220313920323031382031373A32383A343020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22707275656261222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-19 17:08:31', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2231', 'PRODUCT', 0x7B226964223A2238353236222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A224E53313335304631313436222C22636F6465223A2231222C22636F646532223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A223137222C22636F6D6D656E74223A22227D, 'GABRIEL SALAZAR', '2018-02-19 17:09:13', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2232', 'PRODUCT', 0x7B226964223A2238353238222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A22532F4E222C22636F6465223A2232222C22636F646532223A223348453035393438414141463032222C226465736372697074696F6E223A22373735302053522053464D342D3132222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A223137222C22636F6D6D656E74223A22227D, 'GABRIEL SALAZAR', '2018-02-19 17:09:15', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2233', 'PRODUCT', 0x7B226964223A2238353237222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A22532F4E222C22636F6465223A2232222C22636F646532223A223348453035393438414141463032222C226465736372697074696F6E223A22373735302053522053464D342D3132222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A223137222C22636F6D6D656E74223A22227D, 'GABRIEL SALAZAR', '2018-02-19 17:09:17', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2234', 'BILL', 0x7B226964223A223137222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A224D6F6E2046656220313920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22505255454241222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-19 17:09:25', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2235', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224D6F6E2046656220313920323031382031373A32393A353120474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22505255454241222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-19 17:09:49', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2236', 'PRODUCT', 0x7B226964223A2238353239222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224E53313335304631313436222C22636F6465223A2231222C22636F646532223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A223138222C22636F6D6D656E74223A22227D, 'GABRIEL SALAZAR', '2018-02-19 17:10:14', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2237', 'PRODUCT', 0x7B226964223A2238353331222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A22532F4E222C22636F6465223A2232222C22636F646532223A223348453035393438414141463032222C226465736372697074696F6E223A22373735302053522053464D342D3132222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A223138222C22636F6D6D656E74223A22227D, 'GABRIEL SALAZAR', '2018-02-19 17:10:16', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2238', 'PRODUCT', 0x7B226964223A2238353330222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A22532F4E222C22636F6465223A2232222C22636F646532223A223348453035393438414141463032222C226465736372697074696F6E223A22373735302053522053464D342D3132222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A223138222C22636F6D6D656E74223A22227D, 'GABRIEL SALAZAR', '2018-02-19 17:10:18', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2239', 'VOUCHER', 0x7B226964223A223138222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224D6F6E2046656220313920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22505255454241222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'GABRIEL SALAZAR', '2018-02-19 17:10:26', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2240', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-19 17:46:50', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2241', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353034335F50554552544F5F4D41524954494D4F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 17:50:19', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2242', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353532325F42414849415F4E4F525445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 17:54:19', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2243', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-19 17:55:33', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2244', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353035305F53414D414E4553222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 17:57:01', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2245', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224D6F6E2046656220313920323031382031383A31363A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D303231222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-19 17:57:14', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2246', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353031375F43454E54454E4152494F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 17:59:55', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2247', 'VOUCHER', 0x7B226964223A223230222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224D6F6E2046656220313920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323120555F475945353531375F4D414E54415F544152515549222C2275736572223A223433222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'ALEX CATUCUAMBA', '2018-02-19 17:59:56', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2248', 'PRODUCT', 0x7B226964223A2238353530222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224543552D31383035303233222C22636F6465223A22313637222C22636F646532223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223231222C22636F6D6D656E74223A2233472031202854542D30303030303039313437323429227D, 'ALEX CATUCUAMBA', '2018-02-19 18:02:32', '::ffff:172.30.2.5', 'DELETE');
INSERT INTO `event` VALUES ('2249', 'PRODUCT', 0x7B226964223A2238353531222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224543552D31383035303234222C22636F6465223A22313637222C22636F646532223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223231222C22636F6D6D656E74223A2233472031202854542D30303030303039313437323429227D, 'ALEX CATUCUAMBA', '2018-02-19 18:02:43', '::ffff:172.30.2.5', 'DELETE');
INSERT INTO `event` VALUES ('2250', 'VOUCHER', 0x7B226964223A223230222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323120555F475945353531375F4D414E54415F544152515549222C2275736572223A223433222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'ALEX CATUCUAMBA', '2018-02-19 18:04:01', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2251', 'VOUCHER', 0x7B226964223A223230222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323120555F475945353531375F4D414E54415F544152515549222C2275736572223A223433222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'SANTIAGO REYES', '2018-02-19 18:08:22', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2252', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353033395F4147554153222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:09:49', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2253', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323120555F475945353531375F4D414E54415F544152515549222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-19 18:11:29', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2254', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353032345F4D4F4E54414C564F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:12:14', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2255', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353038385F4D5543484F5F4C4F5445202F20555F475945353038385F4D5543484F204C4F5445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:14:13', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2256', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353034325F5041534355414C4553222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:15:55', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2257', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353034385F4D414C4C5F44454C5F535552222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:18:09', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2258', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353530315F4D414E54415F45535445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:20:05', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2259', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353532355F43484F4E45222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:21:52', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2260', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353530325F4D414E54415F4F45535445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:23:22', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2261', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353532335F42414849415F535552202F20555F475945353532335F4C454F4E494441535F504C415A415F4D41222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:25:21', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2262', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353335385F454C5F545249554E464F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:28:23', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2263', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353030385F454C5F434F5252454F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:30:50', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2264', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353037355F4741524159222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:32:34', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2265', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353735305F42414241484F594F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-19 18:34:33', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2266', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-20 08:50:27', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2267', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323220555F475945353531345F4D414E54415F5245594553222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 09:16:34', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2268', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323320555F475945353437305F53414E5F504C414349444F222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 09:23:14', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2269', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323420555F475945353436305F504F52544F5649454A4F5F4C415F524F544F4E4441222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 09:41:18', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2270', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-20 09:49:44', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2271', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-20 10:06:39', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2272', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-20 10:07:31', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2273', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323520555F475945353435345F504F52544F5649454A4F5F4E4F52222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 10:18:25', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2274', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323620555F475945353436335F52494F5F504F52544F5649454A4F222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 10:22:24', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2275', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323720555F475945222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 10:34:30', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2276', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323820555F475945353731395F5A4152554D41222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 10:44:49', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2277', 'VOUCHER', 0x7B226964223A223431222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323720555F475945353533315F4355494441445F44454C5F4D4152222C2275736572223A223433222C227374617465223A2231222C22636C69656E74223A2231222C2274797065223A2232227D, 'ALEX CATUCUAMBA', '2018-02-20 10:48:53', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2278', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323920555F475945353731375F504F52544F56454C4F222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 10:54:19', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2279', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333020555F475945353036345F4C4147554E415F434C5542222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 10:59:20', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2280', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333120555F475945353036305F53414E5F49474E4143494F5F44455F4C4F594F4C41222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:03:24', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2281', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333220555F475945353238385F45535452454C4C415F44455F42454C454E222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:08:10', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2282', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-20 11:08:39', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2283', 'PRODUCT', 0x7B226964223A2238353532222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224543552D31383035303233222C22636F6465223A22313637222C22636F646532223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223231222C22636F6D6D656E74223A223347204558502032202854542D30303030303039313630373229227D, 'SANTIAGO REYES', '2018-02-20 11:09:19', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2284', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333320555F475945353132335F414C424F524144415F45535445222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:15:20', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2285', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333420555F475945222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:18:02', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2286', 'VOUCHER', 0x7B226964223A223438222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333420555F475945353436325F504F52544F5649454A4F5F53484F5050494E47222C2275736572223A223433222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'ALEX CATUCUAMBA', '2018-02-20 11:18:32', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2287', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333520555F475945353035385F424154414C4C4F4E222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:24:08', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2288', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333620555F475945353233325F43444C415F53494D4F4E5F424F4C49564152222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:31:51', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2289', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333720555F475945353533335F4D414E54415F4C415F564943544F524941222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:36:31', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2290', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333820555F475945353531345F4D414E54415F5245594553222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:40:12', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2291', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30333920555F475945353531355F4D414E54415F53414E5F414E544F4E494F222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 11:52:26', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2292', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A225475652046656220323020323031382031323A33333A333720474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-20 12:13:28', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2293', 'BILL', 0x7B226964223A223534222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A225475652046656220323020323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-20 12:14:47', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2294', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225475652046656220323020323031382031323A33363A343320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-20 12:16:35', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2295', 'BILL', 0x7B226964223A223535222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225475652046656220323020323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-20 12:16:50', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2296', 'BILL', 0x7B226964223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2233222C2264617465223A225475652046656220323020323031382031323A33363A343320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-20 12:17:12', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2297', 'BILL', 0x7B226964223A223536222C2270726F7669646572223A2231222C22646F63756D656E74223A2233222C2264617465223A225475652046656220323020323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231227D, 'GABRIEL SALAZAR', '2018-02-20 12:17:33', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2298', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323320555F475945222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 12:17:42', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2299', 'VOUCHER', 0x7B226964223A223537222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343020555F475945353631355F4C494245525441445F5355524F45535445222C2275736572223A223433222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232227D, 'ALEX CATUCUAMBA', '2018-02-20 12:18:14', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2300', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-20 14:41:24', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2301', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343120555F475945353533385F5649415F524F4341465545525445222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 14:43:19', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2302', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343220555F475945353436315F4C4F535F50494E4F53222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 14:47:01', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2303', 'VOUCHER', 0x7B226964223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343320555F475945353033395F4147554153222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 14:49:46', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2304', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-20 14:54:33', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2305', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-20 14:58:23', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2306', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-20 14:59:50', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2307', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343420555F475945353034395F5355435245222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 15:03:50', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2308', 'VOUCHER', 0x7B226964223A223631222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343420555F475945353034395F5355435245222C2275736572223A223433222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A22323031382D454E542D30303535227D, 'ALEX CATUCUAMBA', '2018-02-20 15:05:26', '::ffff:172.30.2.5', 'DELETE');
INSERT INTO `event` VALUES ('2309', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-20 15:06:03', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2310', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343420555F475945353034395F5355435245222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 15:06:41', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2311', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-20 15:11:04', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2312', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30343520555F475945353036325F53414E5F4544554152444F20222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-20 15:21:40', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2313', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2232222C2264617465223A225475652046656220323020323031382031373A30313A343520474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223130222C2275736572223A223338227D, 'GABRIEL SALAZAR', '2018-02-20 16:41:48', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2314', 'BILL', 0x7B226964223A223634222C2270726F7669646572223A2234222C22646F63756D656E74223A2232222C2264617465223A225475652046656220323020323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223130222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D2D494E472D323031382D30303035227D, 'GABRIEL SALAZAR', '2018-02-20 16:41:54', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2315', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-20 17:23:35', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2316', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-20 18:25:37', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2317', 'VOUCHER', 0x7B226964223A2235222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303320555F475945353137395F534F4C43415F4759222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303033227D, 'SANTIAGO REYES', '2018-02-20 18:28:37', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2318', 'VOUCHER', 0x7B226964223A2236222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303420475945353036365F42415252494F5F50554552544F5F4C495341555F222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303034227D, 'SANTIAGO REYES', '2018-02-20 18:29:33', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2319', 'VOUCHER', 0x7B226964223A2237222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303520555F475945353137385F5341554345535F39222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303035227D, 'SANTIAGO REYES', '2018-02-20 18:30:27', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2320', 'VOUCHER', 0x7B226964223A2238222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303620555F475945353036385F42454C4C415649535441222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303036227D, 'SANTIAGO REYES', '2018-02-20 18:31:15', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2321', 'VOUCHER', 0x7B226964223A2239222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303720555F475945353139355F43484F4E474F4E222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303037227D, 'SANTIAGO REYES', '2018-02-20 18:32:01', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2322', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353335335F4E4152414E4A414C202F20555F475945353335335F4E4152414E4A414C5F43454E54524F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:35:51', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2323', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353336315F504C41594153202F20555F475945353336315F504C415941535F4E4F524F45535445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:38:53', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2324', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353032365F555244455341222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:40:57', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2325', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353033335F454C5F434F5254494A4F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:42:54', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2326', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353830315F5155455645444F5F4E4F525445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:45:55', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2327', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353830305F5155455645444F5F43454E54524F202F20555F475945353830305F5155455645444F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:47:42', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2328', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353530305F4D414E54415F43454E54524F222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:49:35', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2329', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353630315F53414C494E4153222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:51:15', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2330', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353031335F504F5254455445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-20 18:52:49', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2331', 'PRODUCT', 0x7B226964223A2238393032222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224543552D31383035303533222C22636F6465223A2237222C22636F646532223A223348453031313731414141463032222C226465736372697074696F6E223A22373735302053522D53464D322D32303047222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A223733222C22636F6D6D656E74223A2233472031202854542D30303030303039313436323529227D, 'SANTIAGO REYES', '2018-02-20 18:54:26', '::ffff:172.30.2.10', 'DELETE');
INSERT INTO `event` VALUES ('2332', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-21 09:25:15', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2333', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313020555F475945353931305F434F575F415F4D4F4E54414E495441222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 09:27:37', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2334', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313020555F475945353931365F434F575F425F504F52544F5649454A4F5F43524953544F5F524559222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 09:55:04', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2335', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 10:12:43', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2336', 'PRODUCT', 0x7B226964223A2238393233222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A22532F4E222C22636F6465223A22313638222C22636F646532223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223735222C22636F6D6D656E74223A22227D, 'ALEX CATUCUAMBA', '2018-02-21 10:29:13', '::ffff:172.30.2.5', 'DELETE');
INSERT INTO `event` VALUES ('2337', 'PRODUCT', 0x7B226964223A2238393232222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A22532F4E222C22636F6465223A22313638222C22636F646532223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223735222C22636F6D6D656E74223A22227D, 'ALEX CATUCUAMBA', '2018-02-21 10:29:15', '::ffff:172.30.2.5', 'DELETE');
INSERT INTO `event` VALUES ('2338', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313120555F475945353339365F454C20454D50414C4D45205F535552222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 10:32:18', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2339', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D313220555F475945353339355F454C5F454D50414C4D45222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 10:38:40', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2340', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313220555F475945353931395F434F575F445F4441554C455F504552495041222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 10:43:15', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2341', 'VOUCHER', 0x7B226964223A223738222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313320555F475945353931395F434F575F445F4441554C455F504552495041222C2275736572223A223433222C227374617465223A2231222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303730227D, 'ALEX CATUCUAMBA', '2018-02-21 10:45:48', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2342', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313420555F475945353338355F42414C5A4152222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 10:47:11', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2343', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313520555F475945353338365F434F4C494D4553222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 10:50:42', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2344', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313620555F475945353132345F414C424F524144415F4F45535445222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 10:56:57', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2345', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 10:59:27', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2346', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313720555F475945353037385F4C415F4348414C41222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 11:03:46', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2347', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313820555F475945353035345F4A414445222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 11:09:30', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2348', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313920555F475945222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 11:12:55', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2349', 'VOUCHER', 0x7B226964223A223834222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313920555F475945353234375F53554352455F535552222C2275736572223A223433222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303736227D, 'ALEX CATUCUAMBA', '2018-02-21 11:13:15', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2350', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 11:14:45', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2351', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353036315F56455247454C45535F42455441222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-21 11:18:05', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2352', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D3031323020555F475945353534345F43414E55544F222C2275736572223A223433227D, 'ALEX CATUCUAMBA', '2018-02-21 11:18:39', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2353', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353336305F4345524543495441202F20555F475945353336305F43455245434954415F45535445222C2275736572223A223531227D, 'SANTIAGO REYES', '2018-02-21 11:21:09', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2354', 'VOUCHER', 0x7B226964223A223836222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30323020555F475945353534345F43414E55544F222C2275736572223A223433222C227374617465223A2231222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303738227D, 'ALEX CATUCUAMBA', '2018-02-21 11:31:47', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2355', 'PRODUCT', 0x7B226964223A2238343938222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A22532F4E222C22636F6465223A22313637222C22636F646532223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A223133222C22636F6D6D656E74223A2233472031202854542D30303030303039313437323429227D, 'ALEX CATUCUAMBA', '2018-02-21 12:13:32', '::ffff:172.30.2.5', 'DELETE');
INSERT INTO `event` VALUES ('2356', 'VOUCHER', 0x7B226964223A2233222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303220555F475945353033355F43415045495241222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303031227D, 'ALEX CATUCUAMBA', '2018-02-21 12:19:47', '::ffff:172.30.2.5', 'UPDATE');
INSERT INTO `event` VALUES ('2357', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 12:27:06', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2358', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 12:28:22', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2359', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 12:30:44', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2360', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 12:35:32', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2361', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 12:36:05', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2362', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 12:40:13', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2363', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 13:27:04', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2364', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 13:38:20', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2365', 'USER', 0x7B226964223A223436222C226E616D65223A2253414E544941474F222C226C6173746E616D65223A225245594553222C22757365726E616D65223A22737265796573726F3132222C22656D61696C223A227372657965734063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2231222C2270617373776F7264223A22243261243038246F484C7462752E64663561636156586B76363147674F66543261492F4F4F6D5472314762496471355061697663666953423746324F222C2276616C6964223A22227D, 'GABRIEL SALAZAR', '2018-02-21 13:38:43', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2366', 'USER', 0x7B226964223A223531222C226E616D65223A2253414E544941474F222C226C6173746E616D65223A225245594553222C22757365726E616D65223A22737265796573726F222C22656D61696C223A227372657965734063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2231222C2270617373776F7264223A22243261243038247855386E714977506D586B4F444D422E7032322E786535485645504C2E30537248487A7139354250796D4A4636744C535A34572F53222C2276616C6964223A22227D, 'GABRIEL SALAZAR', '2018-02-21 13:38:55', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2367', 'USER', 0x7B226964223A223436222C226E616D65223A2253414E544941474F222C226C6173746E616D65223A225245594553222C22757365726E616D65223A22737265796573222C22656D61696C223A227372657965734063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2231222C2270617373776F7264223A22243261243038246F484C7462752E64663561636156586B76363147674F66543261492F4F4F6D5472314762496471355061697663666953423746324F222C2276616C6964223A22227D, 'GABRIEL SALAZAR', '2018-02-21 13:39:09', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2368', 'USER', 0x7B226964223A223436222C226E616D65223A2253414E544941474F222C226C6173746E616D65223A225245594553222C22757365726E616D65223A22737265796573222C22656D61696C223A227372657965734063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2232222C2270617373776F7264223A22243261243038246F484C7462752E64663561636156586B76363147674F66543261492F4F4F6D5472314762496471355061697663666953423746324F222C2276616C6964223A22227D, 'GABRIEL SALAZAR', '2018-02-21 13:39:18', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2369', 'USER', 0x7B226964223A223436227D, 'GABRIEL SALAZAR', '2018-02-21 13:39:24', '::ffff:172.30.2.36', 'UPDATE PASSWORD');
INSERT INTO `event` VALUES ('2370', 'USER', 0x7B226964223A223531227D, 'GABRIEL SALAZAR', '2018-02-21 13:39:29', '::ffff:172.30.2.36', 'UPDATE PASSWORD');
INSERT INTO `event` VALUES ('2371', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 13:39:37', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2372', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 13:39:47', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2373', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 13:40:05', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2374', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 13:46:49', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2375', 'BILL', 0x7B226964223A2231222C2270726F7669646572223A2232222C22646F63756D656E74223A2234222C2264617465223A224D6F6E204F637420303220323031372030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224558495354454E4349415320544F54414C4553222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303031227D, 'SANTIAGO REYES', '2018-02-21 13:47:07', '::ffff:172.30.2.10', 'UPDATE');
INSERT INTO `event` VALUES ('2376', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 13:47:21', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2377', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-21 13:58:59', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2378', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 14:05:10', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2379', 'VOUCHER', 0x7B226964223A223637222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303920555F475945353032365F555244455341222C2275736572223A223531222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303539227D, 'GABRIEL SALAZAR', '2018-02-21 14:05:43', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2380', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 14:09:19', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2381', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30303820555F475945353033345F534155434553222C2275736572223A223433222C227374617465223A22227D, 'ALEX CATUCUAMBA', '2018-02-21 14:10:10', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2382', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 14:37:36', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2383', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224143542D454E542D3031382D30313120555F475945353335355F424F4C49434845222C2275736572223A223433222C227374617465223A22227D, 'ALEX CATUCUAMBA', '2018-02-21 14:53:46', '::ffff:172.30.2.5', 'INSERT');
INSERT INTO `event` VALUES ('2384', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-21 15:30:57', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2385', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 16:44:12', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2386', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 17:04:07', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2387', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225765642046656220323120323031382031373A32343A333520474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224130303932393031222C2275736572223A223531222C227374617465223A22227D, 'SANTIAGO REYES', '2018-02-21 17:05:10', '::ffff:172.30.2.10', 'INSERT');
INSERT INTO `event` VALUES ('2388', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-21 17:27:23', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2389', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-21 17:33:59', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2390', 'LOGIN', null, 'ALEX CATUCUAMBA', '2018-02-22 09:08:10', '::ffff:172.30.2.5', 'LOGIN');
INSERT INTO `event` VALUES ('2391', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-22 09:58:16', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2392', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-22 10:12:45', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2393', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-02-22 10:23:03', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2394', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-02-22 10:26:31', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2395', 'LOGIN', null, 'SANTIAGO REYES', '2018-02-22 10:40:43', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2396', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 10:00:48', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2397', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 10:38:00', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2398', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 10:39:49', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2399', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2233222C2264617465223A224672692046656220323320323031382031303A34343A333320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-23 10:44:42', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2400', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 10:47:29', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2401', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 10:49:15', '::ffff:172.30.2.83', 'LOGIN');
INSERT INTO `event` VALUES ('2402', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2232222C2264617465223A225468752046656220313520323031382031303A35303A353320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2232313132222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-23 10:51:03', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2403', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2233222C2264617465223A224672692046656220323320323031382031303A35313A353420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22323535222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-23 10:52:02', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2404', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2237222C2264617465223A224672692046656220323320323031382031303A35323A353020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-23 10:53:00', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2405', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2234222C2264617465223A225475652041707220333020323031392031303A35333A353620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2246414354555241202324255C223F2D27222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-23 10:54:30', '::ffff:172.30.2.83', 'INSERT');
INSERT INTO `event` VALUES ('2406', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2232222C2264617465223A224672692046656220323320323031382031303A35383A343820474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22415344415344415344534144222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-23 10:58:49', '::ffff:172.30.2.83', 'INSERT');
INSERT INTO `event` VALUES ('2407', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 11:37:19', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2408', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 11:38:15', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2409', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 11:40:20', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2410', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 11:41:21', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2411', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 11:42:36', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2412', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-23 11:44:07', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2413', 'PRODUCT', 0x7B226964223A22383832222C22626172636F6465223A22532F4E222C22636F6465223A22313637222C226465736372697074696F6E223A2246414E2028454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B227D, 'GABRIEL SALAZAR', '2018-02-23 11:46:01', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2414', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A224672692046656220323320323031382031313A34373A313120474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2232353530222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-23 11:47:22', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2415', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 11:50:58', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2416', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 12:03:02', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2417', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 12:32:27', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2418', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 14:17:21', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2419', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 14:20:31', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2420', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 14:22:41', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2421', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 14:26:01', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2422', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 16:28:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2423', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-27 17:04:13', '::ffff:172.30.2.83', 'LOGIN');
INSERT INTO `event` VALUES ('2424', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2232222C2264617465223A225475652046656220323720323031382031373A30363A353720474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-27 17:07:19', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2425', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-28 10:12:24', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2426', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-28 10:50:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2427', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-28 11:03:38', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2428', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-02-28 12:14:55', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2429', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225765642046656220323820323031382031343A31383A343920474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-28 14:19:07', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2430', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-28 14:26:29', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2431', 'BILL', 0x7B226964223A223939222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A225765642046656220323820323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303033227D, 'GABRIEL SALAZAR', '2018-02-28 14:33:37', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2432', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A225468752046656220313520323031382031343A33353A313920474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F2046414E53222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-28 14:35:50', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2433', 'MODEL', 0x7B2263617465676F7279223A2238222C226272616E64223A2235222C22636F6465223A225445524D494E414C20454C54454B222C226465736372697074696F6E223A225445524D494E414C4553205041524120434F4E4543544F52202846414E20454C54454B29227D, 'GABRIEL SALAZAR', '2018-02-28 14:44:36', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2434', 'MODEL', 0x7B2263617465676F7279223A2238222C226272616E64223A2235222C22636F6465223A22373232222C226465736372697074696F6E223A2246414E2028454C54454B29227D, 'GABRIEL SALAZAR', '2018-02-28 14:44:39', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2435', 'MODEL', 0x7B2263617465676F7279223A2238222C226272616E64223A2235222C22636F6465223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29227D, 'GABRIEL SALAZAR', '2018-02-28 14:44:40', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2436', 'LOCATION', 0x7B226964223A22222C226E616D65223A22475945227D, 'GABRIEL SALAZAR', '2018-02-28 14:45:13', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2437', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2233222C2264617465223A225765642046656220323820323031382031363A32313A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-02-28 16:21:12', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2438', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-28 16:28:13', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2439', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-28 16:29:02', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2440', 'PRODUCT', 0x7B226964223A2232363333222C22666472223A22222C2263736F223A22222C22776273223A22222C226C6F636174696F6E223A223331222C226C6F636174696F6E32223A22455854222C22626172636F6465223A224E53313432394630333938222C22636F6465223A2232222C22636F646532223A223348453035393438414141463032222C226465736372697074696F6E223A22373735302053522053464D342D3132222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313031222C22636F6D6D656E74223A22222C2261726561223A22222C22636F6E747261746F223A223235222C2263616E74223A2237222C226E756D65726F223A224143542D494E472D323031382D33227D, 'GABRIEL SALAZAR', '2018-02-28 16:29:46', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2441', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-02-28 16:37:14', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2442', 'PRODUCT', 0x7B226964223A2232363334222C22666472223A223235222C2263736F223A223235222C22776273223A223235222C226C6F636174696F6E223A223238222C226C6F636174696F6E32223A224434222C22626172636F6465223A224E53313434363637383031222C22636F6465223A2233222C22636F646532223A223348453033363633414141433034222C226465736372697074696F6E223A22373735302053522D313220313735412050454D33222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313031222C22636F6D6D656E74223A223235222C2261726561223A223235222C22636F6E747261746F223A223235222C2263616E74223A2232222C226E756D65726F223A224143542D494E472D323031382D33227D, 'GABRIEL SALAZAR', '2018-02-28 16:38:15', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2443', 'PRODUCT', 0x7B226964223A2232363335222C22666472223A223235222C2263736F223A223235222C22776273223A223235222C226C6F636174696F6E223A223237222C226C6F636174696F6E32223A224333222C22626172636F6465223A22505255454241222C22636F6465223A2231222C22636F646532223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C2263617465676F7279223A2249502052414E222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313031222C22636F6D6D656E74223A223532222C2261726561223A223235222C22636F6E747261746F223A223235222C2263616E74223A2231222C226E756D65726F223A224143542D494E472D323031382D33227D, 'GABRIEL SALAZAR', '2018-02-28 16:38:59', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2444', 'PRODUCT', 0x7B226964223A2232363336222C22666472223A223235222C2263736F223A223235222C22776273223A223235222C226C6F636174696F6E223A223233222C226C6F636174696F6E32223A224433222C22626172636F6465223A22532F4E222C22636F6465223A22313730222C22636F646532223A225445524D494E414C20454C54454B222C226465736372697074696F6E223A225445524D494E414C4553205041524120434F4E4543544F52202846414E20454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A22313031222C22636F6D6D656E74223A223235222C2261726561223A223235222C22636F6E747261746F223A223235222C2263616E74223A223530222C226E756D65726F223A224143542D494E472D323031382D33227D, 'GABRIEL SALAZAR', '2018-02-28 16:39:54', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2445', 'PRODUCT', 0x7B226964223A2232363337222C22666472223A223235222C2263736F223A223235222C22776273223A223235222C226C6F636174696F6E223A223331222C226C6F636174696F6E32223A22455854222C22626172636F6465223A22532F4E222C22636F6465223A22313730222C22636F646532223A225445524D494E414C20454C54454B222C226465736372697074696F6E223A225445524D494E414C4553205041524120434F4E4543544F52202846414E20454C54454B29222C2263617465676F7279223A22454E4552474941222C226272616E64223A22454C54454B222C2262696C6C223A22313031222C22636F6D6D656E74223A223235222C2261726561223A223235222C22636F6E747261746F223A223235222C2263616E74223A2231222C226E756D65726F223A224143542D494E472D323031382D33227D, 'GABRIEL SALAZAR', '2018-02-28 16:40:46', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2446', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-01 09:58:04', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2447', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-01 10:42:00', '::ffff:172.30.2.40', 'LOGIN');
INSERT INTO `event` VALUES ('2448', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-01 10:51:50', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2449', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-01 14:48:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2450', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-01 16:07:46', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2451', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-02 10:15:27', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2452', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-02 15:33:47', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2453', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-02 17:50:11', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2454', 'CATEGORY', 0x7B226964223A2233222C226E616D65223A223131777731773177227D, 'GABRIEL SALAZAR', '2018-03-02 17:54:19', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2455', 'CATEGORY', 0x7B226964223A2233222C226E616D65223A2257494649227D, 'GABRIEL SALAZAR', '2018-03-02 17:54:45', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2456', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-05 10:01:40', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2457', 'CLIENT', 0x7B226964223A22222C226E616D65223A224361726C6F732067756576617261222C22636F6D70616E79223A22636E74227D, 'GABRIEL SALAZAR', '2018-03-05 11:07:13', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2458', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2238222C2264617465223A22467269204A616E20313920323031382031313A30373A323820474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 11:08:07', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2459', 'CLIENT', 0x7B226964223A22222C226E616D65223A22424F4445474120464C45584E455420534352415054222C22636F6D70616E79223A22464C45584E4554227D, 'GABRIEL SALAZAR', '2018-03-05 11:12:12', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2460', 'VOUCHER', 0x7B226964223A22313031222C2270726F7669646572223A22222C22646F63756D656E74223A2233222C2264617465223A225765642046656220323820323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303031227D, 'GABRIEL SALAZAR', '2018-03-05 11:12:53', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2461', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2239222C2264617465223A22547565204A616E20303220323031382031313A31323A343620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5445524741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 11:13:49', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2462', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-05 11:43:15', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2463', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2234222C22646F63756D656E74223A2231222C2264617465223A22546875204A616E20323520323031382031313A34343A313420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 11:45:02', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2464', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-05 12:03:35', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2465', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-05 12:05:02', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2466', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-05 12:14:47', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2467', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2231222C22646F63756D656E74223A2231222C2264617465223A224D6F6E204A616E20323920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 12:26:06', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2468', 'PRODUCT', 0x7B226964223A2231373736222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223236222C226C6F636174696F6E32223A224831222C22626172636F6465223A224E53313330374631303837222C22636F6465223A223831222C22636F646532223A223348453033363131414141433031222C226465736372697074696F6E223A224D31302D3147422D58502D534650222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A22333636222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A2231222C22636F6D6D656E74223A224E2F41222C2261726561223A22284E4F205554494C495A41522050415241205452414E534E455841292028444F4320464C45584E45543A20323031382D3030303030303030353029222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C226E756D65726F223A224143542D494E472D323031382D31227D, 'GABRIEL SALAZAR', '2018-03-05 12:42:39', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2469', 'PRODUCT', 0x7B226964223A2231373737222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223236222C226C6F636174696F6E32223A224831222C22626172636F6465223A224E53313330374631303830222C22636F6465223A223831222C22636F646532223A223348453033363131414141433031222C226465736372697074696F6E223A224D31302D3147422D58502D534650222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A22333637222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A2231222C22636F6D6D656E74223A224E2F41222C2261726561223A22284E4F205554494C495A41522050415241205452414E534E455841292028444F4320464C45584E45543A20323031382D3030303030303030353029222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C226E756D65726F223A224143542D494E472D323031382D31227D, 'GABRIEL SALAZAR', '2018-03-05 12:42:56', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2470', 'MODEL', 0x7B226964223A22222C22636F6465223A223348453031343733414141413031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C226272616E64223A2232222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-03-05 14:25:12', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2471', 'CLIENT', 0x7B226964223A22222C226E616D65223A226A75616E206D6F72C3A16E222C22636F6D70616E79223A226E6F6B6961227D, 'GABRIEL SALAZAR', '2018-03-05 14:31:51', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2472', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223130222C2264617465223A22546875204E6F7620313620323031372031343A33323A303220474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 14:32:53', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2473', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2239222C2264617465223A224672692046656220303220323031382031343A33343A353420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 14:35:34', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2474', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223131222C2264617465223A22467269204E6F7620323420323031372031343A35303A303620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 14:50:33', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2475', 'CLIENT', 0x7B226964223A22222C226E616D65223A22504544524F20415041524943494F222C22636F6D70616E79223A2244494E414C494E4B227D, 'GABRIEL SALAZAR', '2018-03-05 14:54:03', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2476', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223132222C2264617465223A22547565204A616E20303920323031382031343A35343A303520474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 14:55:17', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2477', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223132222C2264617465223A22467269204A616E20313220323031382031343A35393A343420474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 15:00:14', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2478', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223132222C2264617465223A22546875204A616E20313820323031382031353A31353A313720474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 15:15:45', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2479', 'MODEL', 0x7B226964223A22222C22636F6465223A223348453031313730414141423032222C226465736372697074696F6E223A22373735302053522D53464D322D34303047222C226272616E64223A2232222C2263617465676F7279223A2231227D, 'GABRIEL SALAZAR', '2018-03-05 15:39:34', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2480', 'MODEL', 0x7B226964223A22222C22636F6465223A225344222C226465736372697074696F6E223A22373735302053522D53464D322D34303047222C226272616E64223A2235222C2263617465676F7279223A2232227D, 'GABRIEL SALAZAR', '2018-03-05 15:41:28', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2481', 'MODEL', 0x7B226964223A22313737222C22636F6465223A225344222C226465736372697074696F6E223A22373735302053522D53464D322D34303047222C227072696365223A22222C2273746F636B6D696E223A22222C2263617465676F7279223A2232222C226272616E64223A2235227D, 'GABRIEL SALAZAR', '2018-03-05 15:41:32', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2482', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2239222C2264617465223A225468752046656220303120323031382031363A33383A333020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 16:39:10', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2483', 'VOUCHER', 0x7B226964223A22313132222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225468752046656220303120323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2239222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303130227D, 'GABRIEL SALAZAR', '2018-03-05 16:40:35', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2484', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223132222C2264617465223A224672692046656220303220323031382031363A34373A313220474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-05 16:47:46', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2485', 'VOUCHER', 0x7B226964223A22313033222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A22547565204A616E20303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2239222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303033227D, 'GABRIEL SALAZAR', '2018-03-05 16:48:55', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2486', 'VOUCHER', 0x7B226964223A22313031222C2270726F7669646572223A22222C22646F63756D656E74223A2233222C2264617465223A225765642046656220323820323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303031227D, 'GABRIEL SALAZAR', '2018-03-05 16:49:07', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2487', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-05 17:11:56', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2488', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-05 17:21:56', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2489', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-06 09:56:23', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2490', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-06 10:26:57', '::ffff:172.30.2.40', 'LOGIN');
INSERT INTO `event` VALUES ('2491', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-06 15:43:29', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2492', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-06 15:46:03', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2493', 'LOGIN', null, 'SANTIAGO REYES', '2018-03-06 15:51:13', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2494', 'USER', 0x7B226964223A223339222C226E616D65223A224741424F222C226C6173746E616D65223A2253414C415A4152222C22757365726E616D65223A226773616C617A617232222C22656D61696C223A226761627269656C73616C617A6172406F75746C6F6F6B2E636F6D222C22737461747573223A2231222C22726F6C223A2231222C2270617373776F7264223A2224326124303824644A782E7332666A55336556734270456C764570412E754972414437766C624F686F4741667653496364327144464542336E52536D222C2276616C6964223A22227D, 'SANTIAGO REYES', '2018-03-06 15:51:33', '::ffff:172.30.2.36', 'DELETE');
INSERT INTO `event` VALUES ('2495', 'USER', 0x7B226964223A223338227D, 'SANTIAGO REYES', '2018-03-06 15:51:47', '::ffff:172.30.2.36', 'UPDATE PASSWORD');
INSERT INTO `event` VALUES ('2496', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-06 15:52:00', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2497', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-07 09:31:13', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2498', 'LOGIN', null, 'SANTIAGO REYES', '2018-03-07 09:31:39', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2499', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-07 09:38:40', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2500', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-07 12:21:42', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2501', 'LOGIN', null, 'SANTIAGO REYES', '2018-03-07 12:22:18', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2502', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-07 17:01:36', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2503', 'LOGIN', null, 'SANTIAGO REYES', '2018-03-07 18:40:33', '::ffff:172.30.2.10', 'LOGIN');
INSERT INTO `event` VALUES ('2504', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-08 10:11:31', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2505', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-08 10:19:26', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2506', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-08 10:20:24', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2507', 'BILL', 0x7B226964223A22313030222C2270726F7669646572223A2231222C22646F63756D656E74223A2234222C2264617465223A225468752046656220303120323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F2046414E53222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303032227D, 'GABRIEL SALAZAR', '2018-03-08 10:21:29', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2508', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-08 10:27:01', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2509', 'VOUCHER', 0x7B226964223A22313037222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225468752046656220303120323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A2239222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303035227D, 'GABRIEL SALAZAR', '2018-03-08 10:44:54', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2510', 'VOUCHER', 0x7B226964223A22313033222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A225468752046656220303120323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A2239222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303033227D, 'GABRIEL SALAZAR', '2018-03-08 10:48:43', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2511', 'VOUCHER', 0x7B226964223A22313031222C2270726F7669646572223A22222C22646F63756D656E74223A2233222C2264617465223A224672692046656220303220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A2231222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303031227D, 'GABRIEL SALAZAR', '2018-03-08 10:53:54', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2512', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-08 11:48:16', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2513', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-08 11:59:22', '::ffff:172.30.2.40', 'LOGIN');
INSERT INTO `event` VALUES ('2514', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-08 12:00:01', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2515', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-09 09:34:23', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2516', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-09 10:45:42', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2517', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 10:52:38', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2518', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-09 11:03:47', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2519', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 11:06:36', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2520', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2238222C2264617465223A22467269204A616E20313920323031382031313A32373A343320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 11:07:25', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2521', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 11:29:47', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2522', 'PROVIDER', 0x7B226964223A22222C226E616D65223A22435249535449414E204D4F4E54454E4547524F222C22636F6D70616E79223A22434E54204550227D, 'GABRIEL SALAZAR', '2018-03-09 12:38:30', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2523', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2235222C22646F63756D656E74223A2234222C2264617465223A224D6F6E2046656220323620323031382031323A33383A343320474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 12:40:01', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2524', 'BILL', 0x7B226964223A22313138222C2270726F7669646572223A2235222C22646F63756D656E74223A2234222C2264617465223A224D6F6E2046656220323620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A22227D, 'GABRIEL SALAZAR', '2018-03-09 12:40:16', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2525', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2235222C22646F63756D656E74223A2234222C2264617465223A22467269204D617220303920323031382031323A34303A303920474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224F54524F222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 12:40:29', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2526', 'BILL', 0x7B226964223A22313139222C2270726F7669646572223A2235222C22646F63756D656E74223A2234222C2264617465223A22467269204D617220303920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A224F54524F222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A22227D, 'GABRIEL SALAZAR', '2018-03-09 12:41:20', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2527', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2235222C22646F63756D656E74223A2231222C2264617465223A22467269204D617220303920323031382031323A34313A313620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A223235222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 12:41:29', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2528', 'BILL', 0x7B226964223A22313230222C2270726F7669646572223A2235222C22646F63756D656E74223A2234222C2264617465223A22467269204D617220303920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303035227D, 'GABRIEL SALAZAR', '2018-03-09 12:41:45', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2529', 'MODEL', 0x7B2263617465676F7279223A2238222C226272616E64223A2235222C22636F6465223A225231473139302D414232352D3230222C226465736372697074696F6E223A2246414E2028454C54454B29227D, 'GABRIEL SALAZAR', '2018-03-09 12:54:23', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2530', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A2231222C2264617465223A22546875204D617220303120323031382031343A30343A333620474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 14:05:02', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2531', 'BILL', 0x7B226964223A22313230222C2270726F7669646572223A2235222C22646F63756D656E74223A2234222C2264617465223A224D6F6E2046656220323620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303035227D, 'GABRIEL SALAZAR', '2018-03-09 14:10:52', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2532', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2236222C22646F63756D656E74223A2234222C2264617465223A224D6F6E2046656220323620323031382031343A31373A333020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 14:18:18', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2533', 'CLIENT', 0x7B226964223A22222C226E616D65223A224D41524942454C2048455252455241222C22636F6D70616E79223A22434E54204550227D, 'GABRIEL SALAZAR', '2018-03-09 14:29:16', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2534', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223133222C2264617465223A22546875204D617220303120323031382031343A32393A333720474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 14:30:01', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2535', 'BILL', 0x7B226964223A22313232222C2270726F7669646572223A2237222C22646F63756D656E74223A2234222C2264617465223A224D6F6E2046656220323620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303036227D, 'GABRIEL SALAZAR', '2018-03-09 14:48:21', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2536', 'BILL', 0x7B226964223A22313230222C2270726F7669646572223A2237222C22646F63756D656E74223A2234222C2264617465223A224D6F6E2046656220323620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303035227D, 'GABRIEL SALAZAR', '2018-03-09 14:48:31', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2537', 'PROVIDER', 0x7B226964223A2237222C22646E69223A22222C226E616D65223A224E4F4B4941222C2261646472657373223A22222C2270686F6E65223A22222C22656D61696C223A22222C22637265617465644174223A22222C22757064617465644174223A22222C22636F6D70616E79223A224E4F4B4941227D, 'GABRIEL SALAZAR', '2018-03-09 14:49:08', '::1', 'UPDATE');
INSERT INTO `event` VALUES ('2538', 'BILL', 0x7B226964223A22313232222C2270726F7669646572223A2237222C22646F63756D656E74223A2234222C2264617465223A224D6F6E2046656220323620323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A2231222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303036227D, 'GABRIEL SALAZAR', '2018-03-09 14:54:13', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2539', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 15:21:15', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2540', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2237222C22646F63756D656E74223A2234222C2264617465223A22467269204D617220303920323031382031353A33323A353220474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A22227D, 'GABRIEL SALAZAR', '2018-03-09 15:33:13', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2541', 'MODEL', 0x7B2263617465676F7279223A2231222C226272616E64223A2232222C22636F6465223A223348453033363132414152413031222C226465736372697074696F6E223A224D44412D373735302032302D5054204745204D44412D58502D534650227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:16', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2542', 'MODEL', 0x7B2263617465676F7279223A2231222C226272616E64223A2232222C22636F6465223A223348453032373733414141413031222C226465736372697074696F6E223A225341522D38205348454C46227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:18', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2543', 'MODEL', 0x7B2263617465676F7279223A2231222C226272616E64223A2232222C22636F6465223A22334845303030363243423031222C226465736372697074696F6E223A22534650202D204749474520424153452D5420524A34352052362F362044444D202D34302F383543227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:19', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2544', 'MODEL', 0x7B2263617465676F7279223A2231222C226272616E64223A2232222C22636F6465223A2233484530303036324342222C226465736372697074696F6E223A22534650202D204749474520424153452D5420524A34352052362F362044444D202D34302F383543227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:20', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2545', 'MODEL', 0x7B2263617465676F7279223A2231222C226272616E64223A2232222C22636F6465223A22314142313934363730303035222C226465736372697074696F6E223A22534650204F452D54525820534650204C2D312E312044444D227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:24', '::1', 'INSERT');
INSERT INTO `event` VALUES ('2546', 'PRODUCT', 0x7B226964223A2233393731222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223131222C226C6F636174696F6E32223A224733222C22626172636F6465223A22313454343033373030303636222C22636F6465223A22313833222C22636F646532223A22314142313934363730303035222C226465736372697074696F6E223A22534650204F452D54525820534650204C2D312E312044444D222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303037222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A22454E5452454741444F20504F52204C594459204147554952524520283348453030303336414129222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:45', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2547', 'PRODUCT', 0x7B226964223A2233393730222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223131222C226C6F636174696F6E32223A224733222C22626172636F6465223A22313454343033373030303637222C22636F6465223A22313833222C22636F646532223A22314142313934363730303035222C226465736372697074696F6E223A22534650204F452D54525820534650204C2D312E312044444D222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303036222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A22454E5452454741444F20504F52204C594459204147554952524520283348453030303336414129222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:46', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2548', 'PRODUCT', 0x7B226964223A2233393639222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223131222C226C6F636174696F6E32223A224733222C22626172636F6465223A22313454343033373030303639222C22636F6465223A22313833222C22636F646532223A22314142313934363730303035222C226465736372697074696F6E223A22534650204F452D54525820534650204C2D312E312044444D222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303035222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A22454E5452454741444F20504F52204C594459204147554952524520283348453030303336414129222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:47', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2549', 'PRODUCT', 0x7B226964223A2233393638222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223131222C226C6F636174696F6E32223A224733222C22626172636F6465223A22313454343033373030303634222C22636F6465223A22313833222C22636F646532223A22314142313934363730303035222C226465736372697074696F6E223A22534650204F452D54525820534650204C2D312E312044444D222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303034222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A22454E5452454741444F20504F52204C594459204147554952524520283348453030303336414129222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:47', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2550', 'PRODUCT', 0x7B226964223A2233393636222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223132222C226C6F636174696F6E32223A22504153494C222C22626172636F6465223A224E53303633343530303735222C22636F6465223A22313733222C22636F646532223A223348453031343733414141413031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A22383033222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A224445564F4C5543494F4E2044494E41204C494E4B205441524A45544120434F4E4543544F52204441C39141444F2028524554495241444120504152412050525545424153204F4B292020284E4F205554494C495A41522050415241205452414E534E45584129222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:51', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2551', 'PRODUCT', 0x7B226964223A2233393637222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223331222C226C6F636174696F6E32223A22455854222C22626172636F6465223A224E53303933343631353837222C22636F6465223A223739222C22636F646532223A223348453031343733414141433031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303033222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A224445564F4C5543494F4E2044494E414C494E4B20532E41222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:52', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2552', 'PRODUCT', 0x7B226964223A2233393634222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223331222C226C6F636174696F6E32223A22455854222C22626172636F6465223A224E53313032363638333839222C22636F6465223A223738222C22636F646532223A223348453031343733414141443031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303031222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A224445564F4C5543494F4E20554E494F4E20454C4543545249434120532E41222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:53', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2553', 'PRODUCT', 0x7B226964223A2233393633222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223331222C226C6F636174696F6E32223A22455854222C22626172636F6465223A224E53313032373631373439222C22636F6465223A223738222C22636F646532223A223348453031343733414141443031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303030222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A224445564F4C5543494F4E20554E494F4E20454C4543545249434120532E41222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:42:54', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2554', 'PRODUCT', 0x7B226964223A2233393635222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223331222C226C6F636174696F6E32223A22455854222C22626172636F6465223A224E53303634353532303432222C22636F6465223A22313733222C22636F646532223A223348453031343733414141413031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303032222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A224445564F4C5543494F4E2044494E414C494E4B20532E41222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-09 15:43:09', '::1', 'DELETE');
INSERT INTO `event` VALUES ('2555', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 15:53:55', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2556', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 15:37:58', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2557', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 15:44:13', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2558', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-09 16:01:01', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2559', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-09 16:17:55', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2560', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-12 09:42:20', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2561', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 09:45:33', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2562', 'LOGIN', null, 'SANTIAGO REYES', '2018-03-12 10:51:27', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2563', 'USER', 0x7B226964223A22222C226E616D65223A2253616E746961676F222C226C6173746E616D65223A2250C3A972657A202861646D696E29222C22757365726E616D65223A2273706572657A61646D696E222C22656D61696C223A2273706572657A4063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2232227D, 'SANTIAGO REYES', '2018-03-12 10:52:39', '::ffff:172.30.2.36', 'INSERT');
INSERT INTO `event` VALUES ('2565', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 10:56:24', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2566', 'LOGIN', null, 'SANTIAGO PÉREZ (ADMIN)', '2018-03-12 11:41:21', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2567', 'BILL', 0x7B226964223A22313234222C2270726F7669646572223A2237222C22646F63756D656E74223A2234222C2264617465223A22467269204D617220303920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22494E475245534F222C2275736572223A223338222C227374617465223A2230222C22636C69656E74223A22222C2274797065223A2231222C22636F6469676F223A224143542D494E472D323031382D30303037227D, 'SANTIAGO PÉREZ (ADMIN)', '2018-03-12 11:41:58', '::ffff:172.30.0.45', 'UPDATE');
INSERT INTO `event` VALUES ('2568', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-12 11:42:14', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2569', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 11:56:32', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2570', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 12:07:22', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2571', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 12:10:17', '::1', 'LOGIN');
INSERT INTO `event` VALUES ('2572', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 12:18:57', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2573', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 12:35:54', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2574', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 14:01:24', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2575', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 14:05:59', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2576', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 14:08:38', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2577', 'PRODUCT', 0x7B226964223A2234303034222C22666472223A224E2F4161222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223131222C226C6F636174696F6E32223A224733222C22626172636F6465223A22313454343033373030303636222C22636F6465223A22313833222C22636F646532223A22314142313934363730303035222C226465736372697074696F6E223A22534650204F452D54525820534650204C2D312E312044444D222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303037222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A22454E5452454741444F20504F52204C594459204147554952524520283348453030303336414129222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-12 14:08:58', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2578', 'PRODUCT', 0x7B226964223A2234303034222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A223131222C226C6F636174696F6E32223A224733222C22626172636F6465223A22313454343033373030303636222C22636F6465223A22313833222C22636F646532223A22314142313934363730303035222C226465736372697074696F6E223A22534650204F452D54525820534650204C2D312E312044444D222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303037222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313234222C22636F6D6D656E74223A224E2F41222C2261726561223A22454E5452454741444F20504F52204C594459204147554952524520283348453030303336414129222C22636F6E747261746F223A224E2F41222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D37227D, 'GABRIEL SALAZAR', '2018-03-12 14:09:04', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2579', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 14:15:01', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2580', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 14:19:04', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2581', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 14:26:21', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2582', 'PRODUCT', 0x7B226964223A2233363136222C22666472223A224E2F4161222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A22532F4E222C22636F6465223A22313732222C22636F646532223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29222C2263617465676F7279223A22454E4552474941222C22696470726F64756374223A22373031222C226272616E64223A22454C54454B222C2262696C6C223A22313231222C22636F6D6D656E74223A224143542D454E542D3031382D303539222C2261726561223A22555F475945353436385F435255434954415F43454E54524F222C22636F6E747261746F223A223347204558502033202854542D30303030303039323039353329222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D454E542D323031382D3133227D, 'GABRIEL SALAZAR', '2018-03-12 14:48:33', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2583', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-12 14:48:39', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2584', 'PRODUCT', 0x7B226964223A2233363136222C22666472223A224E2F41222C2263736F223A224E2F41222C22776273223A224E2F41222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A22532F4E222C22636F6465223A22313732222C22636F646532223A22434F4E4543544F5220454C54454B222C226465736372697074696F6E223A22434F4E4543544F5220342050494E4553202846414E20454C54454B29222C2263617465676F7279223A22454E4552474941222C22696470726F64756374223A22373031222C226272616E64223A22454C54454B222C2262696C6C223A22313231222C22636F6D6D656E74223A224143542D454E542D3031382D303539222C2261726561223A22555F475945353436385F435255434954415F43454E54524F222C22636F6E747261746F223A223347204558502033202854542D30303030303039323039353329222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D454E542D323031382D3133227D, 'GABRIEL SALAZAR', '2018-03-12 14:48:44', '::ffff:172.30.2.36', 'UPDATE');
INSERT INTO `event` VALUES ('2585', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-12 15:06:33', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2586', 'VOUCHER', 0x7B226964223A22313137222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A22467269204A616E20313920323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22454E5452454741222C2275736572223A223430222C227374617465223A2230222C22636C69656E74223A2238222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303132227D, 'SANTIAGO PÉREZ', '2018-03-12 15:07:24', '::ffff:172.30.0.45', 'DELETE');
INSERT INTO `event` VALUES ('2587', 'VOUCHER', 0x7B226964223A22222C22636F6469676F223A22222C22636C69656E74223A223132222C2264617465223A224D6F6E204D617220313220323031382031353A33303A323020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2250525545424153204E4F4B4941222C2275736572223A223430222C227374617465223A22227D, 'SANTIAGO PÉREZ', '2018-03-12 15:10:50', '::ffff:172.30.0.45', 'INSERT');
INSERT INTO `event` VALUES ('2588', 'PRODUCT', 0x7B2262696C6C223A22313235222C2263616E74223A2231222C22636F6465223A2231222C22626172636F6465223A2231222C22666472223A224E2F41222C2263736F223A2231303131353834303637222C22776273223A2245434C30314C545331352D4543312D41303030313037222C22636F6E747261746F223A2250726F796563746F204C544520434E54222C2261726561223A22454E5452454741444F204445204C41204241534520414E5449475541222C22636F6D6D656E74223A224E2F41227D, 'SANTIAGO PÉREZ', '2018-03-12 15:13:06', '::ffff:172.30.0.45', 'INSERT');
INSERT INTO `event` VALUES ('2589', 'LOGIN', null, 'SANTIAGO PÉREZ (ADMIN)', '2018-03-12 15:14:16', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2590', 'VOUCHER', 0x7B226964223A22313235222C2270726F7669646572223A22222C22646F63756D656E74223A22222C2264617465223A224D6F6E204D617220313220323031382030303A30303A303020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A2250525545424153204E4F4B4941222C2275736572223A223430222C227374617465223A2230222C22636C69656E74223A223132222C2274797065223A2232222C22636F6469676F223A224143542D454E542D323031382D30303135227D, 'SANTIAGO PÉREZ (ADMIN)', '2018-03-12 15:14:31', '::ffff:172.30.0.45', 'UPDATE');
INSERT INTO `event` VALUES ('2591', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-12 15:14:41', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2592', 'PRODUCT', 0x7B226964223A2234303138222C22666472223A224E2F41222C2263736F223A2231303131353834303637222C22776273223A2245434C30314C545331352D4543312D41303030313037222C226C6F636174696F6E223A22222C226C6F636174696F6E32223A22222C22626172636F6465223A224E53313335304631313436222C22636F6465223A2231222C22636F646532223A223348453035363533414141463031222C226465736372697074696F6E223A2237373035205341522D4D222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313235222C22636F6D6D656E74223A22454E5452454741444F204445204C41204241534520414E5449475541222C2261726561223A224E2F41222C22636F6E747261746F223A2250726F796563746F204C544520434E54222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D454E542D323031382D3135227D, 'SANTIAGO PÉREZ', '2018-03-12 15:15:13', '::ffff:172.30.0.45', 'UPDATE');
INSERT INTO `event` VALUES ('2593', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 15:33:15', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2594', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 15:45:43', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2595', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-12 16:55:25', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2596', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2237222C22646F63756D656E74223A2232222C2264617465223A224D6F6E204D617220313220323031382031373A31373A313120474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A22524344495052414E2D31322D30332D32303138222C2275736572223A223430222C227374617465223A22227D, 'SANTIAGO PÉREZ', '2018-03-12 16:57:34', '::ffff:172.30.0.45', 'INSERT');
INSERT INTO `event` VALUES ('2597', 'PRODUCT', 0x7B2262696C6C223A22313236222C2263616E74223A2231222C22636F6465223A223834222C22626172636F64655F696E707574223A224E53303935313634333738222C22626172636F6465223A224E53303935313634333738222C22666472223A22504F522D3039312D3137222C2263736F223A2231303131353135343136222C22776273223A2245434C3032494F4D32332D4543312D41303030313037222C22636F6E747261746F223A2243616D62696F20646520494F4D222C2261726561223A224E2F41222C22636F6D6D656E74223A22494E475245534F20534F4C4943495441444F20504F5220454C20504D222C226C6F636174696F6E223A223130227D, 'SANTIAGO PÉREZ', '2018-03-12 17:00:11', '::ffff:172.30.0.45', 'CREATE');
INSERT INTO `event` VALUES ('2598', 'MODEL', 0x7B226964223A22222C22636F6465223A2233484530333631394141414E3031222C226465736372697074696F6E223A22494F4D332D5850222C226272616E64223A2236222C2263617465676F7279223A2231227D, 'SANTIAGO PÉREZ', '2018-03-12 17:01:02', '::ffff:172.30.0.45', 'INSERT');
INSERT INTO `event` VALUES ('2599', 'PRODUCT', 0x7B2262696C6C223A22313236222C2263616E74223A2231222C22636F6465223A22313834222C22626172636F64655F696E707574223A224E53313331304630313938222C22626172636F6465223A224E53313331304630313938222C22666472223A22504F522D3039322D3137222C2263736F223A2231303131353135343136222C22776273223A2245434C3032494F4D32332D4543312D41303030313037222C22636F6E747261746F223A2243414D42494F20444520494F4D222C2261726561223A224E2F41222C22636F6D6D656E74223A22494E475245534F20534F4C4943495441444F20504F5220454C20504D222C226C6F636174696F6E223A223132227D, 'SANTIAGO PÉREZ', '2018-03-12 17:03:28', '::ffff:172.30.0.45', 'CREATE');
INSERT INTO `event` VALUES ('2600', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-12 17:25:27', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2601', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-13 15:26:02', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2602', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 10:04:56', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2603', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:33:10', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2604', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:34:12', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2605', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:35:07', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2606', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:40:27', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2607', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:44:11', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2608', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:46:05', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2609', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:56:17', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2610', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-14 15:56:58', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2611', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-15 14:20:21', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2612', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-16 10:01:01', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2613', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-16 11:20:06', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2614', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-19 09:12:08', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2615', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-19 09:56:09', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2616', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-19 10:07:24', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2617', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-19 10:14:55', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2618', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-19 10:51:04', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2619', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-19 15:22:01', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2620', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-20 10:25:16', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2621', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-20 10:33:13', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2622', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-20 10:41:23', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2623', 'BILL', 0x7B226964223A22222C22636F6469676F223A22222C2270726F7669646572223A2237222C22646F63756D656E74223A2232222C2264617465223A22547565204D617220323020323031382031313A30333A323020474D542D303530302028486F7261206573742E20506163C3AD6669636F2C20537564616DC3A97269636129222C227265666572656E6365223A225243444D504C5349502D32302D30332D32303138222C2275736572223A223430222C227374617465223A22227D, 'SANTIAGO PÉREZ', '2018-03-20 10:42:52', '::ffff:172.30.0.45', 'INSERT');
INSERT INTO `event` VALUES ('2624', 'MODEL', 0x7B226964223A22222C22636F6465223A223348453036373932454141433031222C226465736372697074696F6E223A2246414E2037373035205341522D38222C226272616E64223A2232222C2263617465676F7279223A2231227D, 'SANTIAGO PÉREZ', '2018-03-20 10:45:32', '::ffff:172.30.0.45', 'INSERT');
INSERT INTO `event` VALUES ('2625', 'PRODUCT', 0x7B2262696C6C223A22313237222C2263616E74223A2231222C22636F6465223A22313835222C22626172636F64655F696E707574223A224E53313635325330313834222C22626172636F6465223A224E53313635325330313834222C22666472223A22504F522D3038332D3137222C2263736F223A2231303131353233363031222C22776273223A22313031313532333630312D4543312D41303230333630222C22636F6E747261746F223A2254454C434F4E4554222C2261726561223A224E2F41222C22636F6D6D656E74223A22534550415241444F20504152412054454C434F4E4554222C226C6F636174696F6E223A223236227D, 'SANTIAGO PÉREZ', '2018-03-20 10:47:49', '::ffff:172.30.0.45', 'CREATE');
INSERT INTO `event` VALUES ('2626', 'PRODUCT', 0x7B2262696C6C223A22313237222C2263616E74223A2231222C22636F6465223A22313733222C22626172636F64655F696E707574223A224E53303633343530303739222C22626172636F6465223A224E53303633343530303739222C22666472223A22504F522D3039372D3137222C2263736F223A2231303131363432333537222C22776273223A2245434C303252323031372D4543312D41303330343330222C22636F6E747261746F223A22495052414E2046415345222C2261726561223A224E2F41222C22636F6D6D656E74223A224E2F41222C226C6F636174696F6E223A223236227D, 'SANTIAGO PÉREZ', '2018-03-20 10:49:19', '::ffff:172.30.0.45', 'CREATE');
INSERT INTO `event` VALUES ('2627', 'PRODUCT', 0x7B2262696C6C223A22313237222C2263616E74223A2231222C22636F6465223A223739222C22626172636F64655F696E707574223A224E53303933303633353931222C22626172636F6465223A224E53303933303633353931222C22666472223A22504F522D3039362D3137222C2263736F223A2231303131363432333537222C22776273223A2245434C303252323031372D4543312D41303330343330222C22636F6E747261746F223A22495052414E2046415345222C2261726561223A224E2F41222C22636F6D6D656E74223A22494E4752455341444F204C5545474F204445204C41205245504152414349C3934E222C226C6F636174696F6E223A223236227D, 'SANTIAGO PÉREZ', '2018-03-20 10:52:05', '::ffff:172.30.0.45', 'CREATE');
INSERT INTO `event` VALUES ('2628', 'PRODUCT', 0x7B226964223A2234303232222C22666472223A22504F522D3039372D3137222C2263736F223A2231303131363432333537222C22776273223A2245434C303252323031372D4543312D41303330343330222C226C6F636174696F6E223A223236222C226C6F636174696F6E32223A224831222C22626172636F6465223A224E53303633343530303739222C22636F6465223A22313733222C22636F646532223A223348453031343733414141413031222C226465736372697074696F6E223A22494F4D2D373735302053522D372F313220494F4D322D323047222C2263617465676F7279223A2249502052414E222C22696470726F64756374223A2231303438222C226272616E64223A22414C434154454C204C5543454E54222C2262696C6C223A22313237222C22636F6D6D656E74223A22494E4752455341444F204C5545474F204445204C41205245504152414349C3934E222C2261726561223A224E2F41222C22636F6E747261746F223A22495052414E2046415345222C2263616E74223A2231222C227072696365223A2230222C226E756D65726F223A224143542D494E472D323031382D39227D, 'SANTIAGO PÉREZ', '2018-03-20 10:52:37', '::ffff:172.30.0.45', 'UPDATE');
INSERT INTO `event` VALUES ('2629', 'PRODUCT', 0x7B2262696C6C223A22313237222C2263616E74223A2231222C22636F6465223A22313733222C22626172636F64655F696E707574223A224E53303633333530383030222C22626172636F6465223A224E53303633333530383030222C22666472223A22504F522D3039352D3137222C2263736F223A2231303131363432333537222C22776273223A2245434C303252323031372D4543312D41303330343330222C22636F6E747261746F223A22495052414E2046415345222C2261726561223A224E2F41222C22636F6D6D656E74223A22494E4752455341444F204C5545474F204445204C412052455041524143494F4E222C226C6F636174696F6E223A223236227D, 'SANTIAGO PÉREZ', '2018-03-20 10:55:50', '::ffff:172.30.0.45', 'CREATE');
INSERT INTO `event` VALUES ('2630', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-20 11:02:58', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2631', 'LOGIN', null, 'SANTIAGO PÉREZ (ADMIN)', '2018-03-20 11:03:13', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2632', 'LOGIN', null, 'SANTIAGO PÉREZ (ADMIN)', '2018-03-20 11:03:45', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2633', 'USER', 0x7B226964223A223435222C226E616D65223A22504153414E5445222C226C6173746E616D65223A22554E4F222C22757365726E616D65223A22706173616E74653031222C22656D61696C223A2263696E65746F74656C65636F6D756E69636163696F6E65734063696E65746F2E6E6574222C22737461747573223A2231222C22726F6C223A2231222C2270617373776F7264223A22243261243038244931495A6139503369366841315338316A317371467532684F66584C424E3853612E76473848354A4773362E5379494E4D344F2F65222C2276616C6964223A22227D, 'SANTIAGO PÉREZ (ADMIN)', '2018-03-20 11:04:35', '::ffff:172.30.0.45', 'DELETE');
INSERT INTO `event` VALUES ('2634', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-20 12:35:38', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2635', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-20 15:02:15', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2636', 'LOGIN', null, 'SANTIAGO PÉREZ', '2018-03-21 09:39:14', '::ffff:172.30.0.45', 'LOGIN');
INSERT INTO `event` VALUES ('2637', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-21 10:18:40', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2638', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-22 10:47:26', '::ffff:172.30.2.36', 'LOGIN');
INSERT INTO `event` VALUES ('2639', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-23 10:53:28', '::ffff:172.30.2.2', 'LOGIN');
INSERT INTO `event` VALUES ('2640', 'LOGIN', null, 'GABRIEL SALAZAR', '2018-03-23 15:04:12', '::ffff:172.30.2.2', 'LOGIN');
INSERT INTO `event` VALUES ('2641', 'LOGIN', null, 'SANTIAGO REYES', '2018-03-23 15:14:15', '::ffff:172.30.2.2', 'LOGIN');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukname` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('27', 'C3');
INSERT INTO `location` VALUES ('23', 'D3');
INSERT INTO `location` VALUES ('28', 'D4');
INSERT INTO `location` VALUES ('29', 'E1');
INSERT INTO `location` VALUES ('25', 'E2');
INSERT INTO `location` VALUES ('24', 'E4');
INSERT INTO `location` VALUES ('31', 'EXT');
INSERT INTO `location` VALUES ('20', 'F2');
INSERT INTO `location` VALUES ('19', 'F3');
INSERT INTO `location` VALUES ('13', 'F4');
INSERT INTO `location` VALUES ('32', 'FLEXNET GYE');
INSERT INTO `location` VALUES ('34', 'FLEXNET UIO');
INSERT INTO `location` VALUES ('21', 'G1');
INSERT INTO `location` VALUES ('22', 'G2');
INSERT INTO `location` VALUES ('11', 'G3');
INSERT INTO `location` VALUES ('45', 'G3-');
INSERT INTO `location` VALUES ('10', 'G4');
INSERT INTO `location` VALUES ('39', 'G4-');
INSERT INTO `location` VALUES ('35', 'GYE');
INSERT INTO `location` VALUES ('26', 'H1');
INSERT INTO `location` VALUES ('38', 'H1-');
INSERT INTO `location` VALUES ('14', 'H2');
INSERT INTO `location` VALUES ('15', 'H3');
INSERT INTO `location` VALUES ('17', 'H4');
INSERT INTO `location` VALUES ('30', 'I1');
INSERT INTO `location` VALUES ('18', 'I2');
INSERT INTO `location` VALUES ('16', 'MAQ');
INSERT INTO `location` VALUES ('12', 'PASIL');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stockmin` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukcode` (`code`) USING BTREE,
  KEY `brand` (`brand`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `model_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', '3HE05653AAAF01', '7705 SAR-M', '1', null, null, '2');
INSERT INTO `model` VALUES ('2', '3HE05948AAAF02', '7750 SR SFM4-12', '1', null, null, '2');
INSERT INTO `model` VALUES ('3', '3HE03663AAAC04', '7750 SR-12 175A PEM3', '1', null, null, '2');
INSERT INTO `model` VALUES ('4', '3HE05106AARB02', '7750 SR-12 ENHANCED FAN TRAY', '1', null, null, '2');
INSERT INTO `model` VALUES ('5', '3HE03659AAAB01', '7750 SR-C12 DC-PEM3', '1', null, null, '2');
INSERT INTO `model` VALUES ('6', '3HE04580AAAA01', '7750 SR-C12 SERVICE ROUTER', '1', null, null, '2');
INSERT INTO `model` VALUES ('7', '3HE01171AAAF02', '7750 SR-SFM2-200G', '1', null, null, '2');
INSERT INTO `model` VALUES ('8', '3HE01171AAAE02', '7750 SR-SFM2-200G', '1', null, null, '2');
INSERT INTO `model` VALUES ('9', '3HE01170AAAA02', '7750 SR-SFM2-400G', '1', null, null, '2');
INSERT INTO `model` VALUES ('10', '3HE01170AAAF02', '7750 SR-SFM2-400G', '1', null, null, '2');
INSERT INTO `model` VALUES ('11', '3HE01170AAAE02', '7750 SR-SFM2-400G', '1', null, null, '2');
INSERT INTO `model` VALUES ('12', '3HE07555AAAA01', '7X50 DIMM UPGRADE KIT', '1', null, null, '2');
INSERT INTO `model` VALUES ('13', '301000717', '9341 RRH 60W 1900MHZ', '2', null, null, '2');
INSERT INTO `model` VALUES ('14', '3JR37526AA02', '9926 BBU V2', '2', null, null, '2');
INSERT INTO `model` VALUES ('15', '3HE02774AAAC01', 'CONTROL SWITCH MODULE', '1', null, null, '2');
INSERT INTO `model` VALUES ('16', '3HE02775AAAD01', 'A16-CHDS1', '1', null, null, '2');
INSERT INTO `model` VALUES ('17', '3HE02775AAAE01', 'A16-CHDS1', '1', null, null, '2');
INSERT INTO `model` VALUES ('18', '3HE07943AAAC01', 'A6-ETH-10G', '1', null, null, '2');
INSERT INTO `model` VALUES ('19', '3HE06151AAAD01', 'A8-1GB-SFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('20', '3HE02776ABAB01', 'A8-ETH V2', '1', null, null, '2');
INSERT INTO `model` VALUES ('21', '3AM20247AAAB03', 'ATL3H', '3', null, null, '2');
INSERT INTO `model` VALUES ('22', '3AM20247AAAB02', 'ATL3H', '3', null, null, '2');
INSERT INTO `model` VALUES ('23', '3AM20025ACAA', 'CABLE DE ENERGIA DE TRU', '3', null, null, '2');
INSERT INTO `model` VALUES ('24', '3AM20025ABAA', 'CABLE DE ENERGIA DE TRU', '3', null, null, '2');
INSERT INTO `model` VALUES ('25', '3AM20026AAAA', 'CABLE DE EXTENCION BUS NLC', '3', null, null, '2');
INSERT INTO `model` VALUES ('26', '3AM20015AA', 'CABLE KIT FOR MLS-3F', '3', null, null, '2');
INSERT INTO `model` VALUES ('27', 'CAPACITOR ELTEK', 'CAPACITOR CILINDRICO UKS 2UF 380V', '8', null, null, '5');
INSERT INTO `model` VALUES ('28', '3HE03607AAAC01', 'CFM-XP', '1', null, null, '2');
INSERT INTO `model` VALUES ('29', '3HE03607AAAB01', 'CFM-XP', '1', null, null, '2');
INSERT INTO `model` VALUES ('30', '3HE03607AAAA01', 'CFM-XP', '1', null, null, '2');
INSERT INTO `model` VALUES ('31', '3HE03608AAAA01', 'MCM-XP', '1', null, null, '2');
INSERT INTO `model` VALUES ('32', '3HE00104AAAC02', 'CHAS-7750-12 CHASSIS SPARE', '1', null, null, '2');
INSERT INTO `model` VALUES ('33', 'CWCA0-22-00D23', 'CONTACTOR MCRA022AT5', '8', null, null, '5');
INSERT INTO `model` VALUES ('34', '3DB18326ACAD04', 'CSM 9500 MPR', '2', null, null, '2');
INSERT INTO `model` VALUES ('35', '3JR37526AAAC02', 'D2U V5 CHASIS', '5', null, null, '2');
INSERT INTO `model` VALUES ('36', '109735266', 'EAMO 1:2', '6', null, null, '2');
INSERT INTO `model` VALUES ('37', '3JR20073BBBC01', 'ECCM-U', '2', null, null, '2');
INSERT INTO `model` VALUES ('38', '3JR20073ABAC01', 'ECCM-U', '2', null, null, '2');
INSERT INTO `model` VALUES ('39', '3JR20073BBAC01', 'ECCM-U', '2', null, null, '2');
INSERT INTO `model` VALUES ('40', '3JR20059DAAC01', 'ECEM-U', '2', null, null, '2');
INSERT INTO `model` VALUES ('41', '3JR20059DAAB01', 'ECEM-U', '2', null, null, '2');
INSERT INTO `model` VALUES ('42', '3JR20059BAAG02', 'ECEM-U', '2', null, null, '2');
INSERT INTO `model` VALUES ('43', '3JR20059BAAL02', 'ECEM-U', '2', null, null, '2');
INSERT INTO `model` VALUES ('44', '3EC37533NBAC01', 'EMA-AFAN-H W.R', '7', null, null, '2');
INSERT INTO `model` VALUES ('45', '3FE29192AAAA06', 'EMA-FAN_NUIT', '7', null, null, '2');
INSERT INTO `model` VALUES ('46', '51330737399QC', 'EMBRACO POWER IN. CHANGE ON. (COMPRESSOR)', '8', null, null, '2');
INSERT INTO `model` VALUES ('50', 'R2E190', 'FAN (ELTEK - VENTILADORES DEL CONDENSADOR)', '8', null, null, '5');
INSERT INTO `model` VALUES ('51', '3HE06792AAAC03', 'FAN 7705 SAR-8 V2', '1', null, null, '2');
INSERT INTO `model` VALUES ('52', '3HE00016AAAC01', 'FAN 7750 SR-12 FAN TRAY', '1', null, null, '2');
INSERT INTO `model` VALUES ('53', '3HE02778ABAB01', 'FAN MODULE FOR SAR-8', '1', null, null, '2');
INSERT INTO `model` VALUES ('54', '3HE02778ABAC01', 'FAN MODULE(SAR-8 V1)', '1', null, null, '2');
INSERT INTO `model` VALUES ('55', '3AM20071BGAA 01', 'FAN SVENTA', '3', null, null, '2');
INSERT INTO `model` VALUES ('56', '3FE53701ACAA04', 'FANT-F', '7', null, null, '2');
INSERT INTO `model` VALUES ('57', '3JR37517AEAB02', 'FANTRY', '5', null, null, '2');
INSERT INTO `model` VALUES ('58', '3JR37517AEAA01', 'FANTRY', '5', null, null, '2');
INSERT INTO `model` VALUES ('59', '3FE26685AACL06', 'FD-7302 ISAM', '7', null, null, '2');
INSERT INTO `model` VALUES ('60', 'CFD0009 D-1878', 'FILTRO SECADOR UKSC22', '8', null, null, '5');
INSERT INTO `model` VALUES ('61', '241115.105', 'FLATPACK 2 48/2000 HE', '8', null, null, '5');
INSERT INTO `model` VALUES ('62', '241115.105SD', 'FLATPACK 2 48/2000 HE', '8', null, null, '5');
INSERT INTO `model` VALUES ('63', '1AF16500AAAA', 'FLATPACK 2 48/2000 HE', '8', null, null, '5');
INSERT INTO `model` VALUES ('64', '241119.100', 'FLATPACK2 48/3000', '8', null, null, '5');
INSERT INTO `model` VALUES ('65', '3AM20101AAAB02', 'GEB3-B', '3', null, null, '2');
INSERT INTO `model` VALUES ('66', '3AM20101AAAA02', 'GEB3-B', '3', null, null, '2');
INSERT INTO `model` VALUES ('67', '3AM20101AAAD02', 'GEB3-B', '3', null, null, '2');
INSERT INTO `model` VALUES ('68', '3HE00867AA03', 'GIGE EX SFP OPTICS MODULE - LC', '1', null, null, '2');
INSERT INTO `model` VALUES ('69', '3HE00027AA02', 'GIGE SX SFP DDM-LC', '1', null, null, '2');
INSERT INTO `model` VALUES ('70', '3AM19967CAAA01', 'GIO3A', '3', null, null, '2');
INSERT INTO `model` VALUES ('71', '3AM19967BAAA03', 'GIO3A', '3', null, null, '2');
INSERT INTO `model` VALUES ('72', '3AM20420AAAA01', 'GIO3B', '3', null, null, '2');
INSERT INTO `model` VALUES ('73', '3AM20420AAAA02', 'GIO3B', '3', null, null, '2');
INSERT INTO `model` VALUES ('74', '3AM20420AAAA03', 'GIO3B', '3', null, null, '2');
INSERT INTO `model` VALUES ('75', '3HE03660AAAA01', 'HIGH FLOW FAN UNIT', '1', null, null, '2');
INSERT INTO `model` VALUES ('76', '3HE07305BARB01', 'IMM-7X50 20-PT 10GE SFP + - L3BQ', '1', null, null, '2');
INSERT INTO `model` VALUES ('77', '3HE03619AAAP01', 'IOM3-XP', '1', null, null, '2');
INSERT INTO `model` VALUES ('78', '3HE01473AAAD01', 'IOM-7750 SR-7/12 IOM2-20G', '1', null, null, '2');
INSERT INTO `model` VALUES ('79', '3HE01473AAAC01', 'IOM-7750 SR-7/12 IOM2-20G', '1', null, null, '2');
INSERT INTO `model` VALUES ('80', '3AM19967AAAA04', 'LIOC', '3', null, null, '2');
INSERT INTO `model` VALUES ('81', '3HE03611AAAC01', 'M10-1GB-XP-SFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('82', '3HE04274AARA01', 'M1-10GB-XP-XFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('83', '3HE03078AAAB01', 'M1-CHOC3-CES-SFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('84', '3HE03685AAAA01', 'M2-10GB-XP-XFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('85', '3HE03685AARA01', 'M2-10GB-XP-XFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('86', '3HE01364AAAC01', 'M4-CH0C3-AS-SFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('87', '3HE05946AARA01', 'MDA-7750 4-PT OC48/STM16 POS', '1', null, null, '2');
INSERT INTO `model` VALUES ('88', '3AM20244ABAA01', 'MDPS-A', '3', null, null, '2');
INSERT INTO `model` VALUES ('89', 'NS3', 'MICRO SWICHT (SENSORES DE PUERTA)', '8', null, null, '5');
INSERT INTO `model` VALUES ('90', '40.52S', 'MINI RELE 48VCC FINDER', '8', null, null, '5');
INSERT INTO `model` VALUES ('91', '3JR08021ACAA01', 'MODULE FANSRACK 2 -48V DNODEB 2U', '2', null, null, '2');
INSERT INTO `model` VALUES ('92', '3DB20822AAAB03', 'MPT-MC 15GHZ ODU', '2', null, null, '2');
INSERT INTO `model` VALUES ('93', '3DB20858ACAA10', 'MPT-MC-ODU', '2', null, null, '2');
INSERT INTO `model` VALUES ('94', '3DB20859AAAA05', 'MPT-MC-ODU', '2', null, null, '2');
INSERT INTO `model` VALUES ('95', '3FE61233ACCK01', 'NALS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('96', '3FE61233BABF02', 'NALS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('97', '3FE61233BAAC02', 'NALS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('98', '3FE61233BABF01', 'NALS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('99', '3FE61233BCCK01', 'NALS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('100', '3FE61233BAAE02', 'NALS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('101', '3FE26698AABC07', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('102', '3FE26698ABBC06', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('103', '3FE26698AABC06', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('104', '3FE26698AAAB04', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('105', '3FE26698DAAA02', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('106', '3FE26698AAAA06', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('107', '3FE26698DBAA01', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('108', '3FE26698DABA02', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('109', '3FE26698DBBA01', 'NANT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('110', '3FE28209AAAB04', 'NCNC-B', '7', null, null, '2');
INSERT INTO `model` VALUES ('111', '3FE28209AAAA03', 'NCNC-B', '7', null, null, '2');
INSERT INTO `model` VALUES ('112', '3FE28212AAAA03', 'NCNC-C', '7', null, null, '2');
INSERT INTO `model` VALUES ('113', '3FE29534AAAC02', 'NCNC-D', '7', null, null, '2');
INSERT INTO `model` VALUES ('114', '3FE29534AAAC03', 'NCNC-D', '7', null, null, '2');
INSERT INTO `model` VALUES ('115', '3FE29534AAAA02', 'NCNC-D', '7', null, null, '2');
INSERT INTO `model` VALUES ('116', '3AM19709NCPA01', 'NEHC-C', '3', null, null, '2');
INSERT INTO `model` VALUES ('117', '3FE27780ADAB03', 'NGFC-C', '7', null, null, '2');
INSERT INTO `model` VALUES ('118', '3FE27420ABAA01', 'NPOT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('119', '3FE60858ABDA02', 'NPOT-B', '7', null, null, '2');
INSERT INTO `model` VALUES ('120', '3FE27725AAAD01', 'NPSP-B', '7', null, null, '2');
INSERT INTO `model` VALUES ('121', '3FE64398AAAA02', 'NRNT-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('122', '3AM19963AAAA01', 'NSEC-C', '3', null, null, '2');
INSERT INTO `model` VALUES ('123', '3AM20184AAAA02', 'NTIO-A', '3', null, null, '2');
INSERT INTO `model` VALUES ('124', '3AM20184AAAA03', 'NTIO-A', '3', null, null, '2');
INSERT INTO `model` VALUES ('125', '3FE27562ACAA02', 'NVPS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('126', '3FE27562ACBA02', 'NVPS-A', '7', null, null, '2');
INSERT INTO `model` VALUES ('127', '3DB20858AAAA13', 'ODU MPT-MC 7/8 GHZ INF', '2', null, null, '2');
INSERT INTO `model` VALUES ('128', '3EC43356AAAB 01', 'OEM-TRU', '3', null, null, '2');
INSERT INTO `model` VALUES ('129', '3AM20069ACAA', 'OEM-TRU 2 MLS', '3', null, null, '2');
INSERT INTO `model` VALUES ('130', '3AM20069AAAA', 'OEM-TRU 4 MLS', '3', null, null, '2');
INSERT INTO `model` VALUES ('131', '3HE03395AA', 'PANEL E1´S COAX MX', '1', null, null, '2');
INSERT INTO `model` VALUES ('132', '3HE00034AA02', 'PBA OC-3/STM-1 SFP MM OPTICS MODULE-LC', '1', null, null, '2');
INSERT INTO `model` VALUES ('133', 'NTHX30AA05', 'PKTSERVSP3', '2', null, null, '2');
INSERT INTO `model` VALUES ('134', '3AM19958CAAA01', 'POW3B', '3', null, null, '2');
INSERT INTO `model` VALUES ('135', '109777250', 'RRH 2X40', '5', null, null, '2');
INSERT INTO `model` VALUES ('136', '109799361', 'RRH 2X40', '5', null, null, '2');
INSERT INTO `model` VALUES ('137', '3JR10801AAAB13', 'RRH 2X60-1900', '2', null, null, '2');
INSERT INTO `model` VALUES ('138', '3JR10801AAAD01', 'RRH 2X60-1900', '2', null, null, '2');
INSERT INTO `model` VALUES ('139', '3JR10801AAAF01', 'RRH 2X60-1900', '2', null, null, '2');
INSERT INTO `model` VALUES ('140', '3AM19954ABAA02', 'RSA-MLS-3F', '3', null, null, '2');
INSERT INTO `model` VALUES ('141', 'FCLF-8521-3', 'SFP - GIGE BASE-T RJ45 R6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('142', '3HE00028CA01', 'SFP - GIGE LX - LC ROHS 6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('143', '3HE00867CA01', 'SFP - GIGE EX - LC ROHS 6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('144', '3HE00028AA02', 'SFP - GIGE LX - LC ROHS 6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('145', '3HE00062AA01', 'SFP - GIGE TX SFP COPPER MOD - RJ45', '1', null, null, '2');
INSERT INTO `model` VALUES ('146', '3HE00034CA01', 'SFP - OC-3/STM-1 MM-LC R6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('147', '3HE00035AA02', 'SFP - OC-3/STM-1 SFP OPTIC MOD IR-1', '1', null, null, '2');
INSERT INTO `model` VALUES ('148', '3HE04823AAAA01', 'SFP+ 10GE LR-LC ROHS6/6 0/70C', '1', null, null, '2');
INSERT INTO `model` VALUES ('149', '3HE00876AA01', 'SFP-GIGE EX-LC ROHS 6/6  DDM-48/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('150', '3HE00028CAAA01', 'SFP-GIGE LX-LC ROHS 6/6 DDM-40-85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('151', '3HE00046CAAA01', 'SFP-OC-48/STM-16 IR-1 R6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('152', '242100.118', 'SMARTPACK WEB/SNMP', '8', null, null, '5');
INSERT INTO `model` VALUES ('153', '95.05.SPA', 'SOQUETE MINI RELE FINDER 10A-250V', '8', null, null, '5');
INSERT INTO `model` VALUES ('154', 'PSLP 03-15', 'SWITCH ELGIN (PREOSTATO)', '8', null, null, '5');
INSERT INTO `model` VALUES ('155', '3AM20057AAAA02', 'VIS3B', '3', null, null, '2');
INSERT INTO `model` VALUES ('156', '3AM20057ABAA02', 'VIS3B', '3', null, null, '2');
INSERT INTO `model` VALUES ('157', '3HE01545CA01', 'XFP - 10GE ZR - LC ROHS 6/6 0/70C', '1', null, null, '2');
INSERT INTO `model` VALUES ('158', '3HE00564CAAA01', 'XFP-10GE LR-LC ROHS 6/6 0/70C', '1', null, null, '2');
INSERT INTO `model` VALUES ('170', 'TERMINAL ELTEK', 'TERMINALES PARA CONECTOR (FAN ELTEK)', '8', null, null, '5');
INSERT INTO `model` VALUES ('171', '722', 'FAN (ELTEK)', '8', null, null, '5');
INSERT INTO `model` VALUES ('172', 'CONECTOR ELTEK', 'CONECTOR 4 PINES (FAN ELTEK)', '8', null, null, '5');
INSERT INTO `model` VALUES ('173', '3HE01473AAAA01', 'IOM-7750 SR-7/12 IOM2-20G', '1', null, null, '2');
INSERT INTO `model` VALUES ('174', '3HE01170AAAB02', '7750 SR-SFM2-400G', '1', null, null, '2');
INSERT INTO `model` VALUES ('178', 'R1G190-AB25-20', 'FAN (ELTEK)', '8', null, null, '5');
INSERT INTO `model` VALUES ('179', '3HE03612AARA01', 'MDA-7750 20-PT GE MDA-XP-SFP', '1', null, null, '2');
INSERT INTO `model` VALUES ('180', '3HE02773AAAA01', 'SAR-8 SHELF', '1', null, null, '2');
INSERT INTO `model` VALUES ('181', '3HE00062CB01', 'SFP - GIGE BASE-T RJ45 R6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('182', '3HE00062CB', 'SFP - GIGE BASE-T RJ45 R6/6 DDM -40/85C', '1', null, null, '2');
INSERT INTO `model` VALUES ('183', '1AB194670005', 'SFP OE-TRX SFP L-1.1 DDM', '1', null, null, '2');
INSERT INTO `model` VALUES ('184', '3HE03619AAAN01', 'IOM3-XP', '1', null, null, '6');
INSERT INTO `model` VALUES ('185', '3HE06792EAAC01', 'FAN 7705 SAR-8', '1', null, null, '2');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  `state` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq` (`barcode`,`model`) USING BTREE,
  KEY `model` (`model`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`model`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'NS1350F1146', '1', '1');
INSERT INTO `product` VALUES ('2', 'NS1429F0398', '2', '1');
INSERT INTO `product` VALUES ('3', 'NS144667801', '3', '1');
INSERT INTO `product` VALUES ('4', 'NS1501E2164', '4', '1');
INSERT INTO `product` VALUES ('5', 'NS104830040', '5', '1');
INSERT INTO `product` VALUES ('6', 'NS104830034', '5', '1');
INSERT INTO `product` VALUES ('7', 'NS094363241', '6', '1');
INSERT INTO `product` VALUES ('8', 'NS100360034', '7', '1');
INSERT INTO `product` VALUES ('9', 'NS1031F0333', '7', '1');
INSERT INTO `product` VALUES ('10', 'NS094264470', '8', '1');
INSERT INTO `product` VALUES ('11', 'NS0943F0761', '8', '1');
INSERT INTO `product` VALUES ('12', 'NS094362748', '8', '1');
INSERT INTO `product` VALUES ('13', 'NS100660564', '7', '1');
INSERT INTO `product` VALUES ('14', 'NS063650535', '9', '1');
INSERT INTO `product` VALUES ('15', 'NS131861021', '10', '1');
INSERT INTO `product` VALUES ('16', 'NS093264561', '11', '1');
INSERT INTO `product` VALUES ('17', 'NS1420F0348', '10', '1');
INSERT INTO `product` VALUES ('18', 'NS093264553', '11', '1');
INSERT INTO `product` VALUES ('19', 'NA19410', '12', '1');
INSERT INTO `product` VALUES ('20', '11W358P10030', '13', '1');
INSERT INTO `product` VALUES ('21', '11W364P10086', '13', '1');
INSERT INTO `product` VALUES ('22', '11W369P10041', '13', '1');
INSERT INTO `product` VALUES ('23', '12W329P10017', '13', '1');
INSERT INTO `product` VALUES ('24', '12W359P10034', '13', '1');
INSERT INTO `product` VALUES ('25', '12W359P10095', '13', '1');
INSERT INTO `product` VALUES ('26', 'YP133401A90', '14', '1');
INSERT INTO `product` VALUES ('27', 'NS11326A158', '15', '1');
INSERT INTO `product` VALUES ('28', 'NS112669133', '16', '1');
INSERT INTO `product` VALUES ('29', 'NS112669123', '16', '1');
INSERT INTO `product` VALUES ('30', 'NS114866990', '17', '1');
INSERT INTO `product` VALUES ('31', 'NS122861741', '17', '1');
INSERT INTO `product` VALUES ('32', 'NS151565647', '18', '1');
INSERT INTO `product` VALUES ('33', 'NS151565648', '18', '1');
INSERT INTO `product` VALUES ('34', 'NS151565640', '18', '1');
INSERT INTO `product` VALUES ('35', 'NS151565646', '18', '1');
INSERT INTO `product` VALUES ('36', 'NS1621S2610', '19', '1');
INSERT INTO `product` VALUES ('37', 'NS133166134', '20', '1');
INSERT INTO `product` VALUES ('38', 'NS14346A985', '20', '1');
INSERT INTO `product` VALUES ('39', 'NS122865475', '20', '1');
INSERT INTO `product` VALUES ('40', 'NS11376C343', '20', '1');
INSERT INTO `product` VALUES ('41', 'NS112861765', '20', '1');
INSERT INTO `product` VALUES ('42', 'NS102462734', '20', '1');
INSERT INTO `product` VALUES ('43', 'CU111830022', '21', '1');
INSERT INTO `product` VALUES ('44', 'CU103830134', '21', '1');
INSERT INTO `product` VALUES ('45', 'CU153270124', '21', '1');
INSERT INTO `product` VALUES ('46', 'CU135070114', '21', '1');
INSERT INTO `product` VALUES ('47', 'CU111830076', '21', '1');
INSERT INTO `product` VALUES ('48', 'CU111631273', '21', '1');
INSERT INTO `product` VALUES ('49', 'CU142470132', '21', '1');
INSERT INTO `product` VALUES ('50', 'CU153470049', '21', '1');
INSERT INTO `product` VALUES ('51', 'CU111631199', '21', '1');
INSERT INTO `product` VALUES ('52', 'CU150870037', '21', '1');
INSERT INTO `product` VALUES ('53', 'CU151270160', '21', '1');
INSERT INTO `product` VALUES ('54', 'CU111830688', '21', '1');
INSERT INTO `product` VALUES ('55', 'CU151970095', '21', '1');
INSERT INTO `product` VALUES ('56', 'CU111631203', '21', '1');
INSERT INTO `product` VALUES ('57', 'CU111830696', '21', '1');
INSERT INTO `product` VALUES ('58', 'CU150570132', '21', '1');
INSERT INTO `product` VALUES ('59', 'CU131770119', '21', '1');
INSERT INTO `product` VALUES ('60', 'CU132570392', '21', '1');
INSERT INTO `product` VALUES ('61', 'CU151970105', '21', '1');
INSERT INTO `product` VALUES ('62', 'CU132970590', '21', '1');
INSERT INTO `product` VALUES ('63', 'CU151270180', '21', '1');
INSERT INTO `product` VALUES ('64', 'CU143770008', '21', '1');
INSERT INTO `product` VALUES ('65', 'CU143370260', '21', '1');
INSERT INTO `product` VALUES ('66', 'CU153470082', '21', '1');
INSERT INTO `product` VALUES ('67', 'CU143370180', '21', '1');
INSERT INTO `product` VALUES ('68', 'CU141370228', '21', '1');
INSERT INTO `product` VALUES ('69', 'CU151270165', '21', '1');
INSERT INTO `product` VALUES ('70', 'CU144270040', '21', '1');
INSERT INTO `product` VALUES ('71', 'CU103230316', '21', '1');
INSERT INTO `product` VALUES ('72', 'CU132570225', '21', '1');
INSERT INTO `product` VALUES ('73', 'CU131870163', '21', '1');
INSERT INTO `product` VALUES ('74', 'CU104830384', '21', '1');
INSERT INTO `product` VALUES ('75', 'CU104732668', '21', '1');
INSERT INTO `product` VALUES ('76', 'CU133070154', '21', '1');
INSERT INTO `product` VALUES ('77', 'CU104732019', '21', '1');
INSERT INTO `product` VALUES ('78', 'CU102430954', '22', '1');
INSERT INTO `product` VALUES ('79', 'CU102430700', '22', '1');
INSERT INTO `product` VALUES ('80', 'CU102530829', '22', '1');
INSERT INTO `product` VALUES ('81', 'CU104730738', '21', '1');
INSERT INTO `product` VALUES ('82', 'CU133570056', '21', '1');
INSERT INTO `product` VALUES ('83', 'CU132570296', '21', '1');
INSERT INTO `product` VALUES ('84', 'CU111631283', '21', '1');
INSERT INTO `product` VALUES ('85', 'CU104731167', '21', '1');
INSERT INTO `product` VALUES ('86', 'CU104732789', '21', '1');
INSERT INTO `product` VALUES ('87', 'CU143770144', '21', '1');
INSERT INTO `product` VALUES ('88', 'CU103830992', '21', '1');
INSERT INTO `product` VALUES ('89', 'CU111830797', '21', '1');
INSERT INTO `product` VALUES ('90', 'CU150570194', '21', '1');
INSERT INTO `product` VALUES ('91', 'CU143770054', '21', '1');
INSERT INTO `product` VALUES ('92', 'CU103930347', '21', '1');
INSERT INTO `product` VALUES ('93', 'CU132970345', '21', '1');
INSERT INTO `product` VALUES ('94', 'CU111230522', '21', '1');
INSERT INTO `product` VALUES ('95', 'CU152870117', '21', '1');
INSERT INTO `product` VALUES ('96', 'CU132570249', '21', '1');
INSERT INTO `product` VALUES ('97', 'CU153470045', '21', '1');
INSERT INTO `product` VALUES ('98', 'CU153470085', '21', '1');
INSERT INTO `product` VALUES ('99', 'CU103230165', '21', '1');
INSERT INTO `product` VALUES ('100', 'CU152870295', '21', '1');
INSERT INTO `product` VALUES ('101', 'CU132870098', '21', '1');
INSERT INTO `product` VALUES ('102', 'CU111630389', '21', '1');
INSERT INTO `product` VALUES ('103', 'CU152870118', '21', '1');
INSERT INTO `product` VALUES ('104', 'S/N', '23', '1');
INSERT INTO `product` VALUES ('105', 'S/N', '24', '1');
INSERT INTO `product` VALUES ('106', 'S/N', '25', '1');
INSERT INTO `product` VALUES ('107', 'S/N', '26', '1');
INSERT INTO `product` VALUES ('108', 'S/N', '27', '1');
INSERT INTO `product` VALUES ('109', 'NS112162782', '28', '1');
INSERT INTO `product` VALUES ('110', 'NS102068743', '29', '1');
INSERT INTO `product` VALUES ('111', 'NS093660530', '30', '1');
INSERT INTO `product` VALUES ('112', 'NS101066895', '30', '1');
INSERT INTO `product` VALUES ('113', 'NS105162875', '31', '1');
INSERT INTO `product` VALUES ('114', 'NS144862183', '32', '1');
INSERT INTO `product` VALUES ('115', 'S/N', '33', '1');
INSERT INTO `product` VALUES ('116', 'TH1210Q00MJ', '34', '1');
INSERT INTO `product` VALUES ('117', 'YP122708497', '35', '1');
INSERT INTO `product` VALUES ('118', 'YP123709049', '35', '1');
INSERT INTO `product` VALUES ('119', '14XJ35021701', '36', '1');
INSERT INTO `product` VALUES ('120', '14XJ37033949', '36', '1');
INSERT INTO `product` VALUES ('121', '13XJ26024984', '36', '1');
INSERT INTO `product` VALUES ('122', 'YP13420D86A', '37', '1');
INSERT INTO `product` VALUES ('123', 'YP112411219', '38', '1');
INSERT INTO `product` VALUES ('124', 'YP112411209', '38', '1');
INSERT INTO `product` VALUES ('125', 'YP135009C2B', '37', '1');
INSERT INTO `product` VALUES ('126', 'YP1145017B9', '39', '1');
INSERT INTO `product` VALUES ('127', 'YP11321256E', '40', '1');
INSERT INTO `product` VALUES ('128', 'YP11021A9D3', '41', '1');
INSERT INTO `product` VALUES ('129', 'YP143701116', '40', '1');
INSERT INTO `product` VALUES ('130', 'ZJ1218007CJ', '40', '1');
INSERT INTO `product` VALUES ('131', 'BS1039C1PPU', '42', '1');
INSERT INTO `product` VALUES ('132', 'YP11021AA19', '41', '1');
INSERT INTO `product` VALUES ('133', 'BS1033C1PGK', '42', '1');
INSERT INTO `product` VALUES ('134', 'BS1037C1PHA', '42', '1');
INSERT INTO `product` VALUES ('135', 'YP11300C539', '41', '1');
INSERT INTO `product` VALUES ('136', 'BS1034C1S1P', '42', '1');
INSERT INTO `product` VALUES ('137', 'YP1051111CA', '41', '1');
INSERT INTO `product` VALUES ('138', 'YP1304078F5', '43', '1');
INSERT INTO `product` VALUES ('139', 'YP1304077D4', '43', '1');
INSERT INTO `product` VALUES ('140', 'YP112303210', '40', '1');
INSERT INTO `product` VALUES ('141', 'YP120607472', '40', '1');
INSERT INTO `product` VALUES ('142', 'YP1141021B1', '40', '1');
INSERT INTO `product` VALUES ('143', 'YP13420181E', '40', '1');
INSERT INTO `product` VALUES ('144', 'YP1435U30DA', '44', '1');
INSERT INTO `product` VALUES ('145', 'YP125108ADC', '44', '1');
INSERT INTO `product` VALUES ('146', 'YP124807CB5', '44', '1');
INSERT INTO `product` VALUES ('147', 'YP123600320', '44', '1');
INSERT INTO `product` VALUES ('148', 'YP1309013D8', '44', '1');
INSERT INTO `product` VALUES ('149', 'AA1529EH319', '44', '1');
INSERT INTO `product` VALUES ('150', 'YP131108267', '44', '1');
INSERT INTO `product` VALUES ('151', 'YP12520013C', '44', '1');
INSERT INTO `product` VALUES ('152', 'YP1311081CA', '44', '1');
INSERT INTO `product` VALUES ('153', 'YP1311081D6', '44', '1');
INSERT INTO `product` VALUES ('154', 'CN1030MA3DM', '45', '1');
INSERT INTO `product` VALUES ('155', 'YP103312FFE', '45', '1');
INSERT INTO `product` VALUES ('156', 'YP103902E42', '45', '1');
INSERT INTO `product` VALUES ('157', 'CN1030MA3HP', '45', '1');
INSERT INTO `product` VALUES ('158', 'YP103312FF2', '45', '1');
INSERT INTO `product` VALUES ('159', 'YP103312FAF', '45', '1');
INSERT INTO `product` VALUES ('160', 'D17ND69Z', '46', '1');
INSERT INTO `product` VALUES ('161', 'D17MT0HR', '46', '1');
INSERT INTO `product` VALUES ('162', 'DB6NR7QM', '46', '1');
INSERT INTO `product` VALUES ('163', 'D71ND6A3', '46', '1');
INSERT INTO `product` VALUES ('164', 'D17QSDKK', '46', '1');
INSERT INTO `product` VALUES ('165', 'D16FR3V8', '46', '1');
INSERT INTO `product` VALUES ('166', 'D17QSDJY', '46', '1');
INSERT INTO `product` VALUES ('167', 'DB6NR7QY', '46', '1');
INSERT INTO `product` VALUES ('168', 'D17ND69S', '46', '1');
INSERT INTO `product` VALUES ('169', 'DB6KFFFB', '46', '1');
INSERT INTO `product` VALUES ('170', 'DB6NR7QO', '46', '1');
INSERT INTO `product` VALUES ('171', 'D16FR3UX', '46', '1');
INSERT INTO `product` VALUES ('172', 'D16FM1I9', '46', '1');
INSERT INTO `product` VALUES ('173', 'D17MT0G2', '46', '1');
INSERT INTO `product` VALUES ('174', 'D16FM1IY', '46', '1');
INSERT INTO `product` VALUES ('175', 'S/N', '50', '1');
INSERT INTO `product` VALUES ('176', 'ECU-1613005', '50', '1');
INSERT INTO `product` VALUES ('177', 'ECU-1613004', '50', '1');
INSERT INTO `product` VALUES ('178', 'NS1540S7380', '51', '1');
INSERT INTO `product` VALUES ('179', 'NS101062492', '52', '1');
INSERT INTO `product` VALUES ('180', 'NS101062523', '52', '1');
INSERT INTO `product` VALUES ('181', 'NS095263293', '52', '1');
INSERT INTO `product` VALUES ('182', 'NS101240162', '53', '1');
INSERT INTO `product` VALUES ('183', 'NS101240016', '53', '1');
INSERT INTO `product` VALUES ('184', 'NS101240058', '53', '1');
INSERT INTO `product` VALUES ('185', 'NS111569580', '53', '1');
INSERT INTO `product` VALUES ('186', 'NS114869231', '54', '1');
INSERT INTO `product` VALUES ('187', 'NS113366635', '54', '1');
INSERT INTO `product` VALUES ('188', 'NS115063381', '54', '1');
INSERT INTO `product` VALUES ('189', 'NS112664543', '54', '1');
INSERT INTO `product` VALUES ('190', 'NS120469702', '54', '1');
INSERT INTO `product` VALUES ('191', 'NS112664888', '54', '1');
INSERT INTO `product` VALUES ('192', '112', '55', '1');
INSERT INTO `product` VALUES ('193', '173', '55', '1');
INSERT INTO `product` VALUES ('194', 'YP134515059', '56', '1');
INSERT INTO `product` VALUES ('195', 'YP13490A0D4', '57', '1');
INSERT INTO `product` VALUES ('196', 'YP13490A172', '57', '1');
INSERT INTO `product` VALUES ('197', 'YP12280232F', '58', '1');
INSERT INTO `product` VALUES ('198', 'YP12280237E', '58', '1');
INSERT INTO `product` VALUES ('199', 'YP131007686', '58', '1');
INSERT INTO `product` VALUES ('200', 'YP1216070BB', '59', '1');
INSERT INTO `product` VALUES ('201', 'S/N', '60', '1');
INSERT INTO `product` VALUES ('202', '132071186152', '61', '1');
INSERT INTO `product` VALUES ('203', '134971123166', '61', '1');
INSERT INTO `product` VALUES ('204', '110871102591', '61', '1');
INSERT INTO `product` VALUES ('205', '170350001347', '61', '1');
INSERT INTO `product` VALUES ('206', '132071185819', '61', '1');
INSERT INTO `product` VALUES ('207', '170350001467', '61', '1');
INSERT INTO `product` VALUES ('208', '170350001418', '61', '1');
INSERT INTO `product` VALUES ('209', '132071186420', '61', '1');
INSERT INTO `product` VALUES ('210', '134971125217', '61', '1');
INSERT INTO `product` VALUES ('211', '110471114260', '61', '1');
INSERT INTO `product` VALUES ('212', '170350001463', '61', '1');
INSERT INTO `product` VALUES ('213', '170350001349', '61', '1');
INSERT INTO `product` VALUES ('214', '134971125214', '61', '1');
INSERT INTO `product` VALUES ('215', '133371138366', '61', '1');
INSERT INTO `product` VALUES ('216', '134371157524', '61', '1');
INSERT INTO `product` VALUES ('217', '132171105709', '62', '1');
INSERT INTO `product` VALUES ('218', '132071185594', '63', '1');
INSERT INTO `product` VALUES ('219', '132471138216', '63', '1');
INSERT INTO `product` VALUES ('220', '132571163430', '63', '1');
INSERT INTO `product` VALUES ('221', '082971165018', '63', '1');
INSERT INTO `product` VALUES ('222', '132071185942', '63', '1');
INSERT INTO `product` VALUES ('223', '110471113596', '63', '1');
INSERT INTO `product` VALUES ('224', '110471114339', '61', '1');
INSERT INTO `product` VALUES ('225', '132071185657', '63', '1');
INSERT INTO `product` VALUES ('226', '163671069684', '61', '1');
INSERT INTO `product` VALUES ('227', '110571167655', '61', '1');
INSERT INTO `product` VALUES ('228', '170350001412', '61', '1');
INSERT INTO `product` VALUES ('229', '112571193748', '62', '1');
INSERT INTO `product` VALUES ('230', '163671117051', '61', '1');
INSERT INTO `product` VALUES ('231', '110571168846', '61', '1');
INSERT INTO `product` VALUES ('232', '170350001471', '61', '1');
INSERT INTO `product` VALUES ('233', '110571167723', '61', '1');
INSERT INTO `product` VALUES ('234', '170350001339', '61', '1');
INSERT INTO `product` VALUES ('235', '170350001417', '61', '1');
INSERT INTO `product` VALUES ('236', '132471139743', '61', '1');
INSERT INTO `product` VALUES ('237', '132071185901', '61', '1');
INSERT INTO `product` VALUES ('238', '170350001343', '61', '1');
INSERT INTO `product` VALUES ('239', '163671116580', '61', '1');
INSERT INTO `product` VALUES ('240', '133371137970', '61', '1');
INSERT INTO `product` VALUES ('241', '103671150312', '64', '1');
INSERT INTO `product` VALUES ('242', '121671114458', '64', '1');
INSERT INTO `product` VALUES ('243', 'CU1034G0029', '65', '1');
INSERT INTO `product` VALUES ('244', 'CU1034G0123', '65', '1');
INSERT INTO `product` VALUES ('245', 'CU1034G0025', '65', '1');
INSERT INTO `product` VALUES ('246', 'CU1034G0007', '65', '1');
INSERT INTO `product` VALUES ('247', 'CU0841G0304', '66', '1');
INSERT INTO `product` VALUES ('248', 'CU1351G0045', '67', '1');
INSERT INTO `product` VALUES ('249', 'CU1048G0145', '67', '1');
INSERT INTO `product` VALUES ('250', 'CU1034G0124', '65', '1');
INSERT INTO `product` VALUES ('251', 'CU1034G0038', '65', '1');
INSERT INTO `product` VALUES ('252', '07T504500504', '68', '1');
INSERT INTO `product` VALUES ('253', 'PEQ4NX9', '69', '1');
INSERT INTO `product` VALUES ('254', 'PFC5R7F', '69', '1');
INSERT INTO `product` VALUES ('255', 'PFP1KEH', '69', '1');
INSERT INTO `product` VALUES ('256', 'PFP1KJS', '69', '1');
INSERT INTO `product` VALUES ('257', 'PFF2FNN', '69', '1');
INSERT INTO `product` VALUES ('258', 'PFP1L8M', '69', '1');
INSERT INTO `product` VALUES ('259', 'PEQ4P4R', '69', '1');
INSERT INTO `product` VALUES ('260', 'PEQ4P6G', '69', '1');
INSERT INTO `product` VALUES ('261', 'PFP1LEE', '69', '1');
INSERT INTO `product` VALUES ('262', 'CU101570343', '70', '1');
INSERT INTO `product` VALUES ('263', 'CU101570309', '70', '1');
INSERT INTO `product` VALUES ('264', 'CU102870521', '71', '1');
INSERT INTO `product` VALUES ('265', 'CU101570286', '70', '1');
INSERT INTO `product` VALUES ('266', 'CU101870154', '71', '1');
INSERT INTO `product` VALUES ('267', 'CU101870189', '71', '1');
INSERT INTO `product` VALUES ('268', 'CU102870309', '71', '1');
INSERT INTO `product` VALUES ('269', 'CU111270324', '70', '1');
INSERT INTO `product` VALUES ('270', 'CU102870515', '71', '1');
INSERT INTO `product` VALUES ('271', 'CU104171238', '70', '1');
INSERT INTO `product` VALUES ('272', 'CU132370129', '72', '1');
INSERT INTO `product` VALUES ('273', 'CU145070101', '73', '1');
INSERT INTO `product` VALUES ('274', 'CU123370138', '73', '1');
INSERT INTO `product` VALUES ('275', 'CU153170050', '74', '1');
INSERT INTO `product` VALUES ('276', 'CU153170034', '74', '1');
INSERT INTO `product` VALUES ('277', 'CU131470120', '74', '1');
INSERT INTO `product` VALUES ('278', 'NS105380059', '75', '1');
INSERT INTO `product` VALUES ('279', 'NS15036B143', '76', '1');
INSERT INTO `product` VALUES ('280', 'NS1428F1769', '77', '1');
INSERT INTO `product` VALUES ('281', 'NS103664387', '78', '1');
INSERT INTO `product` VALUES ('282', 'NS093461547', '79', '1');
INSERT INTO `product` VALUES ('283', 'CU103770149', '80', '1');
INSERT INTO `product` VALUES ('284', 'CU122870019', '80', '1');
INSERT INTO `product` VALUES ('285', 'CU103270588', '80', '1');
INSERT INTO `product` VALUES ('286', 'CU103670517', '80', '1');
INSERT INTO `product` VALUES ('287', 'CU101971229', '80', '1');
INSERT INTO `product` VALUES ('288', 'CU103670575', '80', '1');
INSERT INTO `product` VALUES ('289', 'CU111670753', '80', '1');
INSERT INTO `product` VALUES ('290', 'CU101971207', '80', '1');
INSERT INTO `product` VALUES ('291', 'CU101971156', '80', '1');
INSERT INTO `product` VALUES ('292', 'CU103670529', '80', '1');
INSERT INTO `product` VALUES ('293', 'CU112570050', '80', '1');
INSERT INTO `product` VALUES ('294', 'CU101971120', '80', '1');
INSERT INTO `product` VALUES ('295', 'CU101971111', '80', '1');
INSERT INTO `product` VALUES ('296', 'CU103270624', '80', '1');
INSERT INTO `product` VALUES ('297', 'CU103270600', '80', '1');
INSERT INTO `product` VALUES ('298', 'CU101971150', '80', '1');
INSERT INTO `product` VALUES ('299', 'CU103770129', '80', '1');
INSERT INTO `product` VALUES ('300', 'CU101971208', '80', '1');
INSERT INTO `product` VALUES ('301', 'CU103670573', '80', '1');
INSERT INTO `product` VALUES ('302', 'CU103670609', '80', '1');
INSERT INTO `product` VALUES ('303', 'CU103670572', '80', '1');
INSERT INTO `product` VALUES ('304', 'CU103670485', '80', '1');
INSERT INTO `product` VALUES ('305', 'CU103770127', '80', '1');
INSERT INTO `product` VALUES ('306', 'CU103770144', '80', '1');
INSERT INTO `product` VALUES ('307', 'CU103670595', '80', '1');
INSERT INTO `product` VALUES ('308', 'CU095170265', '80', '1');
INSERT INTO `product` VALUES ('309', 'CU091371234', '80', '1');
INSERT INTO `product` VALUES ('310', 'CU103670492', '80', '1');
INSERT INTO `product` VALUES ('311', 'CU103670464', '80', '1');
INSERT INTO `product` VALUES ('312', 'CU103670537', '80', '1');
INSERT INTO `product` VALUES ('313', 'CU101971117', '80', '1');
INSERT INTO `product` VALUES ('314', 'CU103670559', '80', '1');
INSERT INTO `product` VALUES ('315', 'CU103270594', '80', '1');
INSERT INTO `product` VALUES ('316', 'CU103670484', '80', '1');
INSERT INTO `product` VALUES ('317', 'CU103270574', '80', '1');
INSERT INTO `product` VALUES ('318', 'CU103270620', '80', '1');
INSERT INTO `product` VALUES ('319', 'CU101971183', '80', '1');
INSERT INTO `product` VALUES ('320', 'CU103270601', '80', '1');
INSERT INTO `product` VALUES ('321', 'YP081716740', '80', '1');
INSERT INTO `product` VALUES ('322', 'CU101971163', '80', '1');
INSERT INTO `product` VALUES ('323', 'CU103770135', '80', '1');
INSERT INTO `product` VALUES ('324', 'CU103670518', '80', '1');
INSERT INTO `product` VALUES ('325', 'CU101971121', '80', '1');
INSERT INTO `product` VALUES ('326', 'CU103270561', '80', '1');
INSERT INTO `product` VALUES ('327', 'CU101971161', '80', '1');
INSERT INTO `product` VALUES ('328', 'CU103670527', '80', '1');
INSERT INTO `product` VALUES ('329', 'CU103670508', '80', '1');
INSERT INTO `product` VALUES ('330', 'CU103770128', '80', '1');
INSERT INTO `product` VALUES ('331', 'CU103270596', '80', '1');
INSERT INTO `product` VALUES ('332', 'CU103670540', '80', '1');
INSERT INTO `product` VALUES ('333', 'CU103670600', '80', '1');
INSERT INTO `product` VALUES ('334', 'CU101971135', '80', '1');
INSERT INTO `product` VALUES ('335', 'CU103670514', '80', '1');
INSERT INTO `product` VALUES ('336', 'CU103670519', '80', '1');
INSERT INTO `product` VALUES ('337', 'CU103670601', '80', '1');
INSERT INTO `product` VALUES ('338', 'CU103270593', '80', '1');
INSERT INTO `product` VALUES ('339', 'CU103670520', '80', '1');
INSERT INTO `product` VALUES ('340', 'CU101971153', '80', '1');
INSERT INTO `product` VALUES ('341', 'CU103670592', '80', '1');
INSERT INTO `product` VALUES ('342', 'CU103670574', '80', '1');
INSERT INTO `product` VALUES ('343', 'CU103670582', '80', '1');
INSERT INTO `product` VALUES ('344', 'CU103770134', '80', '1');
INSERT INTO `product` VALUES ('345', 'CU103670523', '80', '1');
INSERT INTO `product` VALUES ('346', 'CU103670579', '80', '1');
INSERT INTO `product` VALUES ('347', 'CU101971162', '80', '1');
INSERT INTO `product` VALUES ('348', 'CU103770133', '80', '1');
INSERT INTO `product` VALUES ('349', 'CU101971116', '80', '1');
INSERT INTO `product` VALUES ('350', 'CU103670578', '80', '1');
INSERT INTO `product` VALUES ('351', 'CU101971143', '80', '1');
INSERT INTO `product` VALUES ('352', 'CU101971154', '80', '1');
INSERT INTO `product` VALUES ('353', 'CU103270634', '80', '1');
INSERT INTO `product` VALUES ('354', 'CU103670570', '80', '1');
INSERT INTO `product` VALUES ('355', 'CU103270592', '80', '1');
INSERT INTO `product` VALUES ('356', 'CU103270633', '80', '1');
INSERT INTO `product` VALUES ('357', 'CU103270565', '80', '1');
INSERT INTO `product` VALUES ('358', 'CU103670526', '80', '1');
INSERT INTO `product` VALUES ('359', 'CU103670482', '80', '1');
INSERT INTO `product` VALUES ('360', 'CU101971123', '80', '1');
INSERT INTO `product` VALUES ('361', 'CU122870024', '80', '1');
INSERT INTO `product` VALUES ('362', 'CU113070073', '80', '1');
INSERT INTO `product` VALUES ('363', 'CU103270626', '80', '1');
INSERT INTO `product` VALUES ('364', 'CU103670593', '80', '1');
INSERT INTO `product` VALUES ('365', 'CU103670594', '80', '1');
INSERT INTO `product` VALUES ('366', 'NS1307F1087', '81', '1');
INSERT INTO `product` VALUES ('367', 'NS1307F1080', '81', '1');
INSERT INTO `product` VALUES ('368', 'NS1148F1380', '81', '1');
INSERT INTO `product` VALUES ('369', 'NS1439F0770', '82', '1');
INSERT INTO `product` VALUES ('370', 'NS092161023', '83', '1');
INSERT INTO `product` VALUES ('371', 'NS1332F0182', '84', '1');
INSERT INTO `product` VALUES ('372', 'NS0944F0633', '84', '1');
INSERT INTO `product` VALUES ('373', 'NS1128F1470', '84', '1');
INSERT INTO `product` VALUES ('374', 'NS1443F0496', '85', '1');
INSERT INTO `product` VALUES ('375', 'NS104169890', '86', '1');
INSERT INTO `product` VALUES ('376', 'NS144566846', '87', '1');
INSERT INTO `product` VALUES ('377', 'CU102430254', '88', '1');
INSERT INTO `product` VALUES ('378', 'CU113370072', '88', '1');
INSERT INTO `product` VALUES ('379', 'CU103330108', '88', '1');
INSERT INTO `product` VALUES ('380', 'CU104731560', '88', '1');
INSERT INTO `product` VALUES ('381', 'CU102730004', '88', '1');
INSERT INTO `product` VALUES ('382', 'CU104430314', '88', '1');
INSERT INTO `product` VALUES ('383', 'CU104731648', '88', '1');
INSERT INTO `product` VALUES ('384', 'CU104430177', '88', '1');
INSERT INTO `product` VALUES ('385', 'CU104731620', '88', '1');
INSERT INTO `product` VALUES ('386', 'CU101330528', '88', '1');
INSERT INTO `product` VALUES ('387', 'CU101330521', '88', '1');
INSERT INTO `product` VALUES ('388', 'CU104731614', '88', '1');
INSERT INTO `product` VALUES ('389', 'CU102730011', '88', '1');
INSERT INTO `product` VALUES ('390', 'CU104731512', '88', '1');
INSERT INTO `product` VALUES ('391', 'CU104731541', '88', '1');
INSERT INTO `product` VALUES ('392', 'CU104430327', '88', '1');
INSERT INTO `product` VALUES ('393', 'CU101330537', '88', '1');
INSERT INTO `product` VALUES ('394', 'CU104430053', '88', '1');
INSERT INTO `product` VALUES ('395', 'CU104430207', '88', '1');
INSERT INTO `product` VALUES ('396', 'S/N', '89', '1');
INSERT INTO `product` VALUES ('397', 'S/N', '90', '1');
INSERT INTO `product` VALUES ('398', 'YP102406C71', '91', '1');
INSERT INTO `product` VALUES ('399', 'SH1313X00NW', '92', '1');
INSERT INTO `product` VALUES ('400', 'SH1425X005G', '93', '1');
INSERT INTO `product` VALUES ('401', 'SH1146X009S', '94', '1');
INSERT INTO `product` VALUES ('402', 'AA1423FS2FC', '95', '1');
INSERT INTO `product` VALUES ('403', 'YP1323T4A1E', '96', '1');
INSERT INTO `product` VALUES ('404', 'YP1241T6023', '96', '1');
INSERT INTO `product` VALUES ('405', 'CP091000139', '97', '1');
INSERT INTO `product` VALUES ('406', 'AA1141FE29T', '96', '1');
INSERT INTO `product` VALUES ('407', 'YP102718F19', '96', '1');
INSERT INTO `product` VALUES ('408', 'AA1323FE16D', '96', '1');
INSERT INTO `product` VALUES ('409', 'YP10350B818', '98', '1');
INSERT INTO `product` VALUES ('410', 'YP1231T442A', '98', '1');
INSERT INTO `product` VALUES ('411', 'YP11361BA4E', '98', '1');
INSERT INTO `product` VALUES ('412', 'YP113715087', '98', '1');
INSERT INTO `product` VALUES ('413', 'YP10291C41E', '96', '1');
INSERT INTO `product` VALUES ('414', 'AA1322FE8CP', '96', '1');
INSERT INTO `product` VALUES ('415', 'YP10291C65A', '96', '1');
INSERT INTO `product` VALUES ('416', 'AA1324FE2J3', '96', '1');
INSERT INTO `product` VALUES ('417', 'YP101803880', '96', '1');
INSERT INTO `product` VALUES ('418', 'AA1141FE2LU', '98', '1');
INSERT INTO `product` VALUES ('419', 'YP102718F2E', '96', '1');
INSERT INTO `product` VALUES ('420', 'YP102718F20', '96', '1');
INSERT INTO `product` VALUES ('421', 'CP113300824', '96', '1');
INSERT INTO `product` VALUES ('422', 'YP102201032', '96', '1');
INSERT INTO `product` VALUES ('423', 'AA1322FE3ME', '96', '1');
INSERT INTO `product` VALUES ('424', 'YP1223T6BF5', '98', '1');
INSERT INTO `product` VALUES ('425', 'YP102201219', '96', '1');
INSERT INTO `product` VALUES ('426', 'AA1432FS0A3', '99', '1');
INSERT INTO `product` VALUES ('427', 'AA1317FE5CW', '96', '1');
INSERT INTO `product` VALUES ('428', 'AA1316FE71A', '96', '1');
INSERT INTO `product` VALUES ('429', 'YP10350B8D2', '96', '1');
INSERT INTO `product` VALUES ('430', 'CP094301484', '100', '1');
INSERT INTO `product` VALUES ('431', 'AA1316EB650', '101', '1');
INSERT INTO `product` VALUES ('432', 'AA1308EB133', '101', '1');
INSERT INTO `product` VALUES ('433', 'AA1134EB342', '101', '1');
INSERT INTO `product` VALUES ('434', 'AA1242EB270', '101', '1');
INSERT INTO `product` VALUES ('435', 'AA1242EB0DE', '101', '1');
INSERT INTO `product` VALUES ('436', 'AA1308EB1CF', '101', '1');
INSERT INTO `product` VALUES ('437', 'AA1242EB187', '101', '1');
INSERT INTO `product` VALUES ('438', 'AA1032EB53C', '101', '1');
INSERT INTO `product` VALUES ('439', 'AA1242EB2B4', '101', '1');
INSERT INTO `product` VALUES ('440', 'AA1247EB0B4', '101', '1');
INSERT INTO `product` VALUES ('441', 'AA1308EB0F0', '101', '1');
INSERT INTO `product` VALUES ('442', 'AA1242EB0B0', '101', '1');
INSERT INTO `product` VALUES ('443', 'AA0938EB0E3', '102', '1');
INSERT INTO `product` VALUES ('444', 'AA1032EB243', '103', '1');
INSERT INTO `product` VALUES ('445', 'AA0835EB691', '104', '1');
INSERT INTO `product` VALUES ('446', 'AA1436EB2F9', '105', '1');
INSERT INTO `product` VALUES ('447', 'AA1137EB241', '103', '1');
INSERT INTO `product` VALUES ('448', 'CP07110022D', '106', '1');
INSERT INTO `product` VALUES ('449', 'AA1139EB2F5', '103', '1');
INSERT INTO `product` VALUES ('450', 'AA1421EB228', '107', '1');
INSERT INTO `product` VALUES ('451', 'AA1608EB0CC', '108', '1');
INSERT INTO `product` VALUES ('452', 'AA1137EB0D7', '103', '1');
INSERT INTO `product` VALUES ('453', 'AA1137EB41B', '103', '1');
INSERT INTO `product` VALUES ('454', 'AA1031EB9DC', '103', '1');
INSERT INTO `product` VALUES ('455', 'AA1421EB293', '107', '1');
INSERT INTO `product` VALUES ('456', 'AA0835EB6C0', '104', '1');
INSERT INTO `product` VALUES ('457', 'AA1421EB27D', '107', '1');
INSERT INTO `product` VALUES ('458', 'AA1436EB293', '105', '1');
INSERT INTO `product` VALUES ('459', 'AA1438EBA4B', '105', '1');
INSERT INTO `product` VALUES ('460', 'AA1620EB0AF', '109', '1');
INSERT INTO `product` VALUES ('461', 'AA1137EB151', '103', '1');
INSERT INTO `product` VALUES ('462', 'AA1316EB4B2', '101', '1');
INSERT INTO `product` VALUES ('463', 'AA1242EB2AE', '101', '1');
INSERT INTO `product` VALUES ('464', 'AA1323EB21C', '101', '1');
INSERT INTO `product` VALUES ('465', 'AA0925EB773', '101', '1');
INSERT INTO `product` VALUES ('466', 'AA1139EB0C5', '103', '1');
INSERT INTO `product` VALUES ('467', 'YP1240T44A5', '110', '1');
INSERT INTO `product` VALUES ('468', 'YP10291C0DE', '111', '1');
INSERT INTO `product` VALUES ('469', 'YP1240T4448', '110', '1');
INSERT INTO `product` VALUES ('470', 'YP1240T44A6', '110', '1');
INSERT INTO `product` VALUES ('471', 'YP10270B3AB', '111', '1');
INSERT INTO `product` VALUES ('472', 'YP071144139', '112', '1');
INSERT INTO `product` VALUES ('473', 'YP071144210', '112', '1');
INSERT INTO `product` VALUES ('474', 'YP071406828', '112', '1');
INSERT INTO `product` VALUES ('475', 'YP071407068', '112', '1');
INSERT INTO `product` VALUES ('476', 'YP071144232', '112', '1');
INSERT INTO `product` VALUES ('477', 'YP070942039', '112', '1');
INSERT INTO `product` VALUES ('478', 'YP074058246', '112', '1');
INSERT INTO `product` VALUES ('479', 'YP072383047', '112', '1');
INSERT INTO `product` VALUES ('480', 'YP071144129', '112', '1');
INSERT INTO `product` VALUES ('481', 'YP071407100', '112', '1');
INSERT INTO `product` VALUES ('482', 'YP112120FE9', '113', '1');
INSERT INTO `product` VALUES ('483', 'YP11050670E', '113', '1');
INSERT INTO `product` VALUES ('484', 'YP1323T435F', '114', '1');
INSERT INTO `product` VALUES ('485', 'YP1233T5123', '114', '1');
INSERT INTO `product` VALUES ('486', 'YP1311T8959', '114', '1');
INSERT INTO `product` VALUES ('487', 'YP1132158AA', '113', '1');
INSERT INTO `product` VALUES ('488', 'YP11331A5EF', '113', '1');
INSERT INTO `product` VALUES ('489', 'YP112120F4C', '113', '1');
INSERT INTO `product` VALUES ('490', 'YP113215891', '113', '1');
INSERT INTO `product` VALUES ('491', 'YP1025202EE', '113', '1');
INSERT INTO `product` VALUES ('492', 'YP11331A60F', '113', '1');
INSERT INTO `product` VALUES ('493', 'YP1323T4379', '114', '1');
INSERT INTO `product` VALUES ('494', 'YP113215991', '113', '1');
INSERT INTO `product` VALUES ('495', 'YP114309A5D', '113', '1');
INSERT INTO `product` VALUES ('496', 'YP113215976', '113', '1');
INSERT INTO `product` VALUES ('497', 'YP112120F3D', '113', '1');
INSERT INTO `product` VALUES ('498', 'YP081901105', '115', '1');
INSERT INTO `product` VALUES ('499', 'YP1323T434F', '114', '1');
INSERT INTO `product` VALUES ('500', 'YP1323T4358', '114', '1');
INSERT INTO `product` VALUES ('501', 'YP1311T8936', '114', '1');
INSERT INTO `product` VALUES ('502', 'YP1025203F7', '113', '1');
INSERT INTO `product` VALUES ('503', 'YP1309T6D91', '114', '1');
INSERT INTO `product` VALUES ('504', 'YP1436T42EF', '114', '1');
INSERT INTO `product` VALUES ('505', 'YP1311T8935', '114', '1');
INSERT INTO `product` VALUES ('506', 'YP1244T4EB5', '114', '1');
INSERT INTO `product` VALUES ('507', 'YP1244T4ED3', '114', '1');
INSERT INTO `product` VALUES ('508', 'YP1311T8955', '114', '1');
INSERT INTO `product` VALUES ('509', 'YP1323T4342', '114', '1');
INSERT INTO `product` VALUES ('510', 'YP1311T897A', '114', '1');
INSERT INTO `product` VALUES ('511', 'YP1244T4E74', '114', '1');
INSERT INTO `product` VALUES ('512', 'YP1311T894B', '114', '1');
INSERT INTO `product` VALUES ('513', 'YP1310T7B16', '114', '1');
INSERT INTO `product` VALUES ('514', 'YP1233T50CC', '114', '1');
INSERT INTO `product` VALUES ('515', 'YP1233T50B6', '114', '1');
INSERT INTO `product` VALUES ('516', 'YP1311T8934', '114', '1');
INSERT INTO `product` VALUES ('517', 'YP1244T4E76', '114', '1');
INSERT INTO `product` VALUES ('518', 'YP1244T4ECB', '114', '1');
INSERT INTO `product` VALUES ('519', 'YP1244T4EBA', '114', '1');
INSERT INTO `product` VALUES ('520', 'YP1323T438B', '114', '1');
INSERT INTO `product` VALUES ('521', 'YP1436T42DA', '114', '1');
INSERT INTO `product` VALUES ('522', 'CU142070002', '116', '1');
INSERT INTO `product` VALUES ('523', 'YP101813C9C', '116', '1');
INSERT INTO `product` VALUES ('524', 'CU142070012', '116', '1');
INSERT INTO `product` VALUES ('525', 'CU132070272', '116', '1');
INSERT INTO `product` VALUES ('526', 'CU133670082', '116', '1');
INSERT INTO `product` VALUES ('527', 'CU133670076', '116', '1');
INSERT INTO `product` VALUES ('528', 'CU132070267', '116', '1');
INSERT INTO `product` VALUES ('529', 'CU100670113', '116', '1');
INSERT INTO `product` VALUES ('530', 'CU142070013', '116', '1');
INSERT INTO `product` VALUES ('531', 'CU102570901', '116', '1');
INSERT INTO `product` VALUES ('532', 'CU104970186', '116', '1');
INSERT INTO `product` VALUES ('533', 'CU104970066', '116', '1');
INSERT INTO `product` VALUES ('534', 'CU100670100', '116', '1');
INSERT INTO `product` VALUES ('535', 'CU081474057', '116', '1');
INSERT INTO `product` VALUES ('536', 'CU104970197', '116', '1');
INSERT INTO `product` VALUES ('537', 'CU150370063', '116', '1');
INSERT INTO `product` VALUES ('538', 'CU154770070', '116', '1');
INSERT INTO `product` VALUES ('539', 'CU101970347', '116', '1');
INSERT INTO `product` VALUES ('540', 'YP094907F33', '116', '1');
INSERT INTO `product` VALUES ('541', 'YP085000FA6', '116', '1');
INSERT INTO `product` VALUES ('542', 'CU103970073', '116', '1');
INSERT INTO `product` VALUES ('543', 'CU130970033', '116', '1');
INSERT INTO `product` VALUES ('544', 'CU123370113', '116', '1');
INSERT INTO `product` VALUES ('545', 'CU133670052', '116', '1');
INSERT INTO `product` VALUES ('546', 'CU081271780', '116', '1');
INSERT INTO `product` VALUES ('547', 'CU103970079', '116', '1');
INSERT INTO `product` VALUES ('548', 'YP101813C49', '116', '1');
INSERT INTO `product` VALUES ('549', 'CU122770727', '116', '1');
INSERT INTO `product` VALUES ('550', 'CU103970109', '116', '1');
INSERT INTO `product` VALUES ('551', 'CU140970061', '116', '1');
INSERT INTO `product` VALUES ('552', 'CU101970289', '116', '1');
INSERT INTO `product` VALUES ('553', 'CU101870067', '116', '1');
INSERT INTO `product` VALUES ('554', 'CU133670055', '116', '1');
INSERT INTO `product` VALUES ('555', 'YP085000F5B', '116', '1');
INSERT INTO `product` VALUES ('556', 'YP10391E4F2', '116', '1');
INSERT INTO `product` VALUES ('557', 'YP1031076FB', '117', '1');
INSERT INTO `product` VALUES ('558', 'YP09121A079', '118', '1');
INSERT INTO `product` VALUES ('559', 'YP1421T431D', '119', '1');
INSERT INTO `product` VALUES ('560', 'YP1441T4760', '119', '1');
INSERT INTO `product` VALUES ('561', 'YP1445T4A65', '119', '1');
INSERT INTO `product` VALUES ('562', 'YP1445T4998', '119', '1');
INSERT INTO `product` VALUES ('563', 'DK1004NAFUL', '120', '1');
INSERT INTO `product` VALUES ('564', 'AA1122ZA8A2', '121', '1');
INSERT INTO `product` VALUES ('565', 'CU122770680', '122', '1');
INSERT INTO `product` VALUES ('566', 'CU103170265', '122', '1');
INSERT INTO `product` VALUES ('567', 'CU131470051', '122', '1');
INSERT INTO `product` VALUES ('568', 'CU122770675', '122', '1');
INSERT INTO `product` VALUES ('569', 'CU102570650', '122', '1');
INSERT INTO `product` VALUES ('570', 'CU102570729', '122', '1');
INSERT INTO `product` VALUES ('571', 'CU103870042', '122', '1');
INSERT INTO `product` VALUES ('572', 'CU132970752', '122', '1');
INSERT INTO `product` VALUES ('573', 'CU102570755', '122', '1');
INSERT INTO `product` VALUES ('574', 'CU103870057', '122', '1');
INSERT INTO `product` VALUES ('575', 'CU104270577', '122', '1');
INSERT INTO `product` VALUES ('576', 'CU102570744', '122', '1');
INSERT INTO `product` VALUES ('577', 'CU092770004', '123', '1');
INSERT INTO `product` VALUES ('578', 'CU104170267', '124', '1');
INSERT INTO `product` VALUES ('579', 'CU113470182', '124', '1');
INSERT INTO `product` VALUES ('580', 'YP111714109', '125', '1');
INSERT INTO `product` VALUES ('581', 'YP1424T4264', '126', '1');
INSERT INTO `product` VALUES ('582', 'YP1424T41BE', '126', '1');
INSERT INTO `product` VALUES ('583', 'YP1422T446D', '126', '1');
INSERT INTO `product` VALUES ('584', 'YP1422T4450', '126', '1');
INSERT INTO `product` VALUES ('585', 'YP1422T4461', '126', '1');
INSERT INTO `product` VALUES ('586', 'SH1133X0041', '127', '1');
INSERT INTO `product` VALUES ('587', '39781', '128', '1');
INSERT INTO `product` VALUES ('588', '45186', '129', '1');
INSERT INTO `product` VALUES ('589', '62835', '130', '1');
INSERT INTO `product` VALUES ('590', '000106', '131', '1');
INSERT INTO `product` VALUES ('591', '1XX201093125097', '132', '1');
INSERT INTO `product` VALUES ('592', '1XX201093125088', '132', '1');
INSERT INTO `product` VALUES ('593', '1XX201093125103', '132', '1');
INSERT INTO `product` VALUES ('594', '1XX201093125089', '132', '1');
INSERT INTO `product` VALUES ('595', '13RT02238663', '133', '1');
INSERT INTO `product` VALUES ('596', 'CU102770217', '134', '1');
INSERT INTO `product` VALUES ('597', 'CU111370591', '134', '1');
INSERT INTO `product` VALUES ('598', 'CU102970190', '134', '1');
INSERT INTO `product` VALUES ('599', 'CU093070120', '134', '1');
INSERT INTO `product` VALUES ('600', 'CU122970021', '134', '1');
INSERT INTO `product` VALUES ('601', 'CU130470058', '134', '1');
INSERT INTO `product` VALUES ('602', 'CU113070168', '134', '1');
INSERT INTO `product` VALUES ('603', '13W350R60194', '135', '1');
INSERT INTO `product` VALUES ('604', '13W331R60091', '135', '1');
INSERT INTO `product` VALUES ('605', '13W350R60188', '135', '1');
INSERT INTO `product` VALUES ('606', '13W333R60578', '135', '1');
INSERT INTO `product` VALUES ('607', '13W363R60057', '136', '1');
INSERT INTO `product` VALUES ('608', '13W335D70603', '137', '1');
INSERT INTO `product` VALUES ('609', '13W368D70608', '138', '1');
INSERT INTO `product` VALUES ('610', '14W354D70714', '138', '1');
INSERT INTO `product` VALUES ('611', '14W359D70414', '138', '1');
INSERT INTO `product` VALUES ('612', '13W364D70117', '138', '1');
INSERT INTO `product` VALUES ('613', '14W354D70523', '139', '1');
INSERT INTO `product` VALUES ('614', '13W346D70349', '137', '1');
INSERT INTO `product` VALUES ('615', '13W345D70153', '137', '1');
INSERT INTO `product` VALUES ('616', 'CU103270135', '140', '1');
INSERT INTO `product` VALUES ('617', 'CA103100042', '140', '1');
INSERT INTO `product` VALUES ('618', 'CU131970057', '140', '1');
INSERT INTO `product` VALUES ('619', 'CU133170006', '140', '1');
INSERT INTO `product` VALUES ('620', 'CU094870631', '140', '1');
INSERT INTO `product` VALUES ('621', 'CA103100045', '140', '1');
INSERT INTO `product` VALUES ('622', 'CA130500044', '140', '1');
INSERT INTO `product` VALUES ('623', 'CU131970050', '140', '1');
INSERT INTO `product` VALUES ('624', 'CA104500080', '140', '1');
INSERT INTO `product` VALUES ('625', 'PM414A2', '141', '1');
INSERT INTO `product` VALUES ('626', 'D872001861', '142', '1');
INSERT INTO `product` VALUES ('627', 'B9Q2012633', '142', '1');
INSERT INTO `product` VALUES ('628', 'BA82005882', '142', '1');
INSERT INTO `product` VALUES ('629', 'D7K2017748', '143', '1');
INSERT INTO `product` VALUES ('630', 'B9J2001413', '142', '1');
INSERT INTO `product` VALUES ('631', 'D2A2001757', '142', '1');
INSERT INTO `product` VALUES ('632', '06T402905564', '144', '1');
INSERT INTO `product` VALUES ('633', 'A9M2010485', '144', '1');
INSERT INTO `product` VALUES ('634', '07T402903129', '144', '1');
INSERT INTO `product` VALUES ('635', '08T402901625', '144', '1');
INSERT INTO `product` VALUES ('636', 'AA72013733', '144', '1');
INSERT INTO `product` VALUES ('637', 'PH23Q8J', '145', '1');
INSERT INTO `product` VALUES ('638', 'PK65QUV', '145', '1');
INSERT INTO `product` VALUES ('639', 'PH96NWV', '145', '1');
INSERT INTO `product` VALUES ('640', 'PH22QWU', '145', '1');
INSERT INTO `product` VALUES ('641', 'A7T2021553', '146', '1');
INSERT INTO `product` VALUES ('642', 'A7T2021557', '146', '1');
INSERT INTO `product` VALUES ('643', 'PHA0ZNM', '147', '1');
INSERT INTO `product` VALUES ('644', 'PGL2T27', '147', '1');
INSERT INTO `product` VALUES ('645', 'PGL2T83', '147', '1');
INSERT INTO `product` VALUES ('646', 'PGL2T8H', '147', '1');
INSERT INTO `product` VALUES ('647', 'PGL2SWD', '147', '1');
INSERT INTO `product` VALUES ('648', 'ATF06HE', '148', '1');
INSERT INTO `product` VALUES ('649', '083389A00684', '149', '1');
INSERT INTO `product` VALUES ('650', 'EBS2005836', '150', '1');
INSERT INTO `product` VALUES ('651', 'EBS2006015', '150', '1');
INSERT INTO `product` VALUES ('652', 'EBS2006017', '150', '1');
INSERT INTO `product` VALUES ('653', 'EBS2005802', '150', '1');
INSERT INTO `product` VALUES ('654', 'PSJ1VG5', '151', '1');
INSERT INTO `product` VALUES ('655', '170171049183', '152', '1');
INSERT INTO `product` VALUES ('656', 'S/N', '153', '1');
INSERT INTO `product` VALUES ('657', 'S/N', '154', '1');
INSERT INTO `product` VALUES ('658', 'ECU-1612004', '154', '1');
INSERT INTO `product` VALUES ('659', 'ECU-1612006', '154', '1');
INSERT INTO `product` VALUES ('660', 'ECU-1612008', '154', '1');
INSERT INTO `product` VALUES ('661', 'ECU-1612005', '154', '1');
INSERT INTO `product` VALUES ('662', 'ECU-1612007', '154', '1');
INSERT INTO `product` VALUES ('663', 'ECU-1612009', '154', '1');
INSERT INTO `product` VALUES ('664', 'CU122571096', '155', '1');
INSERT INTO `product` VALUES ('665', 'CU123270410', '155', '1');
INSERT INTO `product` VALUES ('666', 'CU143870075', '155', '1');
INSERT INTO `product` VALUES ('667', 'CU133770019', '155', '1');
INSERT INTO `product` VALUES ('668', 'CU142570162', '155', '1');
INSERT INTO `product` VALUES ('669', 'YP10390C098', '155', '1');
INSERT INTO `product` VALUES ('670', 'CU103270490', '155', '1');
INSERT INTO `product` VALUES ('671', 'CU135170081', '155', '1');
INSERT INTO `product` VALUES ('672', 'CU103270428', '155', '1');
INSERT INTO `product` VALUES ('673', 'CU151870034', '155', '1');
INSERT INTO `product` VALUES ('674', 'CU150770013', '155', '1');
INSERT INTO `product` VALUES ('675', 'YP1025205D8', '155', '1');
INSERT INTO `product` VALUES ('676', 'YP10391E420', '156', '1');
INSERT INTO `product` VALUES ('677', 'CU152970004', '155', '1');
INSERT INTO `product` VALUES ('678', 'YP10390C080', '155', '1');
INSERT INTO `product` VALUES ('679', 'YP10221A33C', '156', '1');
INSERT INTO `product` VALUES ('680', 'CU092270256', '156', '1');
INSERT INTO `product` VALUES ('681', 'YP10221A311', '156', '1');
INSERT INTO `product` VALUES ('682', 'CU092470242', '156', '1');
INSERT INTO `product` VALUES ('683', 'YP1025205C4', '155', '1');
INSERT INTO `product` VALUES ('684', 'CU084370969', '156', '1');
INSERT INTO `product` VALUES ('685', 'CU103870819', '156', '1');
INSERT INTO `product` VALUES ('686', 'CU092470258', '156', '1');
INSERT INTO `product` VALUES ('687', 'CU101970260', '156', '1');
INSERT INTO `product` VALUES ('688', '26H001104222', '157', '1');
INSERT INTO `product` VALUES ('689', '26H001104695', '157', '1');
INSERT INTO `product` VALUES ('690', 'URG1DNC', '158', '1');
INSERT INTO `product` VALUES ('691', 'URG1D6U', '158', '1');
INSERT INTO `product` VALUES ('692', 'UMJ08Z4', '158', '1');
INSERT INTO `product` VALUES ('693', 'UMS09QU', '158', '1');
INSERT INTO `product` VALUES ('694', 'UQQ0WG9', '158', '1');
INSERT INTO `product` VALUES ('695', 'URG1JAJ', '158', '1');
INSERT INTO `product` VALUES ('696', 'URG1D8D', '158', '1');
INSERT INTO `product` VALUES ('697', 'USP0JCN', '158', '1');
INSERT INTO `product` VALUES ('698', 'USP0JD1', '158', '1');
INSERT INTO `product` VALUES ('699', 'ECU-1805001', '171', '1');
INSERT INTO `product` VALUES ('700', 'ECU-1805002', '171', '1');
INSERT INTO `product` VALUES ('701', 'S/N', '172', '1');
INSERT INTO `product` VALUES ('702', 'S/N', '170', '1');
INSERT INTO `product` VALUES ('703', 'ECU-1805003', '171', '1');
INSERT INTO `product` VALUES ('704', 'ECU-1805004', '171', '1');
INSERT INTO `product` VALUES ('705', 'ECU-1805005', '171', '1');
INSERT INTO `product` VALUES ('706', 'ECU-1805006', '171', '1');
INSERT INTO `product` VALUES ('707', 'ECU-1805007', '171', '1');
INSERT INTO `product` VALUES ('708', 'ECU-1805008', '171', '1');
INSERT INTO `product` VALUES ('709', 'ECU-1805010', '171', '1');
INSERT INTO `product` VALUES ('710', 'ECU-1805009', '171', '1');
INSERT INTO `product` VALUES ('711', 'ECU-1805029', '171', '1');
INSERT INTO `product` VALUES ('712', 'ECU-1805030', '171', '1');
INSERT INTO `product` VALUES ('713', 'ECU-1805031', '171', '1');
INSERT INTO `product` VALUES ('714', 'ECU-1805032', '171', '1');
INSERT INTO `product` VALUES ('715', 'ECU-1805033', '171', '1');
INSERT INTO `product` VALUES ('716', 'ECU-1805034', '171', '1');
INSERT INTO `product` VALUES ('717', 'ECU-1805035', '171', '1');
INSERT INTO `product` VALUES ('718', 'ECU-1805026', '171', '1');
INSERT INTO `product` VALUES ('719', 'ECU-1805015', '171', '1');
INSERT INTO `product` VALUES ('720', 'ECU-1805014', '171', '1');
INSERT INTO `product` VALUES ('721', 'ECU-1805013', '171', '1');
INSERT INTO `product` VALUES ('722', 'ECU-1805011', '171', '1');
INSERT INTO `product` VALUES ('723', 'ECU-1805017', '171', '1');
INSERT INTO `product` VALUES ('724', 'ECU-1805028', '171', '1');
INSERT INTO `product` VALUES ('725', 'ECU-1805018', '171', '1');
INSERT INTO `product` VALUES ('726', 'ECU-1805027', '171', '1');
INSERT INTO `product` VALUES ('727', 'ECU-1805019', '171', '1');
INSERT INTO `product` VALUES ('728', 'ECU-1805020', '171', '1');
INSERT INTO `product` VALUES ('729', 'ECU-1805021', '171', '1');
INSERT INTO `product` VALUES ('730', 'ECU-1805022', '171', '1');
INSERT INTO `product` VALUES ('731', 'ECU-1805023', '171', '1');
INSERT INTO `product` VALUES ('732', 'ECU-1805024', '171', '1');
INSERT INTO `product` VALUES ('733', 'ECU-1805025', '171', '1');
INSERT INTO `product` VALUES ('734', 'ECU-1805016', '171', '1');
INSERT INTO `product` VALUES ('735', 'ECU-1805012', '171', '1');
INSERT INTO `product` VALUES ('736', 'ECU-1805041', '171', '1');
INSERT INTO `product` VALUES ('737', 'ECU-1805040', '171', '1');
INSERT INTO `product` VALUES ('738', 'ECU-1805039', '171', '1');
INSERT INTO `product` VALUES ('739', 'ECU-1805038', '171', '1');
INSERT INTO `product` VALUES ('740', 'ECU-1805052', '171', '1');
INSERT INTO `product` VALUES ('741', 'ECU-1805042', '171', '1');
INSERT INTO `product` VALUES ('742', 'ECU-1805047', '171', '1');
INSERT INTO `product` VALUES ('743', 'ECU-1805044', '171', '1');
INSERT INTO `product` VALUES ('744', 'ECU-1805048', '171', '1');
INSERT INTO `product` VALUES ('745', 'ECU-1805049', '171', '1');
INSERT INTO `product` VALUES ('746', 'ECU-1805051', '171', '1');
INSERT INTO `product` VALUES ('747', 'ECU-1805053', '171', '1');
INSERT INTO `product` VALUES ('748', 'ECU-1805054', '171', '1');
INSERT INTO `product` VALUES ('749', 'ECU-1805055', '171', '1');
INSERT INTO `product` VALUES ('750', 'ECU-1805050', '171', '1');
INSERT INTO `product` VALUES ('751', 'ECU-1805045', '171', '1');
INSERT INTO `product` VALUES ('752', 'ECU-1805036', '171', '1');
INSERT INTO `product` VALUES ('753', 'ECU-1805037', '171', '1');
INSERT INTO `product` VALUES ('754', 'ECU-1805043', '171', '1');
INSERT INTO `product` VALUES ('755', 'ECU-1805046', '171', '1');
INSERT INTO `product` VALUES ('756', 'ECU-1805056', '171', '1');
INSERT INTO `product` VALUES ('757', 'ECU-1805057', '171', '1');
INSERT INTO `product` VALUES ('758', 'ECU-1805058', '171', '1');
INSERT INTO `product` VALUES ('760', 'ECU-1805059', '171', '1');
INSERT INTO `product` VALUES ('761', 'ECU-1805060', '171', '1');
INSERT INTO `product` VALUES ('762', 'ECU-1805061', '171', '1');
INSERT INTO `product` VALUES ('763', 'ECU-1805062', '171', '1');
INSERT INTO `product` VALUES ('764', 'ECU-1805063', '171', '1');
INSERT INTO `product` VALUES ('765', 'ECU-1805065', '171', '1');
INSERT INTO `product` VALUES ('766', 'ECU-1805064', '171', '1');
INSERT INTO `product` VALUES ('767', 'ECU-1805066', '171', '1');
INSERT INTO `product` VALUES ('768', 'ECU-1805067', '171', '1');
INSERT INTO `product` VALUES ('769', 'ECU-1805068', '171', '1');
INSERT INTO `product` VALUES ('770', 'ECU-1805069', '171', '1');
INSERT INTO `product` VALUES ('771', 'ECU-1805070', '171', '1');
INSERT INTO `product` VALUES ('772', 'ECU-1805072', '171', '1');
INSERT INTO `product` VALUES ('773', 'ECU-1805071', '171', '1');
INSERT INTO `product` VALUES ('774', 'ECU-1805073', '171', '1');
INSERT INTO `product` VALUES ('775', 'ECU-1805074', '171', '1');
INSERT INTO `product` VALUES ('776', 'ECU-1805075', '171', '1');
INSERT INTO `product` VALUES ('777', 'ECU-1805076', '171', '1');
INSERT INTO `product` VALUES ('778', 'ECU-1805077', '171', '1');
INSERT INTO `product` VALUES ('779', 'ECU-1805078', '171', '1');
INSERT INTO `product` VALUES ('780', 'ECU-1805079', '171', '1');
INSERT INTO `product` VALUES ('781', 'ECU-1805080', '171', '1');
INSERT INTO `product` VALUES ('782', 'ECU-1805081', '171', '1');
INSERT INTO `product` VALUES ('783', 'ECU-1805082', '171', '1');
INSERT INTO `product` VALUES ('784', 'ECU-1805083', '171', '1');
INSERT INTO `product` VALUES ('785', 'ECU-1805084', '171', '1');
INSERT INTO `product` VALUES ('786', 'ECU-1805085', '171', '1');
INSERT INTO `product` VALUES ('787', 'ECU-1805086', '171', '1');
INSERT INTO `product` VALUES ('788', 'ECU-1805087', '171', '1');
INSERT INTO `product` VALUES ('789', 'ECU-1805088', '171', '1');
INSERT INTO `product` VALUES ('790', 'ECU-1805089', '171', '1');
INSERT INTO `product` VALUES ('791', 'ECU-1805090', '171', '1');
INSERT INTO `product` VALUES ('792', 'ECU-1805091', '171', '1');
INSERT INTO `product` VALUES ('793', 'ECU-1805092', '171', '1');
INSERT INTO `product` VALUES ('794', 'ECU-1805093', '171', '1');
INSERT INTO `product` VALUES ('795', 'ECU-1805094', '171', '1');
INSERT INTO `product` VALUES ('796', 'ECU-1805096', '171', '1');
INSERT INTO `product` VALUES ('797', 'ECU-1805095', '171', '1');
INSERT INTO `product` VALUES ('798', 'ECU-1805097', '171', '1');
INSERT INTO `product` VALUES ('799', 'ECU-1805098', '171', '1');
INSERT INTO `product` VALUES ('800', 'ECU-1805099', '171', '1');
INSERT INTO `product` VALUES ('801', 'ECU-1805100', '171', '1');
INSERT INTO `product` VALUES ('803', 'NS063450075', '173', '1');
INSERT INTO `product` VALUES ('804', 'NS093264561', '174', '1');
INSERT INTO `product` VALUES ('805', 'NS093264553', '174', '1');
INSERT INTO `product` VALUES ('806', '1751002QOM', '178', '1');
INSERT INTO `product` VALUES ('807', '1751002QOJ', '178', '1');
INSERT INTO `product` VALUES ('808', '1751002QOH', '178', '1');
INSERT INTO `product` VALUES ('809', '1751002QWF', '178', '1');
INSERT INTO `product` VALUES ('810', '1751002QOK', '178', '1');
INSERT INTO `product` VALUES ('811', '1751002QWB', '178', '1');
INSERT INTO `product` VALUES ('812', '1751002QOE', '178', '1');
INSERT INTO `product` VALUES ('813', '1751002QWD', '178', '1');
INSERT INTO `product` VALUES ('814', '1751002QOD', '178', '1');
INSERT INTO `product` VALUES ('815', '1751002QWE', '178', '1');
INSERT INTO `product` VALUES ('816', '1751002QOL', '178', '1');
INSERT INTO `product` VALUES ('817', '1751002QWA', '178', '1');
INSERT INTO `product` VALUES ('818', '1751002QOF', '178', '1');
INSERT INTO `product` VALUES ('819', '1751002QOI', '178', '1');
INSERT INTO `product` VALUES ('820', '1751002QOG', '178', '1');
INSERT INTO `product` VALUES ('821', '1751002QOR', '178', '1');
INSERT INTO `product` VALUES ('822', '1751002QWI', '178', '1');
INSERT INTO `product` VALUES ('823', '1751002QW7', '178', '1');
INSERT INTO `product` VALUES ('824', '1751002QOP', '178', '1');
INSERT INTO `product` VALUES ('825', '1751002QON', '178', '1');
INSERT INTO `product` VALUES ('826', '1751002QOQ', '178', '1');
INSERT INTO `product` VALUES ('827', '1751002QWH', '178', '1');
INSERT INTO `product` VALUES ('828', '1751002QW3', '178', '1');
INSERT INTO `product` VALUES ('829', '1751002QOW', '178', '1');
INSERT INTO `product` VALUES ('830', '1751002QOT', '178', '1');
INSERT INTO `product` VALUES ('831', '1751002QWG', '178', '1');
INSERT INTO `product` VALUES ('832', '1751002QWJ', '178', '1');
INSERT INTO `product` VALUES ('833', '1751002QOU', '178', '1');
INSERT INTO `product` VALUES ('834', '1751002QOS', '178', '1');
INSERT INTO `product` VALUES ('835', '1751002QOV', '178', '1');
INSERT INTO `product` VALUES ('836', '1751002QOZ', '178', '1');
INSERT INTO `product` VALUES ('837', '1751002QP1', '178', '1');
INSERT INTO `product` VALUES ('838', '1751002QWM', '178', '1');
INSERT INTO `product` VALUES ('839', '1751002QWN', '178', '1');
INSERT INTO `product` VALUES ('840', '1751002QWK', '178', '1');
INSERT INTO `product` VALUES ('841', '1751002QOY', '178', '1');
INSERT INTO `product` VALUES ('842', '1751002QWO', '178', '1');
INSERT INTO `product` VALUES ('843', '1751002QWP', '178', '1');
INSERT INTO `product` VALUES ('844', '1751002QP7', '178', '1');
INSERT INTO `product` VALUES ('845', '1751002QP5', '178', '1');
INSERT INTO `product` VALUES ('846', '1751002QP2', '178', '1');
INSERT INTO `product` VALUES ('847', '1751002QP4', '178', '1');
INSERT INTO `product` VALUES ('848', '1751002QWL', '178', '1');
INSERT INTO `product` VALUES ('849', '1751002QP3', '178', '1');
INSERT INTO `product` VALUES ('850', '1751002QOX', '178', '1');
INSERT INTO `product` VALUES ('851', '1751002QWW', '178', '1');
INSERT INTO `product` VALUES ('852', '1751002QWU', '178', '1');
INSERT INTO `product` VALUES ('853', '1751002QWV', '178', '1');
INSERT INTO `product` VALUES ('854', '1751002QP6', '178', '1');
INSERT INTO `product` VALUES ('855', '1751002QP9', '178', '1');
INSERT INTO `product` VALUES ('856', '1751002QP0', '178', '1');
INSERT INTO `product` VALUES ('857', '1751002QWR', '178', '1');
INSERT INTO `product` VALUES ('858', '1751002QPC', '178', '1');
INSERT INTO `product` VALUES ('859', '1751002QPD', '178', '1');
INSERT INTO `product` VALUES ('860', '1751002QPA', '178', '1');
INSERT INTO `product` VALUES ('861', '1751002QWQ', '178', '1');
INSERT INTO `product` VALUES ('862', '1751002QWS', '178', '1');
INSERT INTO `product` VALUES ('863', '1751002QWT', '178', '1');
INSERT INTO `product` VALUES ('864', '1751002QP8', '178', '1');
INSERT INTO `product` VALUES ('865', '1751002QPB', '178', '1');
INSERT INTO `product` VALUES ('866', '1751002QPG', '178', '1');
INSERT INTO `product` VALUES ('867', '1751002QPF', '178', '1');
INSERT INTO `product` VALUES ('868', '1751002QPH', '178', '1');
INSERT INTO `product` VALUES ('869', '1751002QPL', '178', '1');
INSERT INTO `product` VALUES ('870', '1751002QPI', '178', '1');
INSERT INTO `product` VALUES ('871', '1751002QPJ', '178', '1');
INSERT INTO `product` VALUES ('872', '1751002QWY', '178', '1');
INSERT INTO `product` VALUES ('873', '1751002QX0', '178', '1');
INSERT INTO `product` VALUES ('874', '1751002QPM', '178', '1');
INSERT INTO `product` VALUES ('875', '1751002QWX', '178', '1');
INSERT INTO `product` VALUES ('876', '1751002QPN', '178', '1');
INSERT INTO `product` VALUES ('877', '1751002QX1', '178', '1');
INSERT INTO `product` VALUES ('878', '1751002QPE', '178', '1');
INSERT INTO `product` VALUES ('879', '1751002QWZ', '178', '1');
INSERT INTO `product` VALUES ('880', '1751002QPK', '178', '1');
INSERT INTO `product` VALUES ('881', '1751002QX2', '178', '1');
INSERT INTO `product` VALUES ('882', '1751002QPX', '178', '1');
INSERT INTO `product` VALUES ('883', '1751002QPQ', '178', '1');
INSERT INTO `product` VALUES ('884', '1751002QPW', '178', '1');
INSERT INTO `product` VALUES ('885', '1751002QPR', '178', '1');
INSERT INTO `product` VALUES ('886', '1751002QPS', '178', '1');
INSERT INTO `product` VALUES ('887', '1751002QPU', '178', '1');
INSERT INTO `product` VALUES ('888', '1751002QPV', '178', '1');
INSERT INTO `product` VALUES ('889', '1751002QX6', '178', '1');
INSERT INTO `product` VALUES ('890', '1751002QPY', '178', '1');
INSERT INTO `product` VALUES ('891', '1751002QX3', '178', '1');
INSERT INTO `product` VALUES ('892', '1751002QPO', '178', '1');
INSERT INTO `product` VALUES ('893', '1751002QX4', '178', '1');
INSERT INTO `product` VALUES ('894', '1751002QPT', '178', '1');
INSERT INTO `product` VALUES ('895', '1751002QPP', '178', '1');
INSERT INTO `product` VALUES ('896', '1751002QQ1', '178', '1');
INSERT INTO `product` VALUES ('897', '1751002QQ7', '178', '1');
INSERT INTO `product` VALUES ('898', '1751002QQ8', '178', '1');
INSERT INTO `product` VALUES ('899', '1751002QQ3', '178', '1');
INSERT INTO `product` VALUES ('900', '1751002QQ2', '178', '1');
INSERT INTO `product` VALUES ('901', '1751002QQ5', '178', '1');
INSERT INTO `product` VALUES ('902', '1751002QQ4', '178', '1');
INSERT INTO `product` VALUES ('903', '1751002QXC', '178', '1');
INSERT INTO `product` VALUES ('904', '1751002QQ0', '178', '1');
INSERT INTO `product` VALUES ('905', '1751002QXA', '178', '1');
INSERT INTO `product` VALUES ('906', '1751002QX7', '178', '1');
INSERT INTO `product` VALUES ('907', '1751002QX8', '178', '1');
INSERT INTO `product` VALUES ('908', '1751002QPZ', '178', '1');
INSERT INTO `product` VALUES ('909', '1751002QQ6', '178', '1');
INSERT INTO `product` VALUES ('910', '1751002QX5', '178', '1');
INSERT INTO `product` VALUES ('911', '1751002QXB', '178', '1');
INSERT INTO `product` VALUES ('912', '1751002QQA', '178', '1');
INSERT INTO `product` VALUES ('913', '1751002QXH', '178', '1');
INSERT INTO `product` VALUES ('914', '1751002QQC', '178', '1');
INSERT INTO `product` VALUES ('915', '1751002QXD', '178', '1');
INSERT INTO `product` VALUES ('916', '1751002QQ9', '178', '1');
INSERT INTO `product` VALUES ('917', '1751002QXE', '178', '1');
INSERT INTO `product` VALUES ('918', '1751002QQE', '178', '1');
INSERT INTO `product` VALUES ('919', '1751002QXF', '178', '1');
INSERT INTO `product` VALUES ('920', '1751002QQG', '178', '1');
INSERT INTO `product` VALUES ('921', '1751002QQB', '178', '1');
INSERT INTO `product` VALUES ('922', '1751002QQD', '178', '1');
INSERT INTO `product` VALUES ('923', '1751002QXI', '178', '1');
INSERT INTO `product` VALUES ('924', '1751002QXK', '178', '1');
INSERT INTO `product` VALUES ('925', '1751002QXG', '178', '1');
INSERT INTO `product` VALUES ('926', '1751002QXM', '178', '1');
INSERT INTO `product` VALUES ('927', '1751002QQM', '178', '1');
INSERT INTO `product` VALUES ('928', '1751002QXP', '178', '1');
INSERT INTO `product` VALUES ('929', '1751002QXL', '178', '1');
INSERT INTO `product` VALUES ('930', '1751002QQJ', '178', '1');
INSERT INTO `product` VALUES ('931', '1751002QQH', '178', '1');
INSERT INTO `product` VALUES ('932', '1751002QQL', '178', '1');
INSERT INTO `product` VALUES ('933', '1751002QQI', '178', '1');
INSERT INTO `product` VALUES ('934', '1751002QXQ', '178', '1');
INSERT INTO `product` VALUES ('935', '1751002QXO', '178', '1');
INSERT INTO `product` VALUES ('936', '1751002QQN', '178', '1');
INSERT INTO `product` VALUES ('937', '1751002QXN', '178', '1');
INSERT INTO `product` VALUES ('938', '1751002QQF', '178', '1');
INSERT INTO `product` VALUES ('939', '1751002QQK', '178', '1');
INSERT INTO `product` VALUES ('940', '1751002QXJ', '178', '1');
INSERT INTO `product` VALUES ('941', '1751002QXS', '178', '1');
INSERT INTO `product` VALUES ('942', '1751002QQP', '178', '1');
INSERT INTO `product` VALUES ('943', '1751002QQW', '178', '1');
INSERT INTO `product` VALUES ('944', '1751002QR2', '178', '1');
INSERT INTO `product` VALUES ('945', '1751002QXT', '178', '1');
INSERT INTO `product` VALUES ('946', '1751002QQO', '178', '1');
INSERT INTO `product` VALUES ('947', '1751002QXR', '178', '1');
INSERT INTO `product` VALUES ('948', '1751002QQS', '178', '1');
INSERT INTO `product` VALUES ('949', '1751002QQT', '178', '1');
INSERT INTO `product` VALUES ('950', '1751002QQQ', '178', '1');
INSERT INTO `product` VALUES ('951', '1751002QQY', '178', '1');
INSERT INTO `product` VALUES ('952', '1751002QQV', '178', '1');
INSERT INTO `product` VALUES ('953', '1751002QQX', '178', '1');
INSERT INTO `product` VALUES ('954', '1751002QQR', '178', '1');
INSERT INTO `product` VALUES ('955', '1751002QQU', '178', '1');
INSERT INTO `product` VALUES ('956', '1747006M6Q', '178', '1');
INSERT INTO `product` VALUES ('957', '1747006M6P', '178', '1');
INSERT INTO `product` VALUES ('958', '1751002RBS', '178', '1');
INSERT INTO `product` VALUES ('959', '1751002RBO', '178', '1');
INSERT INTO `product` VALUES ('960', '1751002RBL', '178', '1');
INSERT INTO `product` VALUES ('961', '1747006L8G', '178', '1');
INSERT INTO `product` VALUES ('962', '1747006L8H', '178', '1');
INSERT INTO `product` VALUES ('963', '1747006M6M', '178', '1');
INSERT INTO `product` VALUES ('964', '1747006M6O', '178', '1');
INSERT INTO `product` VALUES ('965', '1747006M6R', '178', '1');
INSERT INTO `product` VALUES ('966', '1747006M1S', '178', '1');
INSERT INTO `product` VALUES ('967', '1747006L8K', '178', '1');
INSERT INTO `product` VALUES ('968', '1751002RBP', '178', '1');
INSERT INTO `product` VALUES ('969', '1751002RBR', '178', '1');
INSERT INTO `product` VALUES ('970', '1747006M1J', '178', '1');
INSERT INTO `product` VALUES ('971', '1747006M1M', '178', '1');
INSERT INTO `product` VALUES ('972', '1751002RBM', '178', '1');
INSERT INTO `product` VALUES ('973', '1751002RBK', '178', '1');
INSERT INTO `product` VALUES ('974', '1747006M1R', '178', '1');
INSERT INTO `product` VALUES ('975', '1747006L8D', '178', '1');
INSERT INTO `product` VALUES ('976', '1747006M1L', '178', '1');
INSERT INTO `product` VALUES ('977', '1751002RJL', '178', '1');
INSERT INTO `product` VALUES ('978', '1752002RBQ', '178', '1');
INSERT INTO `product` VALUES ('979', '1751002RBN', '178', '1');
INSERT INTO `product` VALUES ('980', '1747006M1I', '178', '1');
INSERT INTO `product` VALUES ('981', '1747006M1K', '178', '1');
INSERT INTO `product` VALUES ('982', '1747006L8E', '178', '1');
INSERT INTO `product` VALUES ('983', '1747006M1N', '178', '1');
INSERT INTO `product` VALUES ('984', '1747006L81', '178', '1');
INSERT INTO `product` VALUES ('985', '1747006M1D', '178', '1');
INSERT INTO `product` VALUES ('986', '1747006L8B', '178', '1');
INSERT INTO `product` VALUES ('987', '1747006M1G', '178', '1');
INSERT INTO `product` VALUES ('988', '1747006L8A', '178', '1');
INSERT INTO `product` VALUES ('989', '1747006M1H', '178', '1');
INSERT INTO `product` VALUES ('990', '1747006M1C', '178', '1');
INSERT INTO `product` VALUES ('991', '1747006L87', '178', '1');
INSERT INTO `product` VALUES ('992', '1747006M1E', '178', '1');
INSERT INTO `product` VALUES ('993', '1747006L88', '178', '1');
INSERT INTO `product` VALUES ('994', '1747006L8C', '178', '1');
INSERT INTO `product` VALUES ('995', '1747006M19', '178', '1');
INSERT INTO `product` VALUES ('996', '1747006M1B', '178', '1');
INSERT INTO `product` VALUES ('997', '1747006L86', '178', '1');
INSERT INTO `product` VALUES ('998', '1747006M1F', '178', '1');
INSERT INTO `product` VALUES ('999', '1747006L8F', '178', '1');
INSERT INTO `product` VALUES ('1000', 'NS102761749', '78', '1');
INSERT INTO `product` VALUES ('1001', 'NS102668389', '78', '1');
INSERT INTO `product` VALUES ('1002', 'NS064552042', '173', '1');
INSERT INTO `product` VALUES ('1003', 'NS093461587', '79', '1');
INSERT INTO `product` VALUES ('1004', '14T403700064', '183', '1');
INSERT INTO `product` VALUES ('1005', '14T403700069', '183', '1');
INSERT INTO `product` VALUES ('1006', '14T403700067', '183', '1');
INSERT INTO `product` VALUES ('1007', '14T403700066', '183', '1');
INSERT INTO `product` VALUES ('1008', 'NS112669027', '16', '1');
INSERT INTO `product` VALUES ('1009', 'NS122761296', '20', '1');
INSERT INTO `product` VALUES ('1010', 'NS11256A086', '20', '1');
INSERT INTO `product` VALUES ('1011', 'NS112568830', '20', '1');
INSERT INTO `product` VALUES ('1012', 'NS11326A222', '15', '1');
INSERT INTO `product` VALUES ('1013', 'NS11326A341', '15', '1');
INSERT INTO `product` VALUES ('1014', 'NS102866512', '53', '1');
INSERT INTO `product` VALUES ('1015', 'NS1444F1027', '179', '1');
INSERT INTO `product` VALUES ('1016', 'NS112467772', '180', '1');
INSERT INTO `product` VALUES ('1017', 'PME41R7', '181', '1');
INSERT INTO `product` VALUES ('1018', 'PNQ5PDM', '182', '1');
INSERT INTO `product` VALUES ('1019', 'PMR512W', '182', '1');
INSERT INTO `product` VALUES ('1020', 'D7K2017707', '143', '1');
INSERT INTO `product` VALUES ('1021', 'B9S2004688', '142', '1');
INSERT INTO `product` VALUES ('1022', 'B9R2003745', '142', '1');
INSERT INTO `product` VALUES ('1023', 'B9O2008622', '142', '1');
INSERT INTO `product` VALUES ('1024', 'B9O2007432', '142', '1');
INSERT INTO `product` VALUES ('1025', '08T402900174', '144', '1');
INSERT INTO `product` VALUES ('1026', 'B9H2009233', '142', '1');
INSERT INTO `product` VALUES ('1027', 'B9S2005690', '142', '1');
INSERT INTO `product` VALUES ('1028', 'D882008641', '142', '1');
INSERT INTO `product` VALUES ('1029', '06T402904785', '144', '1');
INSERT INTO `product` VALUES ('1030', 'B9I2017667', '142', '1');
INSERT INTO `product` VALUES ('1031', 'B9K2007967', '142', '1');
INSERT INTO `product` VALUES ('1032', '73T075400604', '148', '1');
INSERT INTO `product` VALUES ('1033', '73T075400619', '148', '1');
INSERT INTO `product` VALUES ('1034', '73T075400606', '148', '1');
INSERT INTO `product` VALUES ('1035', '73T075400618', '148', '1');
INSERT INTO `product` VALUES ('1036', '73T075400617', '148', '1');
INSERT INTO `product` VALUES ('1037', '73T075400620', '148', '1');
INSERT INTO `product` VALUES ('1038', '9XE788N00548', '149', '1');
INSERT INTO `product` VALUES ('1039', 'GDL2006204', '150', '1');
INSERT INTO `product` VALUES ('1040', 'GDL2006446', '150', '1');
INSERT INTO `product` VALUES ('1041', 'URG1GTW', '158', '1');
INSERT INTO `product` VALUES ('1042', 'URH00CJ', '158', '1');
INSERT INTO `product` VALUES ('1043', 'URG1GY5', '158', '1');
INSERT INTO `product` VALUES ('1044', 'UL2040T', '158', '1');
INSERT INTO `product` VALUES ('1045', 'NS095164378', '84', '1');
INSERT INTO `product` VALUES ('1046', 'NS1310F0198', '184', '1');
INSERT INTO `product` VALUES ('1047', 'NS1652S0184', '185', '1');
INSERT INTO `product` VALUES ('1048', 'NS063450079', '173', '1');
INSERT INTO `product` VALUES ('1049', 'NS093063591', '79', '1');
INSERT INTO `product` VALUES ('1050', 'NS063350800', '173', '1');

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `address` text,
  `phone` varchar(40) DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('1', '', 'ANGELA RIOS', null, '', null, null, null, 'PANALPINA');
INSERT INTO `provider` VALUES ('2', '', 'SANTIAGO PEREZ', null, '', null, null, null, 'CINETO');
INSERT INTO `provider` VALUES ('4', '', 'PEDRO APARICIO', null, '', null, null, null, 'DINALINK');
INSERT INTO `provider` VALUES ('5', '', 'CRISTIAN MONTENEGRO', null, '', null, null, null, 'CNT EP');
INSERT INTO `provider` VALUES ('6', '', 'MARIBEL HERRERA', null, '', null, null, null, 'CNT EP');
INSERT INTO `provider` VALUES ('7', '', 'NOKIA', null, '', null, null, null, 'NOKIA');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `password` text,
  `valid` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ukusername` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'WILLIAM', 'ROMERO', 'wromero', 'wromero@cineto.net', '1', '1', '$2a$08$UpOlBw/anCC0zgGjkL3Au.hrK5A8hAK4XGOojssoG5BS7SbVyFgeq', null);
INSERT INTO `user` VALUES ('38', 'GABRIEL', 'SALAZAR', 'gsalazar', 'gabrielsalazar@outlook.com', '1', '1', '$2a$08$FqghaL7FjN.EOQd3YdxXGeTk6hG9ClGCE08KMAdrFmWD42hlZRRN2', null);
INSERT INTO `user` VALUES ('40', 'SANTIAGO', 'PÉREZ', 'sperez', 'sperez', '1', '1', '$2a$08$hjq9sAJj.fA5JrjlfmO.b.Qx/aSYtE3K9d274tq29qiBu.1WGlOEy', null);
INSERT INTO `user` VALUES ('42', 'CINETO', 'TELECOMUNICACIONES', 'cineto', 'info@cineto.net', '1', '1', '$2a$08$qP8zyzLTOYW4N4MCJrXZgO9lCQUCA47CMUf91teGG37BzGJEv8jbO', null);
INSERT INTO `user` VALUES ('43', 'ALEX', 'CATUCUAMBA', 'acatucuamba', 'acatucuamba@cineto.net', '1', '1', '$2a$08$o135fvwYAbsF/bgSd/Mx4.gsnHIgPJglRaZj.S/1WomuaKSn/2S4i', null);
INSERT INTO `user` VALUES ('44', 'MIGUEL', 'TUPIZA', 'mtupiza', 'mtupiza@cineto.net', '1', '1', '$2a$08$isZdxqjnpE0CYATsKTTbMOn9SrK5U1HLEb2ccUx4AGrNFw/j7xZKy', null);
INSERT INTO `user` VALUES ('46', 'SANTIAGO', 'REYES', 'sreyes', 'sreyes@cineto.net', '1', '2', '$2a$08$rBXHYV3YXV1ETpiJrsfyWudSv82/37GQy0Hl6dmOMJAwW9d2QBHq.', null);
INSERT INTO `user` VALUES ('51', 'SANTIAGO', 'REYES', 'sreyesro', 'sreyes@cineto.net', '1', '1', '$2a$08$UyQxAUJ29oNz/CwmZug55O0IutXB8eIwu994kXMZtE2IQtiPMGbrG', null);
INSERT INTO `user` VALUES ('52', 'SANTIAGO', 'PÉREZ (ADMIN)', 'sperezadmin', 'sperez@cineto.net', '1', '2', '$2a$08$orylC7LshPVRSXnJd/95pOoPBa8y0idlUu5G6d3PQ2xv3mZpNCoIW', null);

-- ----------------------------
-- View structure for v_allbill
-- ----------------------------
DROP VIEW IF EXISTS `v_allbill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_allbill` AS SELECT
	id,
	provider,
	document,
	date,
	reference,
	`user`,
	state,
	client,
	type,
	(
		SELECT
			CONCAT('ACT',
				
				'-',

			IF (codigo.type = 1, 'ING', 'ENT'),
			'-',
codigo.`year`,'-',
			LPAD(codigo.id, 4, 0)
			)
		FROM
			codigo
		WHERE
			bill = bill.id
		LIMIT 1
	) AS codigo
FROM
	bill ; ;

-- ----------------------------
-- View structure for v_billdetail
-- ----------------------------
DROP VIEW IF EXISTS `v_billdetail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_billdetail` AS SELECT
billdetail.id,
IFNULL(billdetail.fdr,'') AS fdr,
IFNULL(billdetail.cso,'') AS cso,
IFNULL(billdetail.wbs,'') AS wbs,
location.id AS location,
location.`name` AS location2,
product.barcode,
model.id AS `code`,
model.`code` AS code2,
model.description,
category.`name` AS category,
product.id as idproduct,
IFNULL(brand.`name`,'') AS brand,
billdetail.bill,
IFNULL(billdetail.`comment`,'') AS `comment`,
billdetail.area,
billdetail.contrato,
billdetail.cant,
billdetail.price,
(SELECT CONCAT('ACT-',IF(codigo.type=1,'ING-', 'ENT-'),codigo.`year`,'-', codigo.id) FROM codigo WHERE codigo.bill= billdetail.bill LIMIT 1 ) as numero
FROM
billdetail
LEFT JOIN location ON billdetail.location = location.id
LEFT JOIN product ON billdetail.product = product.id
LEFT JOIN model ON product.model = model.id
LEFT JOIN category ON model.category = category.id
LEFT JOIN brand ON model.brand = brand.id
ORDER BY billdetail.id DESC ; ;

-- ----------------------------
-- View structure for v_brand
-- ----------------------------
DROP VIEW IF EXISTS `v_brand`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_brand` AS select `brand`.`id` AS `value`,`brand`.`name` AS `text` from `brand` ; ;

-- ----------------------------
-- View structure for v_category
-- ----------------------------
DROP VIEW IF EXISTS `v_category`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_category` AS select `category`.`id` AS `value`,`category`.`name` AS `text` from `category` ; ;

-- ----------------------------
-- View structure for v_client
-- ----------------------------
DROP VIEW IF EXISTS `v_client`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_client` AS select `client`.`id` AS `value`,CONCAT(`client`.`name`,' - ',client.company) AS `text`,`client`.`dni` AS `dni`,`client`.`address` AS `address`,`client`.`phone` AS `phone`,`client`.`email` AS `email` from `client` ; ;

-- ----------------------------
-- View structure for v_etiquetas
-- ----------------------------
DROP VIEW IF EXISTS `v_etiquetas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_etiquetas` AS SELECT
	`code`,
	description,
idprod,
	barcode,
	enbodega,
(SELECT location FROM v_historico WHERE product=idprod AND type=1 ORDER BY v_historico.date desc LIMIT 1 ) as location2,
(SELECT date FROM v_historico WHERE product=idprod AND type=1 ORDER BY v_historico.date desc LIMIT 1 ) as date
FROM
	v_existencias
WHERE
	enbodega <> 0 ;

-- ----------------------------
-- View structure for v_existencias
-- ----------------------------
DROP VIEW IF EXISTS `v_existencias`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_existencias` AS SELECT
product.id, 
product.id as idprod,
product.barcode,
model.`code`,
model.description,
category.`name` as category,
brand.`name` as brand,
IFNULL((SELECT SUM(billdetail.cant) FROM billdetail INNER JOIN bill on bill.id= billdetail.bill WHERE bill.type=1 AND billdetail.product= product.id),0) as counting,
IFNULL((SELECT SUM(billdetail.cant) FROM billdetail INNER JOIN bill on bill.id= billdetail.bill WHERE bill.type=2 AND billdetail.product= product.id),0) as countegs,
(SELECT counting-countegs) as enbodega,
IF((MOD( (SELECT counting-countegs),2)),'EN BODEGA', 'ENTREGADO') as estado
FROM
product

INNER JOIN model ON product.model = model.id
INNER JOIN category ON model.category = category.id
INNER JOIN brand ON model.brand = brand.id ;

-- ----------------------------
-- View structure for v_existenciascontrato
-- ----------------------------
DROP VIEW IF EXISTS `v_existenciascontrato`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%`  VIEW `v_existenciascontrato` AS SELECT
	`code`,
product as idprod,
	barcode,
	contrato,
	type2,
	brand,
category,
IFNULL((IF(type=1,SUM(v_historico.cant), -SUM(v_historico.cant ))),0) as total
FROM
	v_historico
GROUP BY
	product,
	contrato,
	type2 ;

-- ----------------------------
-- View structure for v_historico
-- ----------------------------
DROP VIEW IF EXISTS `v_historico`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_historico` AS SELECT
billdetail.id AS id,
IFNULL(billdetail.fdr,'') AS fdr,
IFNULL(billdetail.cso,'') AS cso,
IFNULL(billdetail.wbs,'') AS wbs,
IFNULL(billdetail.cant,0) AS cant,
IFNULL(billdetail.area,'') AS area,
IFNULL(billdetail.contrato,'') AS contrato,
IFNULL(bill.date,'') AS date,
IFNULL(bill.reference,'') AS reference,
bill.type AS type,
IF(bill.type=1, 'INGRESO', 'SALIDA') AS type2,
IFNULL(billdetail.`comment`,'') AS `comment`,
product.barcode AS barcode,
model.`code` AS `code`,
model.description AS description,
IFNULL(brand.`name`,' ') AS brand,
IFNULL(category.`id`,'') AS categoryid,
IFNULL(category.`name`,'') AS category,
IFNULL(provider.`name`,'') AS `name`,
IFNULL(provider.company,'') AS company,
IFNULL(client.`name`,'') AS client,
IFNULL(client.company,'') AS clientcompany,
IFNULL(product.id,'') AS product,
IFNULL(location.`name`,'') as location,
CONCAT(`user`.`name`,' ', `user`.lastname) as user,
(SELECT CONCAT('ACT-',IF(codigo.type=1,'ING-', 'ENT-'),codigo.`year`,'-', LPAD(codigo.id,4,'0')) FROM codigo WHERE codigo.bill= billdetail.bill LIMIT 1 ) as numero
FROM
(((((((billdetail
LEFT JOIN bill ON ((billdetail.bill = bill.id)))
LEFT JOIN product ON ((billdetail.product = product.id)))
LEFT JOIN model ON ((product.model = model.id)))
LEFT JOIN brand ON ((model.brand = brand.id)))
LEFT JOIN category ON ((model.category = category.id)))
LEFT JOIN provider ON ((provider.id = bill.provider)))
LEFT JOIN client ON ((client.id = bill.client)))
LEFT JOIN location ON billdetail.location = location.id
INNER JOIN `user` ON bill.`user` = `user`.id
order by `bill`.`date` desc ; ;

-- ----------------------------
-- View structure for v_historico2
-- ----------------------------
DROP VIEW IF EXISTS `v_historico2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_historico2` AS SELECT
billdetail.id AS id,
IFNULL(billdetail.fdr,'') AS fdr,
IFNULL(billdetail.cso,'') AS cso,
IFNULL(billdetail.wbs,'') AS wbs,
IFNULL(billdetail.`comment`,'') AS `comment`,
IFNULL(bill.date,'') AS date,
IFNULL(bill.reference,'') AS reference,
bill.type AS type,
IF(bill.type=1, 'INGRESO', 'SALIDA') AS type2,
product.barcode AS barcode,
model.`code` AS `code`,
model.description AS description,
IFNULL(brand.`name`,' ') AS brand,
IFNULL(category.`id`,'') AS categoryid,
IFNULL(category.`name`,'') AS category,
IFNULL(provider.`name`,'') AS `name`,
IFNULL(provider.company,'') AS company,
IFNULL(client.`name`,'') AS client,
IFNULL(client.company,'') AS clientcompany,
IFNULL(product.id,'') AS product,
IFNULL(location.`name`,'') as location
FROM
(((((((billdetail
LEFT JOIN bill ON ((billdetail.bill = bill.id)))
LEFT JOIN product ON ((billdetail.product = product.id)))
LEFT JOIN model ON ((product.model = model.id)))
LEFT JOIN brand ON ((model.brand = brand.id)))
LEFT JOIN category ON ((model.category = category.id)))
LEFT JOIN provider ON ((provider.id = bill.provider)))
LEFT JOIN client ON ((client.id = bill.client)))
LEFT JOIN location ON billdetail.location = location.id
order by `billdetail`.`id` desc ; ;

-- ----------------------------
-- View structure for v_historico_copy
-- ----------------------------
DROP VIEW IF EXISTS `v_historico_copy`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_historico_copy` AS SELECT
billdetail.id AS id,
IFNULL(billdetail.fdr,'') AS fdr,
IFNULL(billdetail.cso,'') AS cso,
IFNULL(billdetail.wbs,'') AS wbs,
IFNULL(billdetail.cant,0) AS cant,
IFNULL(billdetail.contrato,'') AS contrato,
IFNULL(bill.date,'') AS date,
IFNULL(bill.reference,'') AS reference,
bill.type AS type,
IF(bill.type=1, 'INGRESO', 'SALIDA') AS type2,
IFNULL(billdetail.`comment`,'') AS `comment`,
product.barcode AS barcode,
model.`code` AS `code`,
model.description AS description,
IFNULL(brand.`name`,' ') AS brand,
IFNULL(category.`id`,'') AS categoryid,
IFNULL(category.`name`,'') AS category,
IFNULL(provider.`name`,'') AS `name`,
IFNULL(provider.company,'') AS company,
IFNULL(client.`name`,'') AS client,
IFNULL(client.company,'') AS clientcompany,
IFNULL(product.id,'') AS product,
IFNULL(location.`name`,'') AS location,
CONCAT(`user`.`name`,' ', `user`.lastname) AS `user`,
(SELECT CONCAT('ACT-',IF(codigo.type=1,'ING-', 'ENT-'),codigo.`year`,'-', LPAD(codigo.id,4,'0')) FROM codigo WHERE codigo.bill= billdetail.bill LIMIT 1 ) AS numero,
bill.provider,
bill.document,
bill.date as date2,
bill.reference as reference2,
bill.`user` as billuser,
bill.client as billclient,
bill.state as billstate,
product.model,
product.state,
model.category as modelcat,
model.price,
model.stockmin,
model.brand as modelbrand,
brand.id as brandid,
brand.`name` as brandname,
category.id as idcategory,
category.`name` as categoryname,
provider.id as providerid,
provider.dni,
provider.`name` as providername,
provider.address,
provider.phone,
provider.email,
provider.createdAt,
provider.updatedAt,
provider.company providercompany,
client.id as clientid,
client.dni as clientdni,
client.`name` as clientname,
client.email as clientemail,
client.phone as clientphone,
client.address as clientaddress,
client.company as clientcompany2,
location.id as locationid,
location.`name` as locationname,
`user`.id as iduser,
`user`.`name` as username,
`user`.lastname as userlastname,
`user`.username as userusername,
`user`.email as useremail,
`user`.`status` as userstatus,
`user`.rol as userrol,
`user`.`password`,
billdetail.bill,
billdetail.area
FROM
(((((((billdetail
LEFT JOIN bill ON ((billdetail.bill = bill.id)))
LEFT JOIN product ON ((billdetail.product = product.id)))
LEFT JOIN model ON ((product.model = model.id)))
LEFT JOIN brand ON ((model.brand = brand.id)))
LEFT JOIN category ON ((model.category = category.id)))
LEFT JOIN provider ON ((provider.id = bill.provider)))
LEFT JOIN client ON ((client.id = bill.client)))
LEFT JOIN location ON billdetail.location = location.id
INNER JOIN `user` ON bill.`user` = `user`.id
order by `bill`.`date` desc ; ;

-- ----------------------------
-- View structure for v_infobill
-- ----------------------------
DROP VIEW IF EXISTS `v_infobill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_infobill` AS SELECT
bill.id AS id,
provider.`name` AS `name`,
date_format(`bill`.`date`,'%d-%m-%Y') AS date,
bill.reference AS reference,
concat(`user`.`name`,' ',`user`.`lastname`) AS `user`,
`user`.id AS iduser,
bill.state AS state,
provider.company,
client.`name` as client,
client.company as clientcompany,
CONCAT('ACT','-',IF(codigo.type=1,'ING','ENT'), '-',codigo.`year`,'-', LPAD(codigo.id,4,0)) as codigo
FROM
((bill
LEFT JOIN provider ON ((bill.provider = provider.id)))
LEFT JOIN `user` ON ((bill.`user` = `user`.id)))
LEFT JOIN client ON bill.client = client.id
LEFT JOIN codigo ON bill.id = codigo.bill ; ;

-- ----------------------------
-- View structure for v_location
-- ----------------------------
DROP VIEW IF EXISTS `v_location`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_location` AS select `location`.`id` AS `value`,`location`.`name` AS `text` from `location` ; ;

-- ----------------------------
-- View structure for v_model
-- ----------------------------
DROP VIEW IF EXISTS `v_model`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_model` AS SELECT
model.id as value,
model.`code` as text
FROM
model ; ;

-- ----------------------------
-- View structure for v_modelbill
-- ----------------------------
DROP VIEW IF EXISTS `v_modelbill`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_modelbill` AS select `model`.`id` AS `id`,concat(`model`.`code`,' - ',`model`.`description`) AS `description` from `model` ; ;

-- ----------------------------
-- View structure for v_modelview
-- ----------------------------
DROP VIEW IF EXISTS `v_modelview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_modelview` AS SELECT
	`model`.`id` AS `id`,
	`model`.`code` AS `code`,
	`model`.`description` AS `description`,
	`model`.`price` AS `price`,
	`model`.`stockmin` AS `stockmin`,
	`model`.`category` AS `category`,
	`model`.`brand` AS `brand`

FROM
	`model` ; ;

-- ----------------------------
-- View structure for v_product
-- ----------------------------
DROP VIEW IF EXISTS `v_product`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_product` AS SELECT
product.id,
product.barcode AS barcode,
model.id AS `code`,
model.description,
category.`name` AS category,
brand.`name` AS brand,
billdetail.fdr,
billdetail.cso,
billdetail.wbs,
bill.date
FROM
product
LEFT JOIN model ON product.model = model.id
LEFT JOIN category ON model.category = category.id
LEFT JOIN brand ON model.brand = brand.id
INNER JOIN billdetail ON billdetail.product = product.id
INNER JOIN bill ON billdetail.bill = bill.id ; ;

-- ----------------------------
-- View structure for v_product2
-- ----------------------------
DROP VIEW IF EXISTS `v_product2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_product2` AS SELECT
product.id,
product.barcode,
model.`code`,
model.description,
category.`name` AS category,
IFNULL(brand.`name`,'') as brand
FROM
product
LEFT JOIN model ON product.model = model.id
LEFT JOIN category ON model.category = category.id
LEFT JOIN brand ON model.brand = brand.id ; ;

-- ----------------------------
-- View structure for v_product3
-- ----------------------------
DROP VIEW IF EXISTS `v_product3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_product3` AS SELECT
product.id,
product.barcode,
model.`id` as code,
model.description,
category.`name` AS category,
IFNULL(brand.`name`,'') as brand
FROM
product
LEFT JOIN model ON product.model = model.id
LEFT JOIN category ON model.category = category.id
LEFT JOIN brand ON model.brand = brand.id ; ;

-- ----------------------------
-- View structure for v_provider
-- ----------------------------
DROP VIEW IF EXISTS `v_provider`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_provider` AS select `provider`.`id` AS `value`,CONCAT(`provider`.`name`,' - ',provider.company) AS `text` from `provider` ; ;

-- ----------------------------
-- View structure for v_sumas
-- ----------------------------
DROP VIEW IF EXISTS `v_sumas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_sumas` AS SELECT
billdetail.`product` as prod,
(SELECT count(*) FROM billdetail INNER JOIN bill on bill.id= billdetail.bill WHERE bill.type=1 AND billdetail.product= prod) as counting,
(SELECT count(*) FROM billdetail INNER JOIN bill on bill.id= billdetail.bill WHERE bill.type=2 AND billdetail.product= prod) as countegs
FROM
billdetail
GROUP BY billdetail.product ; ;

-- ----------------------------
-- View structure for v_totales
-- ----------------------------
DROP VIEW IF EXISTS `v_totales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%`  VIEW `v_totales` AS SELECT
COUNT(*) as count,
product.barcode,
model.`code`
FROM
billdetail
INNER JOIN product ON billdetail.product = product.id
INNER JOIN model ON product.model = model.id
GROUP BY billdetail.product ; ;

-- ----------------------------
-- View structure for v_user
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_user` AS select `user`.`id` AS `value`,concat(`user`.`name`,' ',`user`.`lastname`) AS `text` from `user` ; ;

-- ----------------------------
-- Procedure structure for barcode
-- ----------------------------
DROP PROCEDURE IF EXISTS `barcode`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `barcode`()
BEGIN
	select concat('CIN',year(now()),'',week(now(),0),'','00',((SELECT COUNT(id) FROM aux) + 1)) AS `barcode`;
INSERT INTO aux VALUES();

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for devolution
-- ----------------------------
DROP PROCEDURE IF EXISTS `devolution`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `devolution`(voucher int)
BEGIN
SET @numero=0;
SELECT
	@numero :=@numero + 1 AS num,
	`client`.`name` AS `name`,
	`product`.`barcode` AS `barcode`,
	`model`.`description` AS `description`,
	`model`.`code` AS `code`,
`model`.`id` AS `prueba`,
(SELECT COUNT(id) FROM detaildevolution WHERE prueba=(SELECT variant FROM product WHERE id = detaildevolution.product) AND detaildevolution.devolution=voucher) as count,
	`detaildevolution`.`devolution` AS `voucher`,
	`detaildevolution`.`id` AS `id`,
	`product`.`id` AS `idproduct`,
	IFNULL(`detaildevolution`.`observation`,' ') AS `observation`
FROM
	(
		(
			(
				(
					`detaildevolution`
					LEFT JOIN `voucher` ON (
						(
							`detaildevolution`.`devolution` = `voucher`.`id`
						)
					)
				)
				LEFT JOIN `client` ON (
					(
						`voucher`.`client` = `client`.`id`
					)
				)
			)
			 LEFT JOIN `product` ON (
				(
					`detaildevolution`.`product` = `product`.`id`
				)
			)
		)
		LEFT JOIN `model` ON (
			(
				`product`.`variant` = `model`.`id`
			)
		)
	) WHERE detaildevolution.devolution=voucher;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for prueba
-- ----------------------------
DROP PROCEDURE IF EXISTS `prueba`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba`(voucher int)
BEGIN
SET @numero=0;
SELECT
	@numero :=@numero + 1 AS num,
	`client`.`name` AS `name`,
	`product`.`barcode` AS `barcode`,
	`model`.`description` AS `description`,
	`model`.`code` AS `code`,
`model`.`id` AS `prueba`,
CONCAT('1') as count,
	`detail`.`voucher` AS `voucher`,
	`detail`.`id` AS `id`,
	`product`.`id` AS `idproduct`,
	IFNULL(`detail`.`observation`,' ') AS `observation`
FROM
	(
		(
			(
				(
					`detail`
					LEFT JOIN `voucher` ON (
						(
							`detail`.`voucher` = `voucher`.`id`
						)
					)
				)
				LEFT JOIN `client` ON (
					(
						`voucher`.`client` = `client`.`id`
					)
				)
			)
			 LEFT JOIN `product` ON (
				(
					`detail`.`product` = `product`.`id`
				)
			)
		)
		LEFT JOIN `model` ON (
			(
				`product`.`variant` = `model`.`id`
			)
		)
	) WHERE detail.voucher=voucher;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_bill
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_bill`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_bill`(bill int)
BEGIN
SET @numero=0;
	SELECT
@numero :=@numero + 1 AS num,
	`product`.`id` AS `id`,
	`model`.`id` AS `model`,
	`product`.`barcode` AS `barcode`,
	`model`.`code` AS `code`,
	`model`.`code` AS `Producto`,
`model`.`id` AS `prueba`,
CONCAT('1') as count,
	`model`.`description` AS `description`,
	`product`.`bill` AS `bill`,
	`location`.`name` AS `location`,
location.id as idlocation,
	`category`.`name` AS `category`,
	`brand`.`name` AS `brand`,
	`product`.`price` AS `price`,
IFNULL(`product`.`observation`,' ') AS observation
FROM
	(
		(
			(
				(
					`product`
					JOIN `model` ON (
						(
							`product`.`variant` = `model`.`id`
						)
					)
				)
				LEFT JOIN `location` ON (
					(
						`product`.`location` = `location`.`id`
					)
				)
			)
			LEFT JOIN `category` ON (
				(
					`model`.`category` = `category`.`id`
				)
			)
		)
		LEFT JOIN `brand` ON (
			(
				`model`.`brand` = `brand`.`id`
			)
		)
	) WHERE product.bill=bill ORDER BY product.id DESC;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_billprice
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_billprice`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_billprice`(IN `billent` int)
BEGIN

SELECT
id,
	code2 as code,
code as var,
	barcode,bill,
description,
	FORMAT(price,2) as price,
	(
		SELECT
			COUNT(*)
		FROM
			v_billdetail
		WHERE
			v_billdetail.bill = billent 
		AND v_billdetail.code = var
	) AS cant,

(
		SELECT
			SUM(cant)
		FROM
			v_billdetail
		WHERE
			v_billdetail.bill = billent 
		AND v_billdetail.code = var
	) AS count,

 FORMAT((
		SELECT
			SUM(cant)
		FROM
			v_billdetail
		WHERE
			v_billdetail.bill = billent 
		AND v_billdetail.code = var
	)*price,2) as total



FROM
	v_billdetail
WHERE
	bill = `billent` 
GROUP BY `code`;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_billprice2
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_billprice2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_billprice2`()
BEGIN
	SELECT
model.`code`,
model.description,
product.variant AS var,
product.bill AS bi,
product.bill,
(SELECT COUNT(*) FROM product WHERE product.variant= var AND product.bill=bi AND product.state=0) AS count,
product.price,
model.id,
bill.date,
bill.reference,
((SELECT COUNT(*) FROM product WHERE product.variant= var AND product.bill=bi AND product.state=0)*product.price)as total,
provider.`name`
FROM
product
LEFT JOIN model ON product.variant = model.id
LEFT JOIN bill ON product.bill = bill.id
LEFT JOIN provider ON bill.provider= provider.id
WHERE product.state=0
GROUP BY description, bill, model.code,product.price, product.variant;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for prodasd
-- ----------------------------
DROP FUNCTION IF EXISTS `prodasd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prodasd`(`barcode` text) RETURNS text CHARSET utf8
BEGIN
	DECLARE mensaje text;

IF EXISTS(SELECT id FROM product WHERE barcode=barcode) THEN
SET mensaje = 'hola';
ELSE
SET mensaje = 'chau';
END IF;

	RETURN mensaje;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crearcodigo`;
DELIMITER ;;
CREATE TRIGGER `crearcodigo` AFTER INSERT ON `bill` FOR EACH ROW INSERT INTO `codigo` (`year`, `type`, `bill`) VALUES (year(now()), NEW.type, NEW.id)
;;
DELIMITER ;
