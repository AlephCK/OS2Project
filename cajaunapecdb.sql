DROP TABLE IF EXISTS tipo_documento;
DROP TABLE IF EXISTS servicio_facturables;
DROP TABLE IF EXISTS forma_pago;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS cliente_tipo;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS tanda_labor;
DROP TABLE IF EXISTS registro_movimiento;
DROP SCHEMA IF EXISTS cajaunapecdb;
CREATE SCHEMA cajaunapecdb;
USE cajaunapecdb;


CREATE TABLE `tipo_documento` (
	`tipo_doc_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tipo_doc_descrip` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Descripcion del Tipo de Documento',
    `tipo_doc_estado` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Estado del Tipo de Documento'

);

CREATE TABLE `servicio_facturable` (
	`servicio_fact_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `servicio_fact_descrip` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Descripcion del Servicio Facturable',
    `servicio_fact_estado` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Estado del Servicio Facturable'
);

CREATE TABLE `forma_pago` (
	`forma_pago_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `forma_pago_descrip` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Descripcion de la Forma de Pago',
    `forma_pago_estado` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Estado de la Forma de Pago'
);


CREATE TABLE `cliente` (
	`cliente_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_nomb` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Nombre',
    `tcliente_id` INT NOT NULL COMMENT 'Cliente_Tipo',
	`Carrera` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Carrera',
    `estado` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Estado',
    CONSTRAINT FOREIGN KEY (`tcliente_id`) REFERENCES `cliente_tipo`(`tcliente_id`)
);

CREATE TABLE `cliente_tipo` (
	`tcliente_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tcliente_nomb` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Nombre'
);


CREATE TABLE `empleado` (
	`emp_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `emp_nomb` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Nombre',
    `cedula` INT NOT NULL COMMENT 'Cliente_Tipo',
	`tanda_labor_id` INT NOT NULL COMMENT 'tanda_labor',
	`fecha_registro` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Estado',
    `estado` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Estado',
    CONSTRAINT FOREIGN KEY (`tanda_labor_id`) REFERENCES `tanda_labor`(`tanda_labor_id`)
);

CREATE TABLE `tanda_labor` (
	`tanda_labor_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tanda_labor_nomb` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Nombre'
);

CREATE TABLE `registro_movimiento` (
	`no_movimiento` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `emp_id` INT NOT NULL COMMENT 'Empleado ID',
    `cliente_id` INT NOT NULL COMMENT 'Cliente ID',
	`servicio_fact_id` INT NOT NULL COMMENT 'Servicio',
	`tipo_doc_id` INT NOT NULL COMMENT 'Tipo Documento',
	`forma_pago_id` INT NOT NULL COMMENT 'Forma Pago',
	`fecha_movimiento` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Fecha Movimiento',
	`monto` FLOAT NOT NULL COMMENT 'Monto',
    `estado` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'Estado',
     CONSTRAINT FOREIGN KEY (`emp_id`) REFERENCES `empleado`(`emp_id`),
	 CONSTRAINT FOREIGN KEY (`cliente_id`) REFERENCES `cliente`(`cliente_id`),
	 CONSTRAINT FOREIGN KEY (`servicio_fact_id`) REFERENCES `servicio_facturable`(`servicio_fact_id`),
     CONSTRAINT FOREIGN KEY (`tipo_doc_id`) REFERENCES `tipo_documento`(`tipo_doc_id`),
     CONSTRAINT FOREIGN KEY (`forma_pago_id`) REFERENCES `forma_pago`(`forma_pago_id`)
);



DROP USER 'root'@'localhost';
CREATE USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
GRANT ALL PRIVILEGES ON cajaunapecdb.* TO 'root'@'localhost';


