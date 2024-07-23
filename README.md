

Download snapshot

```

cd <snapshots directory>

# Fetch the snapshot URL
export SNAPSHOT_URL=$(curl -s https://osmosis.fra1.digitaloceanspaces.com/osmo-test-5/snapshots/latest)

# Extract the file name from the URL
SNAPSHOT_NAME=$(basename "$SNAPSHOT_URL")

# Print the file name
echo "The file name is: $SNAPSHOT_NAME"

# Download the file using wget
wget "$SNAPSHOT_URL"

```

Build image

```
docker build -t osmosis-node -f Dockerfile-osmosis-node .
```


Run image with directory onto previously downloaded snapshot
```

CONT_ID=$(docker run -v ~/snapshots:/root/snapshots -e SNAPSHOT_NAME=$SNAPSHOT_NAME -p 26656:26656 -p 26657:26657 -d osmosis-node)


```

Optionally you can use a volume to keep the data outside of the docker image


```
mkdir -p ~/states/osmosis3
CONT_ID=$(docker run -v ~/snapshots:/root/snapshots -v ~/states/osmosis3:/root/.osmosisd -e SNAPSHOT_NAME=$SNAPSHOT_NAME -p 26656:26656 -p 26657:26657 -d osmosis-node)
```



Check logs of the container

```
docker ps
docker logs $CONT_ID -f
```


kill the container

```
docker ps
docker kill $CONT_ID
```
