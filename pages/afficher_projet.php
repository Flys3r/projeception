<?php
include 'base.php';

if(!isset($_SESSION)){
    session_start();// Démarrer une session pour l'utilisateur
}

// Récupérer l'ID de l'utilisateur connecté
$id = $_SESSION["Utilisateur_id"];

// Récupérer les données depuis la base de données
$assertion = $conn_bdd->prepare("SELECT titre, description FROM projet WHERE Utilisateur_id = :id");
$assertion->bindParam(':id', $id);
$assertion->execute();
$results = $assertion->fetchAll();

// Afficher les données récupérées
foreach ($results as $row) {
    echo "<p>", $row['titre'], "</p>";
    echo "<p>", $row['description'], "</p>";
}
?>