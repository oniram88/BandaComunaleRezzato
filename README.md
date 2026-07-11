# Development

# TAG speciali per post
Se vuoi far si che un post risulti in primo piano della home aggiungi il tag:
```text
tag: primo_piano
```

## Sviluppo locale con Docker Compose

Prerequisiti: Docker + Docker Compose plugin.

Dalla root del progetto (`BandaComunaleRezzato`), usa questi comandi:

```bash
docker compose up -d --build app
docker compose logs -f app
```

Il sito e' disponibile su `http://localhost:4000`.

Comandi utili:

```bash
docker compose ps app
docker compose exec app sh
docker compose down
```

## Simulazione action GitHub in locale

Flusso documentato nel repository:

1. entra in `.github/actions/build-dist-site`
2. builda l'immagine
3. dalla root del sito esegui il container con `LOCAL_BUILD=1`

```bash
cd .github/actions/build-dist-site
docker build -t immagine_banda .

cd /percorso/assoluto/BandaComunaleRezzato
docker run --rm -it -v "$PWD:/site_builder/repo" -e LOCAL_BUILD=1 immagine_banda
```
