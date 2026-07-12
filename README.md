# <img src="logo.png" alt="Logo Antiplateformejaune" width="50" valign="middle"> Antiplateformejaune — Contre-Enquête PlateformeJaune

[![Site en ligne](https://img.shields.io/badge/Site-antiplateformejaune.netlify.app-9B3A2F?style=flat)](https://antiplateformejaune.netlify.app)
[![CMS](https://img.shields.io/badge/CMS-Decap%20CMS-f2c94c?style=flat)](https://antiplateformejaune.netlify.app/admin/)
[![Open Source](https://img.shields.io/badge/Open%20Source-GitHub-1f2329?style=flat&logo=github)](https://github.com/lignerouge/Antiplateformejaune)

Dossier d'enquête documentant les contradictions politiques et éthiques de l'organisation **PlateformeJaune** et les dérives de son dirigeant **Jean Gillot**.

---

## Sommaire

- [Ce que documente le site](#ce-que-documente-le-site)
- [Architecture & Technologies](#architecture--technologies)
- [Structure du Projet](#structure-du-projet)
- [Lancement en Local avec Docker](#lancement-en-local-avec-docker)
- [Utiliser le Panneau d'Administration (CMS)](#utiliser-le-panneau-dadministration-cms)
- [Comment fonctionne le blog](#comment-fonctionne-le-blog)
- [Déploiement sur Netlify](#déploiement-sur-netlify)

---

## Ce que documente le site

**11 contradictions documentées** entre la théorie affichée par PlateformeJaune et ses actions concrètes :

1. **Sectarisme** — programme fermé en 15 points contredisant leur rejet des sectes politiques.
2. **Soutien à ATR** — mouvance éco-extrémiste, transphobe et sexiste issue de DGR.
3. **Antidémocratie** — doctrine de minorité auto-mandatée érigée en principe révolutionnaire.
4. **Anti-immigration & Validisme** — hostilité à l'immigration et pathologisation des croyants.
5. **Culte de la personnalité** — Lénine remplacé par Fanny Kaplan sans régler le problème du culte.
6. **Harcèlement sexiste de Jean Gillot** — attaques répétées contre des militantes dont [@harunoyosei](https://x.com/harunoyosei).
7. **Falsification de Rosa Luxemburg** — usage opportuniste de ses écrits contre leur propre programme minoritaire.
8. **Psychiatrisation en ligne** — Gillot décrète publiquement l'état mental de ses contradicteurs.
9. **Double standard sur les violences sexistes** — indignation historique, silence sur le harcèlement contemporain.
10. **Négation du patriarcat** — assimilation du sexisme systémique à une prétendue « misandrie ».
11. **Falsification de l'identité de la TCI** — la TCI qualifiée de « conseilliste » alors qu'elle est issue de la Gauche communiste italienne daministe.

---

## Architecture & Technologies

| Composant | Technologie |
|---|---|
| Frontend | HTML5 sémantique + CSS3 (Grid, Flexbox, variables CSS) |
| CMS | [Decap CMS](https://decapcms.org/) — interface d'administration sans base de données |
| Authentification | Netlify Identity Widget |
| Lecteur d'articles | JavaScript vanilla + [marked.js](https://marked.js.org/) (rendu Markdown) |
| Déploiement | Netlify (build automatique à chaque commit GitHub) |
| Build | Script Bash `generate_posts.sh` exécuté par Netlify à chaque déploiement |

---

## Structure du Projet

```text
├── admin/
│   ├── config.yml            # Configuration Decap CMS (champs, collections, médias)
│   └── index.html            # Panneau d'administration
├── _posts/
│   └── YYYY-MM-DD-slug.md    # Articles créés via le CMS (Markdown + YAML front matter)
├── images/
│   └── uploads/              # Photos téléversées via l'administration
├── index.html                # Page principale (dossier d'enquête + blog)
├── article.html              # Lecteur dynamique d'articles (lit les fichiers .md)
├── style.css                 # Feuille de style commune
├── posts.json                # Index des articles (généré automatiquement par Netlify)
├── generate_posts.sh         # Script de génération de posts.json
├── netlify.toml              # Configuration du build Netlify
├── synthese_contradictions.md # Article de synthèse journalistique (11 points)
├── cover_investigation.png   # Image de couverture de l'article de réponse
├── hero.png                  # Visuel principal de la page d'accueil
├── logo.png                  # Logo rouge-brun du site
├── change_org_banner.png     # Bannière pétition Change.org
└── README.md                 # Ce fichier
```

---

## Lancement en Local avec Docker

Docker permet de lancer le site et le panneau d'administration localement sans rien installer d'autre.

### Pré-requis : installer Docker

- **Linux** : https://docs.docker.com/engine/install/ubuntu/
- **Windows / Mac** : https://www.docker.com/products/docker-desktop/

Vérifiez l'installation :
```bash
docker --version
```

### Lancer le projet

```bash
docker compose up
```

Docker démarre automatiquement :
- Un serveur **Nginx** sur `http://localhost:8000` pour le site.
- Un serveur **Node.js** sur `http://localhost:8081` pour le proxy local de Decap CMS.

### Accès local

| Adresse | Description |
|---|---|
| `http://localhost:8000` | Site public |
| `http://localhost:8000/admin` | Panneau d'administration (sans mot de passe en local) |

### Arrêter Docker

```bash
docker compose down
```

---

## Utiliser le Panneau d'Administration (CMS)

Rendez-vous sur `/admin` (en local) ou `https://antiplateformejaune.netlify.app/admin` (en ligne).

### Créer un article

1. Cliquez sur **"Articles de Blog"** dans le menu de gauche.
2. Cliquez sur **"Nouvel article de blog"**.
3. Remplissez les champs :
   - **Titre** — apparaît en grand sur la page de l'article et sur la carte du blog.
   - **Date de publication** — sélectionnez dans le calendrier.
   - **Description / Résumé** — texte court affiché sur la carte du blog.
   - **Catégorie / Tag** — label coloré (ex : « Enquête », « Analyse »).
   - **Image de couverture** — photo affichée en miniature sur la carte ET en grand en haut de l'article.
   - **Contenu** — zone de texte Markdown avec barre d'outils (gras, italique, titres, listes, images).
4. Cliquez sur **"Publier maintenant"**.

### Ce qui se passe après la publication

Decap CMS enregistre automatiquement un fichier `.md` dans `_posts/` sur GitHub. Netlify détecte ce commit, exécute `generate_posts.sh` pour régénérer `posts.json`, et redéploie le site. L'article apparaît sur la page d'accueil **en moins d'une minute**, sans aucune commande manuelle.

> **Note** : Les noms de fichiers avec des accents (é, à, ê...) sont supportés depuis le correctif de juillet 2026 (`encodeURIComponent` dans `article.html`).

---

## Comment fonctionne le blog

### Flux automatique complet

```
Publication dans /admin/
       ↓
Decap CMS commit le .md sur GitHub
       ↓
Netlify détecte le commit → exécute generate_posts.sh
       ↓
posts.json régénéré avec le nouvel article
       ↓
Site redéployé (~30 secondes)
       ↓
Article visible sur la page d'accueil ✅
```

### Format des articles (YAML Front Matter)

Chaque article dans `_posts/` est un fichier Markdown avec des métadonnées en en-tête :

```markdown
---
layout: blog
title: "Mon article"
date: 2026-07-12T20:00:00.000Z
description: "Résumé court affiché sur la carte."
tag: "Enquête"
image: "/images/uploads/ma-photo.jpg"
author: "Anti Plateforme Jaune Action"
---

Contenu de l'article en **Markdown**.
```

### Lecteur d'articles

`article.html` lit le paramètre `?post=` dans l'URL (ex: `article.html?post=2026-07-12-mon-article`), charge le fichier `.md` correspondant via `fetch()` avec `encodeURIComponent` pour supporter les caractères accentués, parse le Markdown avec `marked.js` et affiche le résultat.

---

## Déploiement sur Netlify

### Première mise en ligne

1. **Pousser sur GitHub** :
   ```bash
   git add .
   git commit -m "premier déploiement"
   git push
   ```

2. **Connecter à Netlify** :
   - Allez sur [netlify.com](https://netlify.com) → **"Add new site" → "Import an existing project"**.
   - Sélectionnez le dépôt GitHub `lignerouge/Antiplateformejaune`.
   - Netlify détecte `netlify.toml` et configure le build automatiquement.
   - Cliquez sur **"Deploy site"**.

3. **Activer Identity + Git Gateway** :
   - Dans **Site configuration → Identity** → **"Enable Identity"**.
   - Changez Registration sur **"Invite only"**.
   - Descendez jusqu'à **Services** → **"Enable Git Gateway"** et autorisez l'accès GitHub.

4. **Créer votre compte admin** :
   - Dans **Identity** → **"Invite users"** → entrez votre e-mail.
   - Ouvrez le mail reçu, cliquez sur le lien et définissez votre mot de passe.
   - Connectez-vous sur `https://antiplateformejaune.netlify.app/admin`.

5. **Assigner le rôle admin** ⚠️ :
   - Dans **Identity** → cliquez sur votre utilisateur.
   - Dans le champ **Roles**, tapez `admin` et sauvegardez.
   - Sans ce rôle, Git Gateway refusera les écritures depuis le CMS (`ACCESS_TOKEN_ERROR`).

### Désactiver le mode local avant de déployer

Le fichier `admin/config.yml` contient `# local_backend: true` (en commentaire). Cette ligne ne doit **jamais** être décommentée sur la branche de production — elle est réservée au développement local avec Docker.

```yaml
# local_backend: true   ← rester en commentaire pour la production
backend:
  name: git-gateway
  branch: main
```

### Mises à jour ultérieures

Netlify redéploie automatiquement à chaque `git push`. Pour une modification manuelle :

```bash
git add .
git commit -m "description du changement"
git push
```

