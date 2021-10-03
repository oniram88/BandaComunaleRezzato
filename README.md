# Development

andare nella cartella
`.github/actions/build-dist-site`
e fare la build
`docker build -t test .`
poi dalla cartella del sito lanciare:
`docker run --rm -it -v $PWD:/site_builder/repo -e LOCAL_BUILD=1 test`