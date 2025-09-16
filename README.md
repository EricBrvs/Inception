# Projet Inception – École 42

Le projet **Inception** consiste à déployer une **infrastructure web complète** en utilisant uniquement **Docker et Docker Compose** sur une machine virtuelle. L’objectif est de créer un environnement **modulaire, sécurisé et répliquable**, en respectant les bonnes pratiques de conteneurisation et d’orchestration.  

---

## Contenu du repository

Ce projet inclus inclut :  

- **Dockerfiles personnalisés** pour chaque service : NGINX, WordPress (avec php-fpm) et MariaDB.  
- **Volumes Docker** pour stocker les fichiers WordPress et la base de données.  
- **Docker network** pour interconnecter les conteneurs sans utiliser `--link` ou `network: host`.  
- **TLS sécurisé** (TLSv1.2 ou TLSv1.3) pour NGINX, seul point d’entrée de l’infrastructure via le port 443.  
- **Fichier `.env` et Docker secrets** pour la gestion sécurisée des variables d’environnement et mots de passe.  
- **Makefile** pour automatiser la construction des images et le déploiement via `docker-compose.yml`.  

---

## Objectifs pédagogiques et techniques

- Appliquer les **bonnes pratiques Docker** (PID 1, gestion des daemons, restart policies).  
- Gérer un **cluster d’applications interconnectées** avec isolation et volumes persistants.  
- Mettre en place une **infrastructure web sécurisée** et fonctionnelle de bout en bout.  

---
![Schéma architecture](Image_architecture.png)

---

> Ce projet m'a permit de développer ma capacité à concevoir, sécuriser et orchestrer des services web conteneurisés de manière professionnelle, tout en respectant les bonnes pratiques Docker et les contraintes pédagogiques de l’École 42.
