CREATE DATABASE GameStudios;
USE GameStudios;

CREATE table organizacion (
    id_org  INTEGER PRIMARY KEY NOT NULL IDENTITY (0,1),
    nom_org VARCHAR(40)
);

CREATE TABLE tipoCertificado (
    id_tipcert  INTEGER PRIMARY KEY NOT NULL IDENTITY (0,1),
    nom_tipcert VARCHAR(40)
);

CREATE TABLE certificado(
    id_cert   INTEGER PRIMARY KEY NOT NULL IDENTITY (0,1),
    nom_cert  VARCHAR(40),
    id_org    INTEGER NOT NULL FOREIGN KEY  REFERENCES organizacion(id_org),
    init_cert DATE,
    end_cert  DATE,
    desc_cert varchar(max),
    id_tipcert INTEGER NOT NULL FOREIGN KEY REFERENCES tipoCertificado(id_tipcert)

);

CREATE TABLE experiencia(
    id_exp INTEGER PRIMARY KEY NOT NULL IDENTITY (0,1),
    nom_exp VARCHAR(40),
    id_org INTEGER NOT NULL FOREIGN KEY REFERENCES organizacion (id_org),
    init_exp DATE,
    end_exp DATE,
    desc_exp VARCHAR(MAX)
);

CREATE TABLE tipoUsuario(
    id_tipUser INTEGER NOT NULL PRIMARY KEY,
    nom_tipo VARCHAR(20)
);

CREATE TABLE usuario(
    id_usuario INTEGER NOT NULL PRIMARY KEY,
    tip_usuario INTEGER NOT NULL FOREIGN KEY REFERENCES tipoUsuario(id_tipUser),
    nom_usuario VARCHAR(40),
    apes_usuario VARCHAR(40),
    correo_usu VARCHAR(100),
    tel_usu INTEGER,
);

CREATE TABLE cv (
    id_cv INTEGER NOT NULL PRIMARY KEY,
    id_usuario INTEGER NOT NULL FOREIGN KEY REFERENCES usuario (id_usuario),
    id_cert INTEGER NOT NULL FOREIGN KEY REFERENCES certificado (id_cert),
    id_exp INTEGER NOT NULL FOREIGN KEY REFERENCES experiencia (id_exp)
);

CREATE TABLE login(
    id_login INTEGER NOT NULL PRIMARY KEY,
    id_usuario INTEGER NOT NULL FOREIGN KEY REFERENCES usuario (id_usuario),
    pas_usu VARCHAR(50) NOT NULL
);
