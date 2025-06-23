# docker-images

Ensemble d'images Docke
r "de bases", issues de Docker Hub puis poussé sur le Github (ghcr.io) Petrolavera

Permet de palier au problème de quota mis en place sur Docker Hub
> https://docs.docker.com/docker-hub/usage/

## Push des Images Docker dans le Registry Github

### Prérequis

Créer un "Personal Access Token" > https://github.com/settings/tokens

> Go to your GitHub account settings.
> Navigate to Developer settings > Personal access tokens.
> Create a new token with sufficient permissions
> * write:packages
> * delete:packages

### Docker Login

```bash
GHCR_USERNAME="XXX"
GHCR_PAT="XXX"
echo $GHCR_PAT | docker login ghcr.io -u GHCR_USERNAME --password-stdin
```

## Mise à jour des images (depuis un poste de Dev)

Pour mettre à jour l'ensemble des images depuis un poste de Dev

```bash
./.scripts/build_and_push.sh
```

## Mise à jour des images (depuis via Github Action)

* Les images peuvent être mise à jour via un pipeline Github Action (voir section "cron" dans le fichier [build.yml](.github/workflows/build.yml))
> https://github.com/laveracloudsolutions/docker-images/actions

* Les images sont mises à jour périodiquement 
> Voir section "cron" dans le fichier [build.yml](.github/workflows/build.yml)


## Github Administration - Public Docker Image

Par défaut, les repositories Github sont privé, pour les passer en publiques:

* Désactiver "Inherit access from source repository" > https://github.com/settings/packages
* Sélectionner le package concerné > https://github.com/orgs/laveracloudsolutions/packages
* Package Setting > Danger Zone > Change Visibility

## Github Action - Mise à jour régulière

