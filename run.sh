docker build -t blast .
docker run --rm -ti -v "$(pwd)/workdir:/blast" blast '/blast/run.sh'