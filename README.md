# Development

Simulazione action github locale:

andare nella cartella

`.github/actions/build-dist-site`

e fare la build

`docker build -t immagine_banda .`

poi dalla cartella del sito lanciare:

`docker run --rm -it -v $PWD:/site_builder/repo -e LOCAL_BUILD=1 immagine_banda`
