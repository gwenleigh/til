CONTAINER_NAME="postgres_test"

docker pull postgres;
docker run --name $CONTAINER_NAME -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres;

sleep 3;
docker ps;

sleep 2; 
docker container rm --force $CONTAINER_NAME;
docker ps -a;