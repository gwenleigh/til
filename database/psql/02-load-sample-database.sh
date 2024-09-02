# Reference
# https://gist.github.com/gbritton1/e88f96fad5936927b4d486c0d7b228f6


CONTAINER_NAME="postgres_test"
SAMPLE_DATA="pgdata"

# Create a docker volume for persistent storage and rebuild the container. 
docker volume create $SAMPLE_DATA;
docker run --name $CONTAINER_NAME -v $SAMPLE_DATA:/var/lib/postgresql/data -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres;

# Open a shell prompt inside the container.
docker exec -it $CONTAINER_NAME bash 


############################################################################################################
# Linux shell commands inside the docker container. 
############################################################################################################

apt-get update
apt-get install wget

# Pull the dell test e-commerce database files
cd /tmp
wget http://linux.dell.com/dvdstore/ds21.tar.gz
wget http://linux.dell.com/dvdstore/ds21_postgresql.tar.gz

# Decompress both files
tar -zxvf ds2.tar.gz
tar -zxvf ds21_postgresql.tar.gz

# Customise the build script with the username and password we are using. 
cd /tmp/ds2/pgsqlds2
sed -e 's/SYSDBA=ds2/SYSDBA=postgres/' -e 's/PGPASSWORD="ds2"/PGPASSWORD="mysecretpassword"/' pgsqlds2_create_all.sh > pgsqlds2_create_all_custom.sh

# Run the build script for the e-commerce database.
bash pgsqlds2_create_all_custom.sh