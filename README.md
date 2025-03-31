# docker-images

Ensemble d'images Docker personnalisées

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

## Préparation des images (Exemple)

Pour mise à jour globale des images
```bash
./.scripts/push-base-images.sh
```

* Pour les images en provenance de Docker Hub, sans modification > Voir script dédié [push-base-images.sh](.scripts/push-base-images.sh)
* Pour les images de bases personnalisées :
    * [Build projets PHP](php-tools/README.md)
    * [Run projets PHP](php-runner/README.md)

## Github Administration - Public Docker Image

Par défaut, les repositories Github sont privé, pour les passer en publiques:

* Désactiver "Inherit access from source repository" > https://github.com/settings/packages
* Sélectionner le package concerné > https://github.com/orgs/laveracloudsolutions/packages
* Package Setting > Danger Zone > Change Visibility