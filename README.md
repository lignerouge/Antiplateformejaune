# <img src="hero.png" alt="PlateformeJaune Logo" width="80" valign="middle"> AntiPlateformeJaune

[![Project Status](https://img.shields.io/badge/Status-Actif-red.svg?style=flat-flat&color=9B3A2F)](#)
[![Tech Stack](https://img.shields.io/badge/Tech-HTML5%20%7C%20CSS3%20%7C%20JS-blue.svg?style=flat-flat&color=1f2329)](#)
[![CMS](https://img.shields.io/badge/CMS-Decap%20CMS-orange.svg?style=flat-flat&color=f2c94c)](#)
[![Responsive](https://img.shields.io/badge/Responsive-100%25-brightgreen.svg?style=flat-flat&color=2e7d32)](#)
[![Petition](https://img.shields.io/badge/Petition-Change.org-blue?style=flat-flat&logo=change.org&color=e2543d)](https://www.change.org/p/stoppons-plateforme-jaune)

Site AntiPlateformeJaune , ainsi que les dérives de son dirigeant principal, **Jean Gillot**.

---

## Sommaire

- [Objectifs du Projet](#objectifs-du-projet)
- [Architecture & Technologies](#architecture--technologies)
- [Structure du Projet](#structure-du-projet)
- [Configuration de Decap CMS](#configuration-de-decap-cms)
- [Lancement en Local](#lancement-en-local)
- [Hébergement & Déploiement](#hebergement--deploiement)

---

## Objectifs du Projet

Ce projet documente **6 lignes de faille** majeures entre la théorie révolutionnaire affichée par PlateformeJaune et ses actions concrètes :
1. **Sectarisme organisationnel** (Otto Rühle contredit par un programme fermé).
2. **Soutien à Anti-Tech Resistance (ATR)** (mouvance violente, transphobe et sexiste issue de DGR).
3. **Fascination antidémocratique** (doctrine de minorité auto-mandatée).
4. **Validisme et hostilité à l'immigration** (pathologisation psychiatrique des croyants et opposants, opposition à l'immigration).
5. **Culte de la personnalité** (remplacement de Lénine par Fanny Kaplan).
6. **Harcèlement sexiste ciblé par Jean Gillot** (campagnes contre des militantes comme `@harunoyosei` et `@Laurine_Off_LO`).

Le site intègre également une **pétition Change.org** pour demander la dissolution de la structure et l'exclusion de son dirigeant.

---

## Architecture & Technologies

- **Frontend** : HTML5 sémantique, CSS3 (Variables CSS, Grid, Flexbox, typographie fluide via `clamp()`).
- **Styles** : Fichier externe partagé [style.css](style.css) pour faciliter la création de futures pages.
- **CMS** : [Decap CMS](https://decapcms.org/) (anciennement Netlify CMS) intégré de manière totalement statique pour l'édition d'articles de blog.
- **Authentification** : Netlify Identity Widget pour un accès sécurisé au panneau d'administration.

---

## Structure du Projet

```text
├── admin/
│   ├── config.yml      # Configuration des collections et champs de Decap CMS
│   └── index.html      # Point d'entrée de l'administration du CMS
├── _posts/
│   └── 2026-07-09-...  # Articles de blog enregistrés en Markdown par le CMS
├── hero.png            # Visuel principal du mégaphone enflammé
├── logo.png            # Logo de la marque ENDEOUS en rouge-brun
├── change_org_banner.png # Bannière générée pour la pétition Change.org
├── anti_plateformejaune.html # Page principale du dossier d'enquête
├── blog_template.html  # Modèle HTML partagé pour de futurs articles
├── style.css           # Feuille de style CSS commune
└── README.md           # Ce fichier de documentation
```

---

## Configuration de Decap CMS

Le panneau d'administration est disponible à l'adresse `/admin`.
- **Authentification en production** : Gérée via **Git Gateway** et **Netlify Identity**.
- **Mode local** : Activé par défaut dans [config.yml](admin/config.yml) via `local_backend: true`, permettant d'ajouter et modifier des articles sans connexion Internet ni compte Git en cours de développement.

---

## Lancement en Local

Pour travailler sur le site ou tester l'interface d'administration Decap CMS sur votre machine, la méthode la plus simple et automatisée est d'utiliser **Docker**.

### Lancement avec Docker (Recommandé)

1. Assurez-vous d'avoir Docker et Docker Compose installés.
2. Lancez les conteneurs :
   ```bash
   docker compose up
   ```
3. Ouvrez votre navigateur :
   * Le site est accessible sur : `http://localhost:8000`
   * L'interface d'administration est sur : `http://localhost:8000/admin` (vous pouvez créer/modifier vos articles de blog en direct).

### Lancement sans Docker

Si vous préférez ne pas utiliser Docker, vous devez lancer les deux serveurs manuellement :

1. Démarrez le proxy local de Decap CMS :
   ```bash
   npx decap-cms-proxy server
   ```
2. Démarrez un serveur web local dans le dossier du projet :
   ```bash
   python3 -m http.server 8000
   ```
3. Ouvrez ensuite `http://localhost:8000` pour voir le site et `http://localhost:8000/admin` pour éditer vos articles.

---

## Hébergement & Déploiement

Le site est optimisé pour être déployé gratuitement sur **Netlify** :
1. Connectez votre dépôt GitHub à Netlify.
2. Activez **Identity** dans les paramètres de votre site Netlify.
3. Activez **Git Gateway** (dans *Identity > Services*) pour lier le CMS à votre dépôt GitHub de production.
# Antiplateformejaune
