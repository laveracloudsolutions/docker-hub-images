# docker-images

Ensemble d'image Docker personnalisées

[[_TOC_]]

## Push des Images Docker dans le Registry Github

* Prérequis

Créer un "Personal Access Token" > https://github.com/settings/tokens

> Go to your GitHub account settings.
> Navigate to Developer settings > Personal access tokens.
> Create a new token with sufficient permissions
> * write:packages
> * delete:packages

* Docker Login

```
GHCR_USERNAME="XXX"
GHCR_PAT="XXX"
echo $GHCR_PAT | docker login ghcr.io -u GHCR_USERNAME --password-stdin
```

## Préparation des images (Exemple)

```
# Tagguer l'image
docker build -t ghcr.io/laveracloudsolutions/php:8.3.13-apache-bookworm .
docker push ghcr.io/laveracloudsolutions/php:8.3.13-apache-bookworm
```

## Github Administration - Public Docker Image

1- Désactiver "Inherit access from source repository" > https://github.com/settings/packages
2- Sélectionner le package concerné > https://github.com/orgs/laveracloudsolutions/packages
3- Package Setting > Danger Zone > Change Visibility