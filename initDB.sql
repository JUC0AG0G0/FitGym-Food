-- Utiliser la base de données
USE FitGymFood;

-- Créer la table des droits d'accès
CREATE TABLE Droits (
    idDroit INT PRIMARY KEY,
    nomDroit VARCHAR(50)
);

-- Créer la table des utilisateurs
CREATE TABLE Utilisateurs (
    idUtilisateur INT PRIMARY KEY,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    adresseEmail VARCHAR(100) UNIQUE,
    motDePasse VARCHAR(255),
    idDroit INT,
    FOREIGN KEY (idDroit) REFERENCES Droits(idDroit)
);

-- Insérer les droits
INSERT INTO Droits (idDroit, nomDroit) VALUES (1, 'Administrateur');

-- Insérer l'utilisateur administrateur avec les droits
INSERT INTO Utilisateurs (prenom, nom, adresseEmail, motDePasse, idDroit) 
VALUES ('NomAdmin', 'PrenomAdmin', 'admin@example.com', 'motdepasseadmin', 1);


-- Créer la table des catégories
CREATE TABLE Categories (
    idCategorie INT PRIMARY KEY,
    nomCategorie VARCHAR(50),
    descriptionCategorie TEXT
);

-- Créer la table des produits
CREATE TABLE Produits (
    idProduit INT PRIMARY KEY,
    typeProduit VARCHAR(50),
    prix DECIMAL(10, 2),
    description TEXT,
    note FLOAT,
    idCategorie INT,
    FOREIGN KEY (idCategorie) REFERENCES Categories(idCategorie)
);

-- Créer la table des avis
CREATE TABLE Avis (
    idAvis INT PRIMARY KEY,
    idProduit INT,
    idUtilisateur INT,
    commentaire TEXT,
    note FLOAT,
    FOREIGN KEY (idProduit) REFERENCES Produits(idProduit),
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur)
);
