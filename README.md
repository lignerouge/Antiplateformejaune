# <img src="hero.png" alt="PlateformeJaune Logo" width="80" valign="middle"> ENDEOUS — Contre-Enquête PlateformeJaune

[![Project Status](https://img.shields.io/badge/Status-Actif-red.svg?style=flat-flat&color=9B3A2F)](#)
[![Tech Stack](https://img.shields.io/badge/Tech-HTML5%20%7C%20CSS3%20%7C%20JS-blue.svg?style=flat-flat&color=1f2329)](#)
[![CMS](https://img.shields.io/badge/CMS-Decap%20CMS-orange.svg?style=flat-flat&color=f2c94c)](#)
[![Responsive](https://img.shields.io/badge/Responsive-100%25-brightgreen.svg?style=flat-flat&color=2e7d32)](#)
[![Petition](https://img.shields.io/badge/Petition-Change.org-blue?style=flat-flat&logo=change.org&color=e2543d)](https://www.change.org/p/stoppons-plateforme-jaune)

Dossier d'enquête et de documentation exposant les contradictions politiques et éthiques de l'organisation **PlateformeJaune**, ainsi que les dérives de son dirigeant principal, **Jean Gillot**.

---

## Sommaire

- [Objectifs du Projet](#objectifs-du-projet)
- [Architecture & Technologies](#architecture--technologies)
- [Structure du Projet](#structure-du-projet)
- [Lancement en Local avec Docker](#lancement-en-local-avec-docker)
- [Utiliser le Panneau d'Administration (CMS)](#utiliser-le-panneau-dadministration-cms)
- [Authentification et Sécurité de l'Admin](#authentification-et-sécurité-de-ladmin)
- [Déploiement en ligne sur Netlify](#déploiement-en-ligne-sur-netlify)

---

## Objectifs du Projet

Ce projet documente **6 lignes de faille** majeures entre la théorie révolutionnaire affichée par PlateformeJaune et ses actions concrètes :

1. **Sectarisme organisationnel** (Otto Rühle contredit par un programme fermé).
2. **Soutien à Anti-Tech Resistance (ATR)** (mouvance violente, transphobe et sexiste issue de DGR).
3. **Fascination antidémocratique** (doctrine de minorité auto-mandatée).
4. **Validisme et hostilité à l'immigration** (pathologisation psychiatrique des croyants et opposants, position contre l'immigration).
5. **Culte de la personnalité** (remplacement de Lénine par Fanny Kaplan).
6. **Harcèlement sexiste ciblé par Jean Gillot** (campagnes répétées contre des militantes comme `@harunoyosei` et `@Laurine_Off_LO`).

Le site intègre également une **pétition Change.org** pour demander la dissolution de la structure et l'exclusion de son dirigeant.

---

## Architecture & Technologies

- **Frontend** : HTML5 sémantique, CSS3 (Variables CSS, Grid, Flexbox, typographie fluide via `clamp()`).
- **Styles** : Fichier externe partagé [style.css](style.css) pour faciliter la création de futures pages.
- **CMS** : [Decap CMS](https://decapcms.org/) (anciennement Netlify CMS), intégré de manière statique pour l'édition des articles de blog sans base de données.
- **Authentification** : Netlify Identity Widget pour un accès sécurisé au panneau d'administration en production.
- **Déploiement** : Site statique, compatible avec tout hébergeur (Netlify, GitHub Pages, VPS Nginx).

---

## Structure du Projet

```text
├── admin/
│   ├── config.yml            # Configuration Decap CMS (champs, collections, media)
│   └── index.html            # Point d'entrée du panneau d'administration
├── _posts/
│   └── 2026-07-09-xxx.md     # Articles de blog créés via le CMS (format Markdown)
├── images/
│   └── uploads/              # Photos téléversées via l'interface d'administration
├── hero.png                  # Visuel principal : mégaphone enflammé
├── logo.png                  # Logo rouge-brun ENDEOUS
├── change_org_banner.png     # Bannière pour la pétition Change.org
├── anti_plateformejaune.html # Page principale du dossier d'enquête
├── blog_template.html        # Modèle HTML partagé pour les articles de blog
├── style.css                 # Feuille de style CSS commune à toutes les pages
├── docker-compose.yml        # Configuration Docker (serveur web + proxy CMS)
└── README.md                 # Ce fichier de documentation
```

---

## Lancement en Local avec Docker

Docker permet de lancer le site complet et le panneau d'administration en une seule commande, sans rien installer d'autre sur votre ordinateur (ni Node.js, ni Python, ni Nginx).

### Etape 1 — Installer Docker

Si Docker n'est pas encore installé sur votre machine, téléchargez-le gratuitement :
- **Linux** : https://docs.docker.com/engine/install/ubuntu/
- **Windows / Mac** : https://www.docker.com/products/docker-desktop/

Vérifiez que Docker fonctionne en ouvrant un terminal et en tapant :

```bash
docker --version
```

### Etape 2 — Lancer le projet

Ouvrez un terminal dans le dossier du projet et lancez :

```bash
docker compose up
```

Docker va automatiquement :
1. Démarrer un serveur web **Nginx** sur le port `8000` pour afficher votre site.
2. Démarrer un serveur **Node.js** sur le port `8081` qui fait tourner le proxy local de Decap CMS, permettant d'enregistrer vos articles directement sur votre disque dur sans passer par Internet.

### Etape 3 — Accéder au site

Une fois Docker lancé, ouvrez votre navigateur :

| Adresse | Description |
|---|---|
| `http://localhost:8000` | Le site public avec toutes les sections |
| `http://localhost:8000/admin` | Le panneau d'administration pour écrire des articles |

### Arreter Docker

Pour stopper les serveurs, retournez dans le terminal et appuyez sur `Ctrl + C`, ou lancez :

```bash
docker compose down
```

---

## Utiliser le Panneau d'Administration (CMS)

Une fois Docker lancé, rendez-vous sur `http://localhost:8000/admin`.

> En mode local, aucun mot de passe n'est demandé. Vous entrez directement dans l'interface d'administration.

### Creer un nouvel article de blog

1. Cliquez sur **"Articles de Blog"** dans le menu de gauche.
2. Cliquez sur le bouton **"Nouvel article de blog"** en haut à droite.
3. Un formulaire d'édition s'affiche avec les champs suivants :
   - **Titre de l'article** : Le titre qui apparaitra sur la carte du blog.
   - **Date de publication** : Sélectionnez la date dans le calendrier.
   - **Description / Résumé court** : Le texte de présentation affiché sur la carte.
   - **Catégorie / Tag** : Le label de catégorie (ex : "Enquête", "Analyse", "Réponse").
   - **Image de couverture** : Cliquez sur le bouton pour téléverser une photo depuis votre ordinateur. Elle sera enregistrée dans `images/uploads/`.
   - **Contenu de l'article** : La grande zone de texte principale. Vous pouvez écrire librement, mettre du texte **en gras**, en *italique*, ajouter des titres et des listes à puces grâce à la barre d'outils en haut.

### Ajouter une photo dans le corps du texte

Dans la zone de texte principale, cliquez sur l'icône **image** dans la barre d'outils (l'icône ressemble à une petite montagne). Une fenêtre s'ouvre pour choisir ou téléverser une image depuis votre ordinateur.

### Sauvegarder et publier

Quand votre article est prêt, cliquez sur le bouton **"Publier maintenant"** en haut. Decap CMS enregistre immédiatement un fichier Markdown dans le dossier `_posts/` de votre projet.

---

## Authentification et Sécurité de l'Admin

### En local (sur votre ordinateur)

Aucun mot de passe n'est requis. L'option `local_backend: true` dans le fichier `admin/config.yml` indique au CMS qu'il fonctionne en mode développement local et qu'il peut accepter les connexions sans vérification.

### En production (site public en ligne)

Une fois le site déployé sur Netlify, l'accès à `/admin` est entièrement sécurisé par e-mail et mot de passe via le service **Netlify Identity**. Voir la section suivante pour la configuration complète.

---

## Déploiement en ligne sur Netlify

Netlify permet d'héberger votre site gratuitement et d'activer l'authentification sécurisée pour le panneau d'administration.

### Etape 1 — Mettre le projet sur GitHub

Créez un dépôt Git et poussez votre projet sur GitHub :

```bash
git init
git add .
git commit -m "premier commit"
git remote add origin https://github.com/votre-nom/votre-depot.git
git push -u origin main
```

### Etape 2 — Connecter le dépôt à Netlify

1. Créez un compte gratuit sur [netlify.com](https://netlify.com).
2. Cliquez sur **"Add new site" > "Import an existing project"**.
3. Sélectionnez votre dépôt GitHub.
4. Netlify détecte automatiquement que le projet est un site statique. Laissez les paramètres par défaut et cliquez sur **"Deploy site"**.
5. Votre site est en ligne en moins d'une minute.

### Etape 3 — Activer l'authentification (Netlify Identity)

Pour sécuriser le panneau d'administration `/admin` :

1. Dans votre tableau de bord Netlify, allez dans **Site configuration > Identity**.
2. Cliquez sur **"Enable Identity"**.
3. Sous **Registration**, choisissez **"Invite only"** (sur invitation uniquement). Ainsi, personne d'autre que vous ne pourra créer de compte.
4. Descendez jusqu'à **Services** et cliquez sur **"Enable Git Gateway"**. C'est ce service qui autorise le CMS à écrire et modifier des fichiers dans votre dépôt GitHub.

### Etape 4 — Créer votre compte administrateur

1. Toujours dans **Identity**, cliquez sur **"Invite users"** et entrez votre propre adresse e-mail.
2. Vous recevrez un e-mail avec un lien d'invitation. Cliquez sur ce lien.
3. Définissez votre mot de passe personnel.
4. Allez sur `votresite.netlify.app/admin`. Le panneau de connexion s'affiche. Entrez votre e-mail et mot de passe.

Vous avez maintenant accès à l'administration depuis n'importe quel appareil (ordinateur, tablette, téléphone) avec votre compte sécurisé.

### Etape 5 — Desactiver le mode local pour la production

> **Important** : Avant de déployer, désactivez le proxy local dans `admin/config.yml` en mettant la ligne `local_backend` en commentaire ou en la supprimant, sinon le CMS en production ne saura pas qu'il doit utiliser Git Gateway.

```yaml
# local_backend: true   # <-- Commenter ou supprimer cette ligne pour la production
backend:
  name: git-gateway
  branch: main
```
# Antiplateformejaune
