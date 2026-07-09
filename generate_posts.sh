#!/bin/bash
# Ce script génère posts.json à partir des fichiers Markdown dans _posts/
# À lancer après chaque ajout d'article : bash generate_posts.sh

POSTS_DIR="_posts"
OUTPUT="posts.json"

echo "[" > "$OUTPUT"
first=true

for f in "$POSTS_DIR"/*.md; do
  [ -f "$f" ] || continue

  # Extraire le slug (nom du fichier sans extension)
  slug=$(basename "$f" .md)

  # Extraire les métadonnées YAML front matter
  title=$(grep -m1 '^title:' "$f" | sed 's/^title: *//' | tr -d '"'"'" )
  date=$(grep -m1 '^date:' "$f" | sed 's/^date: *//' | tr -d '"'"'" | cut -d'T' -f1)
  tag=$(grep -m1 '^tag:' "$f" | sed 's/^tag: *//' | tr -d '"'"'" )
  description=$(grep -m1 '^description:' "$f" | sed 's/^description: *//' | tr -d '"'"'" )
  image=$(grep -m1 '^image:' "$f" | sed 's/^image: *//' | tr -d '"'"'" )
  author=$(grep -m1 '^author:' "$f" | sed 's/^author: *//' | tr -d '"'"'" )

  # Valeurs par défaut si vides
  [ -z "$title" ] && title="$slug"
  [ -z "$tag" ] && tag="Article"
  [ -z "$description" ] && description=""
  [ -z "$image" ] && image=""
  [ -z "$author" ] && author="Anti Plateforme Jaune Action"

  if [ "$first" = true ]; then
    first=false
  else
    echo "," >> "$OUTPUT"
  fi

  cat >> "$OUTPUT" <<EOF
  {
    "slug": "$slug",
    "title": "$title",
    "date": "$date",
    "tag": "$tag",
    "description": "$description",
    "image": "$image",
    "author": "$author"
  }
EOF
done

echo "]" >> "$OUTPUT"
echo "✅ posts.json généré avec succès."
